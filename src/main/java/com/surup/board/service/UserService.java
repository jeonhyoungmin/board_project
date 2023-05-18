package com.surup.board.service;

import com.surup.board.domain.UserDto;

import java.util.List;

public interface UserService {
    // SELECT
    List<UserDto> getUserAll() throws Exception;

    UserDto duplIdCheck(String id) throws Exception;

    UserDto duplNicknameCheck(String nickname) throws Exception;

    UserDto duplEmailCheck(String email) throws Exception;

    UserDto getUser(String id) throws Exception;

    // INSERT
    int registerUser(UserDto userDto) throws Exception;

    // DELETE
    int deleteAccount(String id) throws Exception;

    // UPDATE
    int updatePwd(UserDto userDto) throws Exception;
}
