package com.surup.board.dao;

import com.surup.board.domain.CommentDto;

import java.util.List;

public interface CommentDao {
    // SELECT
    List<CommentDto> selectAll(Integer bno) throws Exception;

    List<CommentDto> selectPcnoAll(Integer cno) throws Exception;

    CommentDto select(Integer cno) throws Exception;

    int countPcno(Integer bno) throws Exception;

    // INSERT
    int insert(CommentDto commentDto) throws Exception;

    int replyInsert(CommentDto commentDto) throws Exception;

    // DELETE
    int delete(Integer cno) throws Exception;

    // UPDATE
    int update(CommentDto commentDto) throws Exception;

    int pcnoUpdate(Integer cno, Integer count) throws Exception;
}
