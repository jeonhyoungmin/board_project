package com.surup.board.controller;

import com.surup.board.domain.CommentDto;
import com.surup.board.service.CommentService;
import com.surup.board.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/board")
public class ReplyCommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @ResponseBody
    @GetMapping("/replyComments")
    public ResponseEntity<List<CommentDto>> viewReplyAll(Integer cno) { // 전체 댓글 가져오는 메서드
        // Date 타입 String 으로 변환 pattern
        SimpleDateFormat receiveFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
        List<CommentDto> list;

        try {
            list = commentService.getReplyAll(cno); // cno 에 해당하는 모든 답글 찾기
            ListIterator<CommentDto> listIterator = list.listIterator();
            while (listIterator.hasNext()) {
                CommentDto li = listIterator.next();
                Date dateParse = receiveFormat.parse(li.getReg_date().toString());
                String date = transFormat.format(dateParse);
                li.setTrans_reg_date(date);
                Date dateParseUpdate = receiveFormat.parse(li.getUp_date().toString()); // 수정 날짜 변환
                String dateUpdate = transFormat.format(dateParseUpdate); // 수정 날짜 변환
                if(!date.equals(dateUpdate)){ // 작성 날짜와 수정 날짜가 다를 시, 수정 여부 true
                    li.setModify(true);
                }
            }

            return new ResponseEntity<>(list, HttpStatus.OK); // 문제가 없다면 200번대 응답과 함께 View 에 전달
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 문제가 있다면 400번대 응답과 함께 View 에 전달
        }
    }

    @ResponseBody
    @PostMapping("/replyComments/{bno}/{cno}/{comment}") // cno 를 pcno 로 갖는 답글 작성 메서드
    public ResponseEntity writeReply(CommentDto commentDto, HttpSession session) {
        String id = (String) session.getAttribute("id");
        if (id == null || id == "") return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        try {
            String writer = userService.getUser(id).getNickname();
            commentDto.setCommenter(writer);
            int row_cnt = commentService.registerReply(commentDto);
            if (row_cnt != 1) throw new Exception("comment insert fail");

            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

}
