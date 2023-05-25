package com.surup.board.service;

import com.surup.board.dao.BoardDao;
import com.surup.board.dao.UserDao;
import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BoardService { // 새 글 쓰기, 수정하기, 삭제하기
    @Autowired
    BoardDao boardDao;

    @Autowired
    UserDao userDao;

    // SELECT
    public List<BoardDto> getBoardAll() throws Exception {
        return boardDao.selectAll();
    }

    public int getCount(SearchCondition sc) throws Exception {
        return boardDao.count(sc);
    }

    public List<BoardDto> getPage(SearchCondition sc) throws Exception {
        return boardDao.selectPage(sc);
    }

    public BoardDto getBoardOne(Integer bno) throws Exception {
        return boardDao.selectOne(bno);
    }

    public String  getWriterId(Integer bno) throws Exception {
        BoardDto boardDto = boardDao.selectOne(bno);
        String writer = boardDto.getWriter();
        return userDao.selectNickname(writer).getId();
    }


    // INSERT
    public int registerBoard(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    public int registerBoard(String id, BoardDto boardDto) throws Exception {
        String writer = userDao.selectId(id).getNickname();
        boardDto.setWriter(writer);
        return boardDao.insert(boardDto);
    }


    // DELETE
    public int deleteBoardOne(Integer bno) throws Exception {
        return boardDao.delete(bno);
    }


    // UPDATE
    public int updateBoardOne(BoardDto boardDto) throws Exception {
        return boardDao.updateBoard(boardDto);
    }
}
