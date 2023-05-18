package com.surup.board.service;

import com.surup.board.dao.UserDao;
import com.surup.board.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService { // 회원 가입, 로그인, 로그아웃, 내 정보
    @Autowired
    UserDao userDao;

    // SELECT
    @Override
    public List<UserDto> getUserAll() throws Exception {
        return userDao.selectAll();
    }

    @Override
    public UserDto duplIdCheck(String id) throws Exception {
        // id 중복 확인
        return userDao.selectId(id);
    }

    @Override
    public UserDto duplNicknameCheck(String nickname) throws Exception {
        // id 중복 확인
        return userDao.selectNickname(nickname);
    }

    @Override
    public UserDto duplEmailCheck(String email) throws Exception {
        // id 중복 확인
        return userDao.selectEmail(email);
    }

    @Override
    public UserDto getUser(String id) throws Exception {
        return userDao.selectId(id);
    }

    // INSERT
    @Override
    public int registerUser(UserDto userDto) throws Exception {
        return userDao.insert(userDto);
    }

    // DELETE
    @Override
    public int deleteAccount(String id) throws Exception {
//        throw new Exception();
        return userDao.deleteUser(id);
    }

    // UPDATE
    @Override
    public int updatePwd(UserDto userDto) throws Exception {
        return userDao.updatePwd(userDto);
    }
}
