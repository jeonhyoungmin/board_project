package com.surup.board.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private String id;
    private String pwd;
    private String pwdcheck;
    private String username;
    private Character sex;
    private Integer resident_registration_number;
    private String email;
    private String nickname;
    private Date  birth;
    private Date reg_date;
    private Date up_date;

    public UserDto() {}

    public UserDto(String id, String pwd, String pwdcheck, String username, Character sex, Integer resident_registration_number, String email, String nickname) {
        this.id = id;
        this.pwd = pwd;
        this.pwdcheck = pwdcheck;
        this.username = username;
        this.sex = sex;
        this.resident_registration_number = resident_registration_number;
        this.email = email;
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", pwdcheck='" + pwdcheck + '\'' +
                ", username='" + username + '\'' +
                ", sex=" + sex +
                ", resident_registration_number=" + resident_registration_number +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", birth=" + birth +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return Objects.equals(id, userDto.id) && Objects.equals(pwd, userDto.pwd) && Objects.equals(pwdcheck, userDto.pwdcheck) && Objects.equals(username, userDto.username) && Objects.equals(sex, userDto.sex) && Objects.equals(resident_registration_number, userDto.resident_registration_number) && Objects.equals(email, userDto.email) && Objects.equals(nickname, userDto.nickname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pwd, pwdcheck, username, sex, resident_registration_number, email, nickname);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPwdcheck() {
        return pwdcheck;
    }

    public void setPwdcheck(String pwdcheck) {
        this.pwdcheck = pwdcheck;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Character getSex() {
        return sex;
    }

    public void setSex(Character sex) {
        this.sex = sex;
    }

    public Integer getResident_registration_number() {
        return resident_registration_number;
    }

    public void setResident_registration_number(Integer resident_registration_number) {
        this.resident_registration_number = resident_registration_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }
}
