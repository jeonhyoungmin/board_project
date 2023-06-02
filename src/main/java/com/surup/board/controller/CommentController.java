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
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @ResponseBody
    @GetMapping("/nickname")
    public ResponseEntity<Map> viewCommentsAll(String id) { // 사용자의 nickname을 가져오는 메서드
        try {
            HashMap map = new HashMap();
            String nickname = userService.getUser(id).getNickname();
            map.put("nickname", nickname);
            return new ResponseEntity<>(map, HttpStatus.OK); // 문제가 없다면 200번대 응답과 함께 View 에 전달
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 문제가 있다면 400번대 응답과 함께 View 에 전달
        }
    }

    @ResponseBody
    @GetMapping("/comments")
    public ResponseEntity<List<CommentDto>> viewCommentsAll(Integer bno) { // 전체 댓글 가져오는 메서드
        // Date 타입 String 으로 변환 pattern
        SimpleDateFormat receiveFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
        List<CommentDto> list;

        try {
            list = commentService.getCommentAll(bno); // bno 에 해당하는 모든 댓글 찾기
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
    @PostMapping("/comments/{bno}")
    public ResponseEntity writeComments(@RequestBody String comment, CommentDto commentDto, HttpSession session) { // 새 댓글 작성 메서드
        String id = (String) session.getAttribute("id");
        if (id == null || id == "") return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        comment = comment.substring(1, comment.length() - 1); // "" 제거
        if (comment.trim().equals("")) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        try {
            String writer = userService.getUser(id).getNickname();
            commentDto.setComment(comment);
            commentDto.setCommenter(writer);
            int row_cnt = commentService.registerComment(commentDto);
            if (row_cnt != 1) throw new Exception("comment insert fail");

            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @DeleteMapping("/comments/{cno}")
    public ResponseEntity deleteComments(@PathVariable Integer cno, HttpSession session) { // 새 댓글 작성 메서드
        String id = (String) session.getAttribute("id");
        if (id == null || id == "") return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        try {
            // 아이디 닉네임과 댓글 닉네임이 동일한지 확인
            String sessionNickname = userService.getUser(id).getNickname(); // 로그인 중인 유저의 닉네임
            String writer = commentService.getComment(cno).getCommenter(); // 댓글 작성자의 닉네임
            if (!(sessionNickname.equals(writer))) throw new Exception("nickname not correct");
            commentService.deleteComment(cno);
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @PutMapping("/comments/{cno}")
    public ResponseEntity putComments(@PathVariable Integer cno, @RequestBody String comment,
                                      CommentDto commentDto, HttpSession session) { // 새 댓글 작성 메서드
        String id = (String) session.getAttribute("id");
        if (id == null || id == "") return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        comment = comment.substring(1, comment.length() - 1); // "" 제거
        if (comment.trim().equals("")) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        try {
            // 아이디 닉네임과 댓글 닉네임이 동일한지 확인
            String sessionNickname = userService.getUser(id).getNickname(); // 로그인 중인 유저의 닉네임
            String writer = commentService.getComment(cno).getCommenter(); // 댓글 작성자의 닉네임
            String before_comment = commentService.getComment(cno).getComment();
            if(before_comment.equals(comment)) throw new Exception("before_comment eq comment");
            if (!(sessionNickname.equals(writer))) throw new Exception("nickname not correct");
            commentDto.setComment(comment);
            commentDto.setCno(cno);
            commentService.updateComment(commentDto);
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

}
