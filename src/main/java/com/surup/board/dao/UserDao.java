package com.surup.board.dao;

import com.surup.board.domain.UserDto;

import java.util.List;

public interface UserDao {
    // SELECT
    List<UserDto> selectAll() throws Exception;

    UserDto selectId(String id) throws Exception;

    UserDto selectNickname(String nickname) throws Exception;

    UserDto selectEmail(String email) throws Exception;

    // INSERT
    int insert(UserDto userDto) throws Exception;

    // DELETE
    int deleteAll() throws Exception;

    int deleteUser(String id) throws Exception;

    // UPDATE
    int updatePwd(UserDto userDto) throws Exception;
}
