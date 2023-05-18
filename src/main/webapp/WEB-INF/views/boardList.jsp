<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!--%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %-->
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>boardList</title>
    <style>

        /* 게시판 root */
        .board {
            width: 100%;
            height: 600px;
            margin-top: 80px;
        }

        .board_top_pk {
            width: 100%;
            height: 130px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            margin-top: 90px;
        }

        .board_top_title {
            width: inherit;
            height: 50px;
            text-align: center;
            font-size: 36px;
            font-weight: bold;
        }

        .board_top_classify {
            width: 300px;
            height: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /*       .board_top_classify > div {
              } */
        .board_top_classify > :nth-child(5) {
            border-bottom: 1px solid var(--selected-color-blue);
            color: var(--selected-color-blue);
            font-weight: bold;
        }

        .board_top_classify > div:hover {
            cursor: pointer;
        }

        /* 검색을 포함한 게시판 전체 */
        /* 게시판 페이지를 반으로 나누었을 때, 아래 부분 */
        .board_bottom_pk {
            width: 100%;
            height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* 검색 부분 */
        .board_serach_pk {
            width: 1000px;
            height: 50px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .search_option {
            height: 25px;
            margin-right: 10px;
        }

        .search_text_input {
            width: 130px;
            height: 25px;
            border-color: var(--border-color-1);
            border-width: 1px;
            margin-right: 10px;
        }

        .search_button {
            width: 50px;
            height: 25px;
            background-color: var(--button-color-2);
            border: 1px solid var(--border-color-1);
        }

        /* 게시판 전체 */
        .board_content_pk {
            width: 1000px;
            height: 330px;

        }

        .board_content_pk > div {
            height: 35px;
        }

        /* 게시판 글쓰기 버튼 */
        .board_write_button_pk {
            width: 1000px;
            height: 50px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .board_write_button_pk > button {
            width: 60px;
            height: 25px;
            font-size: 10px;
            color: var(--font-color-1);
            border-radius: 20px;
            background-color: var(--button-color-3);
        }

        .board_write_button_pk > button:hover {
            cursor: pointer;
        }

        /* 게시판 제목 행 */
        .board_titleRow_pk {
            border-top: 1px solid var(--border-color-2);
            border-bottom: 1px solid var(--border-color-1);
            display: flex;
        }

        .board_titleRow_no {
            width: 50px;
        }

        .board_titleRow_title {
            width: 600px;
            display: flex;
            align-items: center;
        }

        .board_titleRow_writer {
            width: 200px;
        }

        .board_titleRow_writingTime {
            width: 90px;
        }

        .board_titleRow_views {
            width: 60px;
        }

        /* 게시판 내용 */
        .board_contentRow_pk {
            display: flex;
            border-bottom: 1px solid var(--border-color-1);
        }

        .board_content_no {
            width: 50px;
        }

        .board_content_title {
            width: 600px;
            display: flex;
            align-items: center;
        }

        .board_content_writer {
            width: 200px;
        }

        .board_content_writingTime {
            width: 90px;
        }

        .board_content_views {
            width: 60px;
        }

        /* 게시판 페이징 넘버 */
        /* 게시판 페이지 전체 */
        .board_page_number_pk {
            width: 1000px;
            height: 50px;
        }

        /* 게시판 페이지 박스 패키지 */
        .board_page_number_boxPk {
            width: 270px;
            height: 30px;
            display: flex;
        }

        .board_page_number_boxPk > div {
            width: 30px;
            font-size: 16px;
            text-align: center;
        }

        .board_page_number_boxPk > div:hover {
            cursor: pointer;
            border-bottom: 1px solid var(--border-color-2);
        }
    </style>
</head>
<body>
<div id="root">

    <%@ include file="header.jsp" %>

    <main class="board">
        <div class="board_top_pk">
            <div class="board_top_title">자유 게시판</div>
            <div class="board_top_classify">
                <div class="classify_entireBoard">전체</div>
                <div class="classify_notice">Notice</div>
                <div class="classify_faq">FAQ</div>
                <div class="classify_qna">Q&A</div>
                <div class="classify_freeBoard">자유</div>
            </div>
        </div>
        <div class="board_bottom_pk">
            <form action="">
                <div class="board_serach_pk">
                    <select class="search_option" name="option">
                        <option value="">제목+내용</option>
                        <option value="">제목만</option>
                        <option value="">작성자</option>
                    </select>
                    <input class="search_text_input" type="text" placeholder="  Search"/>
                    <input class="search_button" type="submit" value="검색">
                </div>
            </form>
            <div class="board_content_pk">
                <div class="board_titleRow_pk">
                    <div class="board_titleRow_no center_flex_item">No</div>
                    <div class="board_titleRow_title center_flex_item">제목</div>
                    <div class="board_titleRow_writer center_flex_item">글쓴이</div>
                    <div class="board_titleRow_writingTime center_flex_item">
                        작성시간
                    </div>
                    <div class="board_titleRow_views center_flex_item">조회수</div>
                </div>
                <div class="board_contentRow_pk">
                    <div class="board_content_no center_flex_item">10</div>
                    <div class="board_content_title">
                        오늘내일프론트완성하고그다음부터후딱백하자!
                    </div>
                    <div class="board_content_writer center_flex_item">
                        엉망진창우당탕탕개발자
                    </div>
                    <div class="board_content_writingTime center_flex_item">
                        2023-05-03
                    </div>
                    <div class="board_content_views center_flex_item">0</div>
                </div>

                <div class="board_write_button_pk">
                    <button>글쓰기</button>
                </div>
                <div class="board_page_number_pk center_flex_item">
                    <div class="board_page_number_boxPk">
                        <!-- 앞쪽 페이지로, 가장 앞쪽 페이지쪽은 제외 -->
                        <div>&lt;&lt;</div>
                        <div>&lt;</div>

                        <!-- 페이지 개수에 따라 최대 5개까지 -->
                        <div>1</div>
                        <div>2</div>
                        <div>3</div>
                        <div>4</div>
                        <div>5</div>

                        <!-- 뒤쪽 페이지로, 가장 마지막 페이지쪽은 제외-->
                        <div>&gt;</div>
                        <div>&gt;&gt;</div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>
