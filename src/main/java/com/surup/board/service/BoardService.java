package com.surup.board.service;

import com.surup.board.dao.BoardDao;
import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BoardService { // 새 글 쓰기, 수정하기, 삭제하기
    @Autowired
    BoardDao boardDao;

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


    // INSERT
    public int registerBoard(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }


    // DELETE
//    public int deleteAccount(String id) throws Exception {
////        throw new Exception();
//        return userDao.deleteUser(id);
//    }


    // UPDATE
//    public int updatePwd(UserDto userDto) throws Exception {
//        return userDao.updatePwd(userDto);
//    }
}
