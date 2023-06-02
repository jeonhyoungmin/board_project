package com.surup.board.domain;

import java.util.Date;

public class CommentDto {
    private Integer cno;
    private Integer bno;
    private Integer pcno;
    private String comment;
    private String commenter;
    private Date reg_date;
    private String trans_reg_date; // Date 타입 String 변환
    private Date up_date;
    private String trans_up_date; // Date 타입 String 변환
    private Boolean modify = false;


    public CommentDto(){}
    public CommentDto(Integer bno, String comment, String commenter) {
        this.bno = bno;
        this.comment = comment;
        this.commenter = commenter;
    }

    public CommentDto(Integer bno, Integer cno, String comment, String commenter) {
        this.bno = bno;
        this.cno = cno;
        this.comment = comment;
        this.commenter = commenter;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public Integer getPcno() {
        return pcno;
    }

    public void setPcno(Integer pcno) {
        this.pcno = pcno;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommenter() {
        return commenter;
    }

    public void setCommenter(String commenter) {
        this.commenter = commenter;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getTrans_reg_date() {
        return trans_reg_date;
    }

    public void setTrans_reg_date(String trans_reg_date) {
        this.trans_reg_date = trans_reg_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public String getTrans_up_date() {
        return trans_up_date;
    }

    public void setTrans_up_date(String trans_up_date) {
        this.trans_up_date = trans_up_date;
    }

    public Boolean getModify() {
        return modify;
    }

    public void setModify(Boolean modify) {
        this.modify = modify;
    }

    @Override
    public String toString() {
        return "CommentDto{" +
                "cno=" + cno +
                ", bno=" + bno +
                ", pcno=" + pcno +
                ", comment='" + comment + '\'' +
                ", commenter='" + commenter + '\'' +
                ", reg_date=" + reg_date +
                ", trans_reg_date='" + trans_reg_date + '\'' +
                ", up_date=" + up_date +
                ", trans_up_date='" + trans_up_date + '\'' +
                ", modify=" + modify +
                '}';
    }
}
