package com.surup.board.service;

import com.surup.board.dao.BoardDao;
import com.surup.board.dao.UserDao;
import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BoardServiceImpl implements BoardService { // 새 글 쓰기, 수정하기, 삭제하기
    @Autowired
    BoardDao boardDao;

    @Autowired
    UserDao userDao;

    // SELECT
    @Override
    public List<BoardDto> getBoardAll() throws Exception {
        return boardDao.selectAll();
    }

    @Override
    public int getCount(SearchCondition sc) throws Exception {
        return boardDao.count(sc);
    }

    @Override
    public List<BoardDto> getPage(SearchCondition sc) throws Exception {
        return boardDao.selectPage(sc);
    }

    @Override
    public BoardDto getBoardOne(Integer bno) throws Exception {
        boardDao.updateViewCnt(bno);
        return boardDao.selectOne(bno);
    }

    @Override
    public String  getWriterId(Integer bno) throws Exception {
        BoardDto boardDto = boardDao.selectOne(bno);
        String writer = boardDto.getWriter();
        return userDao.selectNickname(writer).getId();
    }


    // INSERT
    @Override
    public int registerBoard(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    @Override
    public int registerBoard(String id, BoardDto boardDto) throws Exception {
        String writer = userDao.selectId(id).getNickname();
        boardDto.setWriter(writer);
        return boardDao.insert(boardDto);
    }


    // DELETE
    @Override
    public int deleteBoardOne(Integer bno) throws Exception {
        return boardDao.delete(bno);
    }


    // UPDATE
    @Override
    public int updateBoardOne(BoardDto boardDto) throws Exception {
        return boardDao.updateBoard(boardDto);
    }
}
