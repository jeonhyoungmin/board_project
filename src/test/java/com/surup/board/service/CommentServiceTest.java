package com.surup.board.service;

import com.surup.board.dao.CommentDao;
import com.surup.board.domain.CommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CommentServiceTest {

    @Autowired
    CommentService commentService;

    @Test
    public void getCommentAll() throws Exception { // bno 에 해당하는 게시물의 전체 댓글 보이기
        List<CommentDto> commentDto = commentService.getCommentAll(1918);
        System.out.println("commentDto = " + commentDto);
    }

    @Test
    public void registerComment() throws Exception { // 새로운 댓글 추가
        for (int i = 0; i < 20; i++) {
            CommentDto commentDto = new CommentDto(1919, "댓글 테스트" + i, "우당탕탕");
            int row_cnt = commentService.registerComment(commentDto);
            assertTrue(row_cnt == 1);
        }
    }

    @Test
    public void registerReply() throws Exception { // 새로운 답글 추가
        for (int i = 0; i < 20; i++) {
            CommentDto commentDto = new CommentDto(1919, 279, "댓글 테스트" + i, "우당탕탕");
            int row_cnt = commentService.registerReply(commentDto);
            assertTrue(row_cnt == 1);

        }
    }

    @Test
    public void updateComment() throws Exception { // cno 에 해당하는 댓글 수정
        CommentDto commentDto = commentService.getComment(2);
        commentDto.setComment("댓글 수정 테스트");
        int cnt_row = commentService.updateComment(commentDto);
        assertTrue(cnt_row == 1);
    }

    @Test
    public void deleteComment() throws Exception { // cno 에 해당하는 댓글 삭제
        int cnt_row = commentService.deleteComment(17);
        assertTrue(cnt_row == 1);
    }

    @Test
    public void getPcnoCount() throws Exception { // bno 에 해당하는 pcno 개수
        int cnt_row = commentService.getPcnoCount(1919);
        System.out.println("cnt_row = " + cnt_row);
        assertTrue(cnt_row == 1);
    }
}