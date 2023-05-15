package com.surup.board.dao;

import com.surup.board.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class UserDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.surup.board.dao.UserMapper.";

//    @Override
    public List<UserDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    public UserDto duplIdCheck(String id) throws Exception {
        // id 중복 확인
        return session.selectOne(namespace + "duplIdCheck", id);
    }

    public UserDto duplNicknameCheck(String nickname) throws Exception {
        // nickname 중복 확인
        return session.selectOne(namespace + "duplNicknameCheck", nickname);
    }

    public UserDto duplEmailCheck(String email) throws Exception {
        // nickname 중복 확인
        return session.selectOne(namespace + "duplEmailCheck", email);
    }

    public UserDto select(String id) throws Exception {
        // id로 전체 검색
        return session.selectOne(namespace + "select", id);
    }

    public UserDto selectNickname(String nickname) throws Exception {
        return session.selectOne(namespace + "selectNickname", nickname);
    }

    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    public int insert(UserDto userDto) throws Exception {
        return session.insert(namespace + "insert", userDto);
    }
}
