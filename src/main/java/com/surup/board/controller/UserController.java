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
import java.time.LocalDate;
import java.time.LocalDateTime;


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
                                HttpSession session, RedirectAttributes rattr) {
        Object sessionGetAttributeId = session.getAttribute("id"); // 세션에 저장한 유저 id

        if (sessionGetAttributeId == null) { // 세션의 id 값이 비어 있으면, 곧 비 로그인 상태이면 로그인 페이지로 이동
            // 현재 페이지의 url을 담아 전달. 로그인 페이지에서 자체적으로 해결하도록 변경
            // StringBuffer toURL = request.getRequestURL();
            // m.addAttribute("toURL", toURL);
            // return "logIn";

            rattr.addAttribute("msg", "LOGIN_NEED");
            return "redirect:/login";
        }
        if (!(userCheck(sessionGetAttributeId.toString(), pwd) && sessionGetAttributeId.equals(id))) { // 아이디 비밀번호 일치 확인
            rattr.addFlashAttribute("msg", "USER_CHECK_FAIL");
            return "redirect:/certification";
        }
        try {
            UserDto userDto = userService.getUser(id);
            // 가입일 데이터 LocalDateTime(reg_date) -> LocalDate(trans_reg_date) 변환
            transLDTtoLD(userDto);
            m.addAttribute(userDto);
            return "myInfo";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/certification";
        }

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

        if (id == null || id == "") { // 이미 탈퇴했거나 로그인 상태가 아니면 home 페이지로 이동
            rattr.addFlashAttribute("msg", "SERVER_FAIL");
            return "redirect:/";
        }

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
    public String loginPage(HttpServletRequest request, Model m) {

        // 로그인 이전 페이지로 이동하기 위한 URL 을 저장해서 logIn 페이지로 전달
        String before_address = request.getHeader("referer");
        int find_list = before_address.indexOf("board") + 5;
        before_address = before_address.substring(find_list);

        m.addAttribute("before_address", before_address);

        return "logIn";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, boolean rememberId, String before_address, Model m,
                        HttpServletRequest request, HttpServletResponse response) { // String toURL

        // 로그인
        // 1. 아이디, 비번 일치 확인
        if (!userCheck(id, pwd)) {
            // 2. 불일치 시, "아이디 또는 비밀번호가 일치하지 않습니다." redirect
            m.addAttribute("before_address", before_address);
            return checkFailMsg(m);
        }
        // 3. 일치 시, session에 id 추가
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        session.setMaxInactiveInterval(60 * 60); // 60분 후 session 자동 종료
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
        // 5. 이전 버전
        // toURL = toURL.substring(6); // /board/list 에서 /board 제거
        // toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        // return "redirect:" + toURL;

        // 5. 새로운 버전
        before_address = before_address == null ||
                before_address.equals("") ||
                before_address.equals("/signup") ||
                before_address.equals("/login") ?
                "/" : before_address;

        return "redirect:" + before_address;
    }


    private static String checkFailMsg(Model m) { // 아이디 또는 비밀번호가 일치하지 않을 시, 오류 메시지 전달 메서드
//        try { // querystring 방식으로 msg 전송
//            String msg = URLEncoder.encode("* 아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
//            return "redirect:/login?msg=" + msg;
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//            return "redirect:/login?msg=FAIL";
//        }
        try { // Model 방식으로 msg 전송. before_address 도 Model 에 담아서 보내야하기 때문에 이 방법 채택.
            m.addAttribute("logInCheckFail", "* 아이디 또는 비밀번호가 일치하지 않습니다.");
            return "logIn";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("logInCheckFail", "문제가 발생하여 로그인에 실패했습니다.");
            return "logIn";
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
