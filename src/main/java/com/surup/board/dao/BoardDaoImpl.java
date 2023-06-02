package com.surup.board.dao;

import com.surup.board.domain.BoardDto;
import com.surup.board.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class BoardDaoImpl implements BoardDao { // 게시글 관련 SQL
    @Autowired
    private SqlSession session;
    private static String namespace = "com.surup.board.dao.BoardMapper.";

    // SELECT
    @Override
    public List<BoardDto> selectAll() throws Exception { // test 용
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public int count(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "count", sc);
    }

    @Override
    public List<BoardDto> selectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "selectPage", sc);
    }

    @Override
    public BoardDto selectOne(Integer bno) throws Exception {
        return session.selectOne(namespace + "selectOne", bno);
    }


    // INSERT
    @Override
    public int insert(BoardDto boardDto) throws Exception {
        return session.insert(namespace + "insert", boardDto);
    }


    // DELETE
    @Override
    public int delete(Integer bno) throws Exception {
        return session.delete(namespace + "delete", bno);
    }


    // UPDATE
    @Override
    public int updateBoard(BoardDto boardDto) throws Exception {
        return session.update(namespace + "update", boardDto);
    }

    @Override
    public int updateCommentCnt(Integer bno, Integer cnt) throws Exception {
        HashMap map = new HashMap();
        map.put("bno", bno);
        map.put("cnt", cnt);
        return session.update(namespace + "updateCommentCnt", map);
    }

    @Override
    public int updateViewCnt(Integer bno) throws Exception {
        return session.update(namespace + "updateViewCnt", bno);
    }
}
