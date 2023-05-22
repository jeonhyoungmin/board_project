package com.surup.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

import static java.util.Objects.requireNonNullElse;

public class SearchCondition {
    private Integer page = 1; // 기본 값 = 1 페이지
    private Integer pageSize = 10; // 기본 10개
    private String category = ""; // 기본 값 = "" (전체 entire)
    private String option = ""; // 기본 값 = "" (전체 entire)
    private String keyword = ""; // 기본 값 = "" (keyword 없이 전체 검색)
    //    private Integer offset;
    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 15;

    public SearchCondition() {
    }

    public SearchCondition(Integer page, Integer pageSize) {
        this(page, pageSize, "entire", "entire", "");
    }

    public SearchCondition(Integer page, Integer pageSize, String category, String option, String keyword) {
        this.page = page;
        this.pageSize = pageSize;
        this.category = category;
        this.option = option;
        this.keyword = keyword;
    }

    public String getQueryString() { // queryString 작성 메서드
        return getQueryString(page);
    }

    public String getQueryString(Integer page) { // queryString 작성 메서드
        return UriComponentsBuilder.newInstance()
                .queryParam("category", category)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .build().toString();
    }

    public String getQueryString(Integer page, String category) { // queryString 작성 메서드
        return UriComponentsBuilder.newInstance()
                .queryParam("category", category)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .build().toString();
    }

    public String getQueryString(Integer page, String category, String option, String keyword) { // queryString 작성 메서드
        return UriComponentsBuilder.newInstance()
                .queryParam("category", category)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .build().toString();
    }

    public Integer getOffset() {
        return (page - 1) * pageSize;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) { // pageSize 검사
        // pageSize 는 null 이거나 음수여선 안 된다.
//        if (pageSize == null || pageSize < 0) this.pageSize = DEFAULT_PAGE_SIZE;
        // pageSize 는 MAX_PAGE_SIZE 보다 크거나 MIN_PAGE_SIZE 보다 작아선 안 된다.
//        this.pageSize = Math.max(Math.min(this.pageSize, MAX_PAGE_SIZE), MAX_PAGE_SIZE);

        this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
        // MIN_PAGE_SIZE <= pageSize <= MAX_PAGE_SIZE
        this.pageSize = Math.max(MIN_PAGE_SIZE, Math.min(this.pageSize, MAX_PAGE_SIZE));

//        this.pageSize = pageSize;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", category='" + category + '\'' +
                ", option='" + option + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
