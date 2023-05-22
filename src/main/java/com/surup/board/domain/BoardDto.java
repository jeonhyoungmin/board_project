package com.surup.board.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

public class BoardDto {
    private Integer bno;
    private String title;
    private String content;
    private String writer;
    private String category;
    private Integer comment_cnt;
    private Integer view_cnt;
    private LocalDateTime reg_date; // DB 저장 용 값
    private LocalDate trans_reg_date; // DB 추출 후 변환 후 사용
    private LocalDateTime up_date;
    private int numbering; // 게시물 "No"
    private long reg_date_milliseconds; // reg_date 밀리 세컨드. view 에서 작성 시간 출력을 위한 비교용(금일과 비교) 값
    private String reg_date_format_date; //  reg_date_milliseconds 로 금일과 비교 후, 전날 이전에 작성된 글이라면, 날짜 형식으로 표기.
    private String reg_date_format_time; // reg_date_milliseconds 로 금일과 비교 후, 금일에 작성된 글이라면, 시간 형식.

    public BoardDto(){}
    public BoardDto(String title, String content, String writer, String category) {
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.category = category;
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", category='" + category + '\'' +
                ", comment_cnt=" + comment_cnt +
                ", view_cnt=" + view_cnt +
                ", reg_date=" + reg_date +
                ", trans_reg_date=" + trans_reg_date +
                ", up_date=" + up_date +
                ", numbering=" + numbering +
                ", reg_date_milliseconds=" + reg_date_milliseconds +
                ", reg_date_format_date='" + reg_date_format_date + '\'' +
                ", reg_date_format_time='" + reg_date_format_time + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BoardDto boardDto = (BoardDto) o;
        return numbering == boardDto.numbering && Objects.equals(bno, boardDto.bno) && Objects.equals(title, boardDto.title) && Objects.equals(content, boardDto.content) && Objects.equals(writer, boardDto.writer) && Objects.equals(category, boardDto.category) && Objects.equals(comment_cnt, boardDto.comment_cnt) && Objects.equals(view_cnt, boardDto.view_cnt) && Objects.equals(reg_date, boardDto.reg_date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, title, content, writer, category, comment_cnt, view_cnt, reg_date, numbering);
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getComment_cnt() {
        return comment_cnt;
    }

    public void setComment_cnt(Integer comment_cnt) {
        this.comment_cnt = comment_cnt;
    }

    public Integer getView_cnt() {
        return view_cnt;
    }

    public void setView_cnt(Integer view_cnt) {
        this.view_cnt = view_cnt;
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

    public int getNumbering() {
        return numbering;
    }

    public void setNumbering(int numbering) {
        this.numbering = numbering;
    }

    public long getReg_date_milliseconds() {
        return reg_date_milliseconds;
    }

    public void setReg_date_milliseconds(long reg_date_milliseconds) {
        this.reg_date_milliseconds = reg_date_milliseconds;
    }

    public String getReg_date_format_date() {
        return reg_date_format_date;
    }

    public void setReg_date_format_date(String reg_date_format_date) {
        this.reg_date_format_date = reg_date_format_date;
    }

    public String getReg_date_format_time() {
        return reg_date_format_time;
    }

    public void setReg_date_format_time(String reg_date_format_time) {
        this.reg_date_format_time = reg_date_format_time;
    }
}
