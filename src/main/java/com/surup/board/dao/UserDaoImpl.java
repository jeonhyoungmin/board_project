package com.surup.board.dao;

import com.surup.board.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao { // 사용자 관련 SQL
    @Autowired
    private SqlSession session;
    private static String namespace = "com.surup.board.dao.UserMapper.";

    // SELECT
    @Override
    public List<UserDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public UserDto selectId(String id) throws Exception {
        // id 중복 확인
        return session.selectOne(namespace + "selectId", id);
    }

    @Override
    public UserDto selectNickname(String nickname) throws Exception {
        // nickname 중복 확인
        return session.selectOne(namespace + "selectNickname", nickname);
    }

    @Override
    public UserDto selectEmail(String email) throws Exception {
        // nickname 중복 확인
        return session.selectOne(namespace + "selectEmail", email);
    }

    // INSERT
    @Override
    public int insert(UserDto userDto) throws Exception {
        return session.insert(namespace + "insert", userDto);
    }

    // DELETE
    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int deleteUser(String id) throws Exception {
        return session.delete(namespace + "deleteUser", id);
    }

    // UPDATE
    @Override
    public int updatePwd(UserDto userDto) throws Exception {
        return session.update(namespace + "updatePwd", userDto);
    }
}
