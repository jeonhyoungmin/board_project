package com.surup.board.controller;

import com.surup.board.domain.UserDto;
import com.surup.board.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;


@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/certification")
    public String certificationPage() {
        return "certification";
    }

    @PostMapping("/certification")
    public String certification(String id, String pwd, Model m,
                                HttpSession session, HttpServletRequest request, RedirectAttributes rattr) {
        Object sessionGetAttributeId = session.getAttribute("id");
        UserDto userDto = null;
        if (sessionGetAttributeId == null) {
            StringBuffer toURL = request.getRequestURL();
            m.addAttribute("toURL", toURL);
            m.addAttribute("msg", "LOGIN_NEED");
            return "logIn";
        }
        if (!(userCheck(sessionGetAttributeId.toString(), pwd) && sessionGetAttributeId.equals(id))) {
            rattr.addFlashAttribute("msg", "USER_CHECK_FAIL");
            return "redirect:/certification";
        }
        try {
            userDto = userService.getUser(id);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/certification";
        }

        // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
        transLDTtoLD(userDto);
        m.addAttribute(userDto);
        return "myInfo";
    }

    @PostMapping("/myinfo")
    public String modifyUser(HttpSession session, UserDto userDto, Model m) {
        String id = (String) session.getAttribute("id");
        String pwd = userDto.getPwd();
        String pwdcheck = userDto.getPwdcheck();
        String pwdRegExp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,16}$"; // pwd 8~16 대소 영문 + 숫자 + 특수 문자
        try {
            // pwd 유효성 검사
            if (!pwd.matches(pwdRegExp)) {
                userDto = userService.getUser(id);
                throw new Exception("pwd validation fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
            transLDTtoLD(userDto);
            m.addAttribute(userDto);
            m.addAttribute("msg", "PWD_FAIL");
            return "myInfo";
        }

        try {
            // pwdcheck 유효성 검사
            if (!pwdcheck.equals(pwd)) {
                userDto = userService.getUser(id);
                throw new Exception("pwd validation fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
            transLDTtoLD(userDto);
            m.addAttribute(userDto);
            m.addAttribute("msg", "PWD_CHECK_FAIL");
            return "myInfo";
        }

        try {
            // 유효성 검사 통과 후 update
            LocalDateTime now = LocalDateTime.now();
            userDto.setUp_date(now);
            userDto.setId(id);
            userService.updatePwd(userDto);
        } catch (Exception e) {
            e.printStackTrace();
            // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
            transLDTtoLD(userDto);
            m.addAttribute(userDto);
            m.addAttribute("msg", "PWD_UPDATE_FAIL");
            return "myInfo";
        }
        try {
            // update 후 사용자의 데이터를 다시 검색하여 myInfo 페이지에 보여주기
            userDto = userService.getUser(id);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "SERVER_FAIL");
            return "redirect:/";
        }

        // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
        transLDTtoLD(userDto);
        m.addAttribute(userDto);
        m.addAttribute("msg", "PWD_UPDATE_SUCCESS");
        return "myInfo";
    }

    @DeleteMapping("/myinfo")
    public String deleteAccount(UserDto userDto, Model m,
                                HttpServletResponse response,
                                HttpSession session, RedirectAttributes rattr) {
        String id = (String) session.getAttribute("id");
        try {
            userService.deleteAccount(id);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                userDto = userService.getUser(id);
            } catch (Exception ex) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "SERVER_FAIL");
                return "redirect:/";
            }
            // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
            transLDTtoLD(userDto);
            m.addAttribute(userDto);
            m.addAttribute("msg", "USER_DELETE_FAIL");
            return "myInfo";
        }
        Cookie cookie = new Cookie("id", id);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        session.invalidate();

        rattr.addFlashAttribute("msg", "USER_DELETE_SUCCESS");
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "logIn";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, boolean rememberId,
                        HttpServletRequest request, HttpServletResponse response) {
        // 로그인
        // 1. 아이디, 비번 일치 확인
        if (!userCheck(id, pwd)) {
            // 2. 불일치 시, "아이디 또는 비밀번호가 일치하지 않습니다." redirect
            return checkFailMsg();
        }
        // 3. 일치 시, session에 id 추가
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        session.setMaxInactiveInterval(60*60); // 60분 후 session 자동 종료
        // 4. rememberId
        if (rememberId) {
            // 4-1. true일 시, Cookie에 id를 저장하고 응답에 추가
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        } else {
            // 4-2. false일 시, Cookie 삭제 후 응답에 추가
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        // 5. login을 요청한 페이지로 이동하도록 redirect
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;

        return "redirect:" + toURL;
//        return "home";
    }


    private static String checkFailMsg() { // 아이디 또는 비밀번호가 일치하지 않을 시, 오류 메시지 전달 메서드
        try {
            String msg = URLEncoder.encode("* 아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
            return "redirect:/login?msg=" + msg;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return "redirect:/login?msg=FAIL";
        }
    }

    private boolean userCheck(String id, String pwd) { // 로그인을 위한 아이디와 비밀번호 검사 메서드
        UserDto user = null;
        try {
            user = userService.getUser(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user != null && user.getPwd().equals(pwd);
    }

    private static void transLDTtoLD(UserDto userDto) { // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환 메서드
        Integer year = userDto.getReg_date().getYear();
        Integer month = userDto.getReg_date().getMonthValue();
        Integer day = userDto.getReg_date().getDayOfMonth();
        LocalDate reg_date = LocalDate.of(year, month, day);
        userDto.setTrans_reg_date(reg_date);
    }
}
