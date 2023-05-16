package com.surup.board.controller;

import com.surup.board.domain.UserDto;
import com.surup.board.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Controller
public class SignUpController {
    @Autowired
    UserService userService;

    @GetMapping("/signup")
    public String signup() {
        return "signUp";
    }

    @ResponseBody
    @PostMapping("/idCheck")
    public HashMap idCheck(@RequestBody String id) {
        return fetch_dupl_check(id, "id");
    }

    @ResponseBody
    @PostMapping("/nicknameCheck")
    public HashMap nicknameCheck(@RequestBody String nickname) {
        return fetch_dupl_check(nickname, "nickname");
    }

    @PostMapping("/signup")
    public String registerUser(UserDto userDto, Model m, boolean policy_agree, RedirectAttributes reattr) {
        // 유효성 검사
        System.out.println("userDto = " + userDto);
        String id = userDto.getId();
        String pwd = userDto.getPwd();
        String pwdcheck = userDto.getPwdcheck();
        String username = userDto.getUsername();
        String nickname = userDto.getNickname();
        Character sex = userDto.getSex();
        Integer resident_registration_number = userDto.getResident_registration_number();
        String email = userDto.getEmail();

        String idRegExp = "[a-zA-Z0-9]{5,12}$"; // id 5~12, 대소 영문, 숫자
        String pwdRegExp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,16}$"; // pwd 8~16 대소 영문 + 숫자 + 특수 문자
        String usernameRegExp = "[a-zA-Z가-힣]{2,10}$"; // username 2~10 대소 영문, 한글
        String nicknameRegExp = "[a-zA-Z0-9가-힣]{2,10}$"; // nickname 2~10 한글, 영어, 숫자 가능 (필수, ‘작성자’로 사용)
        String birthRegExp = "[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|[3][01])$"; // 주민번호 앞자리 6
        String emailRegExp = "\\w+@\\w+\\.\\w+(\\.\\w+)?"; // email 형식

        // id, pwd, email 중복 체크
        String dupl_check = dupl_check(m, id, "id");
        if (dupl_check != null) return dupl_check; // id 중복 체크
        dupl_check = dupl_check(m, nickname, "nickname");
        if (dupl_check != null) return dupl_check; // nickname 중복 체크
        dupl_check = dupl_check(m, email, "email");
        if (dupl_check != null) return dupl_check; // email 중복 체크

        // 유효성 체크
        String validation_check = validation(userDto, m, id, idRegExp, "id", "", policy_agree);
        if (validation_check != null) return validation_check; // id validation check
        validation_check = validation(userDto, m, pwd, pwdRegExp, "pwd", "", policy_agree);
        if (validation_check != null) return validation_check; // pwd validation check
        validation_check = validation(userDto, m, pwdcheck, "", "pwdcheck", pwd, policy_agree);
        if (validation_check != null) return validation_check; // pwdcheck validation check
        validation_check = validation(userDto, m, username, usernameRegExp, "username", "", policy_agree);
        if (validation_check != null) return validation_check; // username validation check
        validation_check = validation(userDto, m, nickname, nicknameRegExp, "nickname", "", policy_agree);
        if (validation_check != null) return validation_check; // nickname validation check
        validation_check = validation(userDto, m, sex, "", "sex", "", policy_agree);
        if (validation_check != null) return validation_check; // sex validation check
        validation_check = validation(userDto, m, resident_registration_number, birthRegExp, "birth", "", policy_agree);
        if (validation_check != null) return validation_check; // birth validation check
        validation_check = validation(userDto, m, email, emailRegExp, "email", "", policy_agree);
        if (validation_check != null) return validation_check; // email validation check
        validation_check = validation(userDto, m, "", "", "policy_agree", "", policy_agree);
        if (validation_check != null) return validation_check; // policy_agree validation check

        // 유효성 검사 완료 시, 생일 형식 변환 후 변환
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");
            StringBuffer stringBuffer = new StringBuffer(resident_registration_number.toString());
            stringBuffer.insert(2, "-");
            stringBuffer.insert(5, "-");
            Date birth = dateFormat.parse(stringBuffer.toString());
            userDto.setBirth(birth);
        } catch (ParseException e) {
            e.printStackTrace();
            m.addAttribute(userDto);
            m.addAttribute("msg", "REGISTER_FAIL");
            return "signUp";
        }

        // 유효성 검사 문제 없을 시, DB에 작성 내용 저장
        try {
            int row_cnt = userService.registerUser(userDto);
            if (row_cnt != 1) throw new Exception("user register fail");
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(userDto);
            m.addAttribute("msg", "REGISTER_FAIL");
            return "signUp";
        }

        reattr.addFlashAttribute("msg", "REGISTER_SUCCESS");
        return "redirect:/login";
    }


    // 메서드
    // 실시간 id, nickname, email 중복 검사 메서드
    private HashMap fetch_dupl_check(String data, String checkObject) {
        HashMap map = new HashMap();
        UserDto dupl_check = null;
        String trans_data = data.substring(1, data.length() - 1);
        try {
            if (checkObject == "id") dupl_check = userService.duplIdCheck(trans_data);
            if (checkObject == "nickname") dupl_check = userService.duplNicknameCheck(trans_data);

            if (dupl_check != null) throw new Exception(checkObject + "중복");

            if (checkObject == "id") map.put("word", "* 사용할 수 있는 아이디입니다.");
            if (checkObject == "nickname") map.put("word", "* 사용할 수 있는 닉네임입니다.");

            map.put("color", "#0086e5");
            return map;
        } catch (Exception e) {
            e.printStackTrace();

            if (checkObject == "id") map.put("word", "* 동일한 아이디가 이미 존재합니다.");
            if (checkObject == "nickname") map.put("word", "* 동일한 닉네임이 이미 존재합니다.");

            map.put("color", "red");
            return map;
        }
    }

    // 유효성 검사 중 id, nickname, email 중복 검사 메서드
    private String dupl_check(Model m, String data, String checkObject) {
        UserDto dupl_check = null;
        try {
            if (checkObject == "id") dupl_check = userService.duplIdCheck(data);
            if (checkObject == "nickname") dupl_check = userService.duplNicknameCheck(data);
            if (checkObject == "email") dupl_check = userService.duplEmailCheck(data);

            if (dupl_check != null) throw new Exception(checkObject + "중복");
        } catch (Exception e) {
            e.printStackTrace();

            if (checkObject == "id") m.addAttribute("msg", "ID_DUPLICATION");
            if (checkObject == "nickname") m.addAttribute("msg", "NICKNAME_DUPLICATION");
            if (checkObject == "email") m.addAttribute("msg", "EMAIL_DUPLICATION");

            return "signUp";
        }
        return null;
    }

    // 요소 검사 메서드
    private static String validation(UserDto userDto, Model m, Object data, String regExp, String checkObject, String pwd, boolean policy_agree) {
        try {
            if (checkObject == "sex") {
                if (data == null) throw new Exception("sex validation fail");
            } else if (checkObject == "pwdcheck") {
                if (!(data.equals(pwd))) throw new Exception("pwdcheck validation fail");
            } else if (checkObject == "policy_agree") {
                if(!policy_agree) throw new Exception("policy_agree false");
            } else {
                if (!(data.toString().matches(regExp))) throw new Exception(checkObject + "validation fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(userDto);

            if (checkObject == "id") m.addAttribute("msg", "ID_FAIL");
            if (checkObject == "pwd") m.addAttribute("msg", "PWD_FAIL");
            if (checkObject == "pwdcheck") m.addAttribute("msg", "PWD_CHECK_FAIL");
            if (checkObject == "username") m.addAttribute("msg", "USERNAME_FAIL");
            if (checkObject == "nickname") m.addAttribute("msg", "NICKNAME_FAIL");
            if (checkObject == "sex") m.addAttribute("msg", "SEX_FAIL");
            if (checkObject == "birth") m.addAttribute("msg", "BIRTH_FAIL");
            if (checkObject == "email") m.addAttribute("msg", "EMAIL_FAIL");
            if (checkObject == "policy_agree") m.addAttribute("msg", "POLICY_AGREE_FAIL");

            return "signUp";
        }
        return null;
    }
}
