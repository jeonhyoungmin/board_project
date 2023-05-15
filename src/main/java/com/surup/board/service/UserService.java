package com.surup.board.service;

import com.surup.board.dao.UserDao;
import com.surup.board.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class UserService {
    @Autowired
    UserDao userDao;

    public List<UserDto> getUserAll() throws Exception {
        return userDao.selectAll();
    }

    public UserDto duplIdCheck(String id) throws Exception {
        // id 중복 확인
        return userDao.duplIdCheck(id);
    }

    public UserDto duplNicknameCheck(String nickname) throws Exception {
        // id 중복 확인
        return userDao.duplNicknameCheck(nickname);
    }

    public UserDto duplEmailCheck(String email) throws Exception {
        // id 중복 확인
        return userDao.duplEmailCheck(email);
    }

    public int registerUser(UserDto userDto) throws Exception {
        return userDao.insert(userDto);
    }

}
