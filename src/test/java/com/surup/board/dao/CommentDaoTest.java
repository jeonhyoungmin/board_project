package com.surup.board.dao;

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
public class CommentDaoTest {

    @Autowired
    CommentDao commentDao;

    @Test
    public void selectAll() throws Exception { // bno 에 해당하는 게시물의 전체 댓글 보이기
        List<CommentDto> commentDto = commentDao.selectAll(1915);
        System.out.println("commentDto = " + commentDto);
    }

    @Test
    public void selectOne() throws Exception { // cno 에 해당하는 댓글 보이기
        CommentDto commentDto = commentDao.select(232);
        System.out.println("commentDto = " + commentDto);
    }

    @Test
    public void insert() throws Exception { // 새로운 게시물 추가
        CommentDto commentDto = new CommentDto(1915, "댓글 테스트", "나니");
        int row_cnt = commentDao.insert(commentDto);
        assertTrue(row_cnt == 1);
    }

    @Test
    public void replyInsert() throws Exception { // 새로운 게시물 추가
        CommentDto commentDto = new CommentDto(1919, 86,"답글 테스트", "우당탕탕");
        int row_cnt = commentDao.replyInsert(commentDto);
        assertTrue(row_cnt == 1);
    }

    @Test
    public void update() throws Exception { // cno 에 해당하는 댓글 수정
        CommentDto commentDto = commentDao.select(1);
        commentDto.setComment("댓글 수정 테스트");
        int cnt_row = commentDao.update(commentDto);
        assertTrue(cnt_row == 1);
    }

    @Test
    public void delete() throws Exception { // cno 에 해당하는 댓글 삭제
        int cnt_row = commentDao.delete(1);
        assertTrue(cnt_row == 1);
    }
}