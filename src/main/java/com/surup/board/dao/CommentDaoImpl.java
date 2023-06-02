package com.surup.board.dao;

import com.surup.board.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class CommentDaoImpl implements CommentDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.surup.board.dao.CommentMapper.";

    // SELECT
    @Override
    public List<CommentDto> selectAll(Integer bno) throws Exception { // bno 에 해당하는 게시물의 전체 댓글 보이기
        return session.selectList(namespace + "selectAll", bno);
    }

    @Override
    public List<CommentDto> selectPcnoAll(Integer cno) throws Exception { // cno 와 동일한 pcno 에 해당하는 전체 답글 보이기
        return session.selectList(namespace + "selectPcnoAll", cno);
    }

    @Override
    public CommentDto select(Integer cno) throws Exception { // cno 에 해당하는 게시물의 댓글 보이기
        return session.selectOne(namespace + "select", cno);
    }

    @Override
    public int countPcno(Integer bno) throws Exception { // bno 에 해당하는 게시물의 pcno 개수
        return session.selectOne(namespace + "countPcno", bno);
    }


    // INSERT
    @Override
    public int insert(CommentDto commentDto) throws Exception { // 새로운 댓글 추가
        return session.insert(namespace + "insert", commentDto);
    }

    @Override
    public int replyInsert(CommentDto commentDto) throws Exception { // 새로운 답글 추가
        return session.insert(namespace + "replyInsert", commentDto);
    }


    // DELETE
    @Override
    public int delete(Integer cno) throws Exception { // cno 에 해당하는 댓글 삭제
        return session.delete(namespace + "delete", cno);
    }


    // UPDATE
    @Override
    public int update(CommentDto commentDto) throws Exception { // cno 에 해당하는 댓글 수정
        return session.update(namespace + "update", commentDto);
    }

    @Override
    public int pcnoUpdate(Integer cno, Integer count) throws Exception { // cno 에 해당하는 댓글의 답글 개수 증가
        HashMap map = new HashMap();
        map.put("cno", cno);
        map.put("count", count);
        return session.update(namespace + "pcnoUpdate", map);
    }
}
