package com.surup.board.controller;

import com.surup.board.domain.BoardDto;
import com.surup.board.service.BoardService;
import com.surup.board.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class Board {

    @Autowired
    UserService userService;

    @Autowired
    BoardService boardService;

    @GetMapping("/write")
    public String writeView(HttpServletRequest request, HttpSession session, RedirectAttributes rattr, Model m) {
        String sessionId = (String) session.getAttribute("id");
        // 로그인 여부 확인
        if (sessionId == null) { // 세션의 id 값이 비어 있으면, 곧 비 로그인 상태이면 로그인 페이지로 이동
            rattr.addAttribute("msg", "LOGIN_NEED");
            return "redirect:/login";
        }

        // 로그인 이전 페이지로 이동하기 위한 URL 을 저장해서 logIn 페이지로 전달
        String before_address = request.getHeader("referer");
        int find_list = before_address.indexOf("board") + 5;
        before_address = before_address.substring(find_list);

        m.addAttribute("before_address", before_address);
        m.addAttribute("mode", "write");

        return "board";
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, HttpSession session, RedirectAttributes rattr, Model m) {
        System.out.println("boardDto = " + boardDto);
        String sessionId = (String) session.getAttribute("id");
        // 세션 아이디 유무 확인
        if (sessionId == null) { // 세션의 id 값이 비어 있으면, 곧 비 로그인 상태이면 로그인 페이지로 이동
            // 세션 아이디 없을 시, 로그인이 필요한 서비스라는 알림과 함께 로그인 창으로 이동
            rattr.addAttribute("msg", "LOGIN_NEED");
            return "redirect:/login";
        }
        try {
            if (boardDto.getTitle().equals("") || boardDto.getContent().equals("")) throw new Exception("empty board fail");
            int row_cnt = boardService.registerBoard(sessionId, boardDto); // id로 닉네임 추출 및 초기화 후, 게시물 등록
            if(row_cnt != 1) throw new Exception("board register fail");

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto); // 작성하던 내용 전달
            m.addAttribute("mode", "write"); // 등록 실패 시, 게시판 글쓰기 mode 전달
            m.addAttribute("msg", "NEW_BOARD_REGISTER_FAIL"); // 등록 실패 메시지
            return "board";
        }

        return "redirect:/list";
    }

    @GetMapping("/read")
    public String readView(Integer bno, HttpServletRequest request, RedirectAttributes rattr, Model m) {

        // 로그인 이전 페이지로 이동하기 위한 URL 을 저장해서 logIn 페이지로 전달
        String before_address = request.getHeader("referer");
        int find_list = before_address.indexOf("board") + 5;
        before_address = before_address.substring(find_list);

        try {
            // bno 로 데이터 게시물 찾기
            BoardDto boardDto = boardService.getBoardOne(bno);
            // bno 로 사용자 아이디 얻기
            String id = boardService.getWriterId(bno);
            m.addAttribute("writerId", id); // 작성자 아이디

            m.addAttribute(boardDto);
            m.addAttribute("before_address", before_address);
            m.addAttribute("mode", "read");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "BOARD_READ_FAIL");
            return "redirect:/" + before_address;
        }

        return "board";
    }

    @GetMapping("/modify")
    public String modifyView(Integer bno, String before_address, RedirectAttributes rattr, Model m) {

        try {
            // bno 로 데이터 게시물 찾기
            BoardDto boardDto = boardService.getBoardOne(bno);
            // bno 로 사용자 아이디 얻기
            String id = boardService.getWriterId(bno);
            m.addAttribute("writerId", id); // 작성자 아이디

            m.addAttribute(boardDto);
            m.addAttribute("before_address", before_address);
            m.addAttribute("mode", "modify");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "BOARD_READ_FAIL");
            return "redirect:/" + before_address;
        }

        return "board";
    }

    @PostMapping("/modify")
    public String modify(Integer bno, BoardDto boardDto, String before_address,
                                    RedirectAttributes rattr, HttpSession session) {
        String sessionId = (String) session.getAttribute("id");

        try {
            // sessionId로 찾은 닉네임과 게시물의 작성 닉네임 비교
            String sessionIdNickname = userService.getUser(sessionId).getNickname();
            String boardNickname = boardService.getBoardOne(bno).getWriter();
            if (!(sessionIdNickname.equals(boardNickname))) throw new Exception("nickname not correct");

            int row_cnt = boardService.updateBoardOne(boardDto); // 업데이트
            if (row_cnt != 1) throw new Exception("board update fail"); // 업데이트 영향 행이 1개가 아니면 에러

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "BOARD_UPDATE_FAIL");
            return "redirect:/" + before_address;
        }
        rattr.addFlashAttribute("msg", "BOARD_UPDATE_SUCCESS");
        return "redirect:/" + before_address;
    }

    @DeleteMapping("/remove")
    public String remove(Integer bno, String before_address, HttpSession session, RedirectAttributes rattr) {
        String sessionId = (String) session.getAttribute("id");

        try {
            // sessionId로 찾은 닉네임과 게시물의 작성 닉네임 비교
            String sessionIdNickname = userService.getUser(sessionId).getNickname();
            String boardNickname = boardService.getBoardOne(bno).getWriter();
            System.out.println("sessionIdNickname = " + sessionIdNickname);
            System.out.println("boardNickname = " + boardNickname);
            if (!(sessionIdNickname.equals(boardNickname))) throw new Exception("nickname not correct");

            int row_cnt = boardService.deleteBoardOne(bno); // 삭제
            if (row_cnt != 1) throw new Exception("board delete fail"); // 삭제 영향 행이 1개가 아니면 에러

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "BOARD_DELETE_FAIL");
            return "redirect:" + before_address;
        }

        rattr.addFlashAttribute("msg", "BOARD_DELETE_SUCCESS");
        return "redirect:" + before_address;
    }
}
