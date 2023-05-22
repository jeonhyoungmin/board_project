package com.surup.board.domain;

public class PageHandler {
    private SearchCondition sc;
    private int total_cnt; // 총 게시물
    private int beginPage; // 1, 11, 21..
    private int endPage; // 10, 20, 30..
    private boolean prePageActive; // "<<"
    private int prePage; // "<"
    private boolean nextPageActive; // ">>"
    private int nextPage; // ">"
    private int totalPage; // 전체 페이지.
    private final int NAVI_SIZE = 10;

    public PageHandler(Integer total_cnt, Integer page) {
        this(total_cnt, new SearchCondition(page, 10));
    }

    public PageHandler(Integer total_cnt, Integer page, Integer pageSize) {
        this(total_cnt, new SearchCondition(page, pageSize));
    }

    public PageHandler(int total_cnt, SearchCondition sc) {
        this.total_cnt = total_cnt;
        this.sc = sc;
        paging(total_cnt, sc);
    }

    private void paging(int total_cnt, SearchCondition sc) {
        this.totalPage = total_cnt / sc.getPageSize() + (total_cnt % sc.getPageSize() == 0 ? 0 : 1); // 전체 페이지
        this.sc.setPage(Math.min(sc.getPage(), totalPage)); // 전체 페이지보다 페이지 수가 많지 않도록
        this.beginPage = ((sc.getPage() - 1) / NAVI_SIZE) * NAVI_SIZE + 1; // 네비게이션 바의 시작 번호
        this.endPage = Math.min(beginPage + NAVI_SIZE - 1, totalPage); // 네비게이션 바의 끝 번호
        this.prePageActive = sc.getPage() == 1 ? false : true; // 네비게이션 바의 "이전"으로 이동하는 버튼 활성화 여부
        this.prePage = sc.getPage() - 1; // 네비게이션 바의 이전으로 이동하는 방향
        this.nextPageActive = sc.getPage() == totalPage ? false : true; // 네비게이션 바의 "이후"로 이동하는 버튼 활성화 여부
        this.nextPage = sc.getPage() + 1; // 네비게이션 바의 이후로 이동하는 방향
    }

    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }

    public int getTotal_cnt() {
        return total_cnt;
    }

    public void setTotal_cnt(int total_cnt) {
        this.total_cnt = total_cnt;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrePageActive() {
        return prePageActive;
    }

    public void setPrePageActive(boolean prePageActive) {
        this.prePageActive = prePageActive;
    }

    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public boolean isNextPageActive() {
        return nextPageActive;
    }

    public void setNextPageActive(boolean nextPageActive) {
        this.nextPageActive = nextPageActive;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getNAVI_SIZE() {
        return NAVI_SIZE;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "sc=" + sc +
                ", total_cnt=" + total_cnt +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", prePageActive=" + prePageActive +
                ", prePage=" + prePage +
                ", nextPageActive=" + nextPageActive +
                ", nextPage=" + nextPage +
                ", totalPage=" + totalPage +
                ", NAVI_SIZE=" + NAVI_SIZE +
                '}';
    }
}
