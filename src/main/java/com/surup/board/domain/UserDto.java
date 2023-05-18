package com.surup.board.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    private LocalDate birth;
    private LocalDateTime reg_date;
    private LocalDate trans_reg_date;
    private LocalDateTime up_date;

    public UserDto() {}

    public UserDto(String id, String pwd, String username, Character sex, Integer resident_registration_number, String email, String nickname, LocalDate birth) {
        this.id = id;
        this.pwd = pwd;
        this.username = username;
        this.sex = sex;
        this.resident_registration_number = resident_registration_number;
        this.email = email;
        this.nickname = nickname;
        this.birth = birth;
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
                ", trans_reg_date='" + trans_reg_date + '\'' +
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

    public LocalDate getBirth() {
        return birth;
    }

    public void setBirth(LocalDate birth) {
        this.birth = birth;
    }

    public LocalDateTime getReg_date() {
        return reg_date;
    }

    public void setReg_date(LocalDateTime reg_date) {
        this.reg_date = reg_date;
    }

    public LocalDate getTrans_reg_date() {
        return trans_reg_date;
    }

    public void setTrans_reg_date(LocalDate trans_reg_date) {
        this.trans_reg_date = trans_reg_date;
    }

    public LocalDateTime getUp_date() {
        return up_date;
    }

    public void setUp_date(LocalDateTime up_date) {
        this.up_date = up_date;
    }
}
