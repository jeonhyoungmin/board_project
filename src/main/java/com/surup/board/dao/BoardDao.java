package com.surup.board.dao;

import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDao { // 게시글 관련 SQL
    @Autowired
    private SqlSession session;
    private static String namespace = "com.surup.board.dao.BoardMapper.";

    // SELECT
    public List<BoardDto> selectAll() throws Exception { // test 용
        return session.selectList(namespace + "selectAll");
    }

    public int count(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "count", sc);
    }

    public List<BoardDto> selectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "selectPage", sc);
    }

    public BoardDto selectOne(Integer bno) throws Exception {
        return session.selectOne(namespace + "selectOne", bno);
    }


    // INSERT
    public int insert(BoardDto boardDto) throws Exception {
        return session.insert(namespace + "insert", boardDto);
    }


    // DELETE
    public int delete(Integer bno) throws Exception {
        return session.delete(namespace + "delete", bno);
    }


    // UPDATE
    public int updateBoard(BoardDto boardDto) throws Exception {
        return session.update(namespace + "update", boardDto);
    }
}
