package com.surup.board.dao;

import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;

import java.util.HashMap;
import java.util.List;

public interface BoardDao {
    // SELECT
    List<BoardDto> selectAll() throws Exception;

    int count(SearchCondition sc) throws Exception;

    List<BoardDto> selectPage(SearchCondition sc) throws Exception;

    BoardDto selectOne(Integer bno) throws Exception;

    // INSERT
    int insert(BoardDto boardDto) throws Exception;

    // DELETE
    int delete(Integer bno) throws Exception;

    // UPDATE
    int updateBoard(BoardDto boardDto) throws Exception;

    int updateCommentCnt(Integer bno, Integer cnt) throws Exception;

    int updateViewCnt(Integer bno) throws Exception;
}
