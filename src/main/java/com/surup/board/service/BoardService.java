package com.surup.board.service;

import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;

import java.util.List;

public interface BoardService {
    // SELECT
    List<BoardDto> getBoardAll() throws Exception;

    int getCount(SearchCondition sc) throws Exception;

    List<BoardDto> getPage(SearchCondition sc) throws Exception;

    BoardDto getBoardOne(Integer bno) throws Exception;

    String getWriterId(Integer bno) throws Exception;

    // INSERT
    int registerBoard(BoardDto boardDto) throws Exception;

    int registerBoard(String id, BoardDto boardDto) throws Exception;

    // DELETE
    int deleteBoardOne(Integer bno) throws Exception;

    // UPDATE
    int updateBoardOne(BoardDto boardDto) throws Exception;
}
