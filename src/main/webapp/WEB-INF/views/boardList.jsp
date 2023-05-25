<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>boardList</title>
    <style>

        #root {
            height: 130vh;
        }

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

        .selected_category {
            border-bottom: 1px solid black;
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
            padding: 5px;
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
            height: 50px;
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

        .title {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
            height: 100px;
        }

        /* 게시판 페이지 박스 패키지 */
        .board_page_number_boxPk {
            height: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .board_page_number_boxPk > a {
            width: 30px;
            font-size: 20px;
            text-align: center;
        }

        .pagingNonActive {
            color: #dee2e6;
            cursor: default;
        }

        .pagingNonActive:hover {
            color: #dee2e6;
            cursor: default;
        }

        .selectedPage:visited {
            color: blue;
        }

        .comment_cnt {
            font-size: 12px;
        }
    </style>
</head>
<body>
<script>
    let SERVER_MSG = "${msg}"
    if (SERVER_MSG == "PAGE_NOT_FOUND") alert("게시물이 없습니다.")
    if (SERVER_MSG == "BOARD_READ_FAIL") alert("게시물을 읽을 수 없습니다.")
    if (SERVER_MSG == "BOARD_UPDATE_FAIL") alert("게시물 수정에 실패했습니다.")
    if (SERVER_MSG == "BOARD_UPDATE_SUCCESS") alert("게시물을 성공적으로 수정했습니다.")
    if (SERVER_MSG == "BOARD_DELETE_FAIL") alert("게시물 삭제에 실패했습니다.")
    if (SERVER_MSG == "BOARD_DELETE_SUCCESS") alert("게시물을 성공적으로 삭제했습니다.")
</script>
<div id="root">

    <%@ include file="header.jsp" %>

    <main class="board">
        <div class="board_top_pk">
            <div id="title" class="board_top_title"></div>
            <div class="board_top_classify">
                <a href="<c:url value='/list${ph.sc.getQueryString(1, "entire", "", "")}'/>"
                   class='${ph.sc.category=="entire" || ph.sc.category =="" ? "selected_category" : ""}'>Entire</a>
                <a href="<c:url value='/list${ph.sc.getQueryString(1, "notice", "", "")}'/>"
                   class='${ph.sc.category=="notice" ? "selected_category" : ""}'>Notice</a>
                <a href="<c:url value='/list${ph.sc.getQueryString(1, "faq", "", "")}'/>"
                   class='${ph.sc.category=="faq" ? "selected_category" : ""}'>FAQ</a>
                <a href="<c:url value='/list${ph.sc.getQueryString(1, "qna", "", "")}'/>"
                   class='${ph.sc.category=="qna" ? "selected_category" : ""}'>Q&A</a>
                <a href="<c:url value='/list${ph.sc.getQueryString(1, "free", "", "")}'/>"
                   class='${ph.sc.category=="free" ? "selected_category" : ""}'>Free</a>
            </div>
        </div>
        <div class="board_bottom_pk">
            <form action="">
                <div class="board_serach_pk">
                    <select class="search_option" name="option">
                        <option value='<c:out value="TC"/>'>제목+내용</option>
                        <option value='<c:out value="T"/>'>제목만</option>
                        <option value='<c:out value="W"/>'>작성자</option>
                    </select>
                    <input class="search_text_input" type="text" name="keyword"
                           value='<c:out value="${ph.sc.keyword}"/>' placeholder=" Search"/>
                    <input type="hidden" name="category"
                           value='<c:out value="${ph.sc.category == null ? 'entire' : ph.sc.category}"/>'>
                    <input type="hidden" name="page" value='<c:out value="1"/>'>
                    <input type="hidden" name="pageSize" value='<c:out value="10"/>'>
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

                <c:forEach var="boardDto" items="${list}">
                    <div class="board_contentRow_pk">
                        <div class="board_content_no center_flex_item">${boardDto.numbering}</div>
                        <div class="board_content_title">
                            <a class="title" href="<c:url value='/board/read?bno=${boardDto.bno}'/>">${boardDto.title} &ensp;</a> <!-- 읽기 준비 -->
                            <c:if test="${boardDto.comment_cnt > 0}">
                                <div class="comment_cnt">
                                    <div class="fa fa-commenting-o"></div>
                                        ${boardDto.comment_cnt}
                                </div>
                            </c:if>
                        </div>
                        <div class="board_content_writer center_flex_item">
                                ${boardDto.writer}
                        </div>
                        <div class="board_content_writingTime center_flex_item">
                            <c:choose>
                                <c:when test="${boardDto.reg_date_milliseconds >= startOfToday}"> <!-- 작성 날짜가 금일이면 yyyy-MM-dd 날짜 형식으로 표현 -->
                                    ${boardDto.reg_date_format_time}
                                </c:when>
                                <c:otherwise> <!-- 작성 날짜가 금일 이전이면 HH:mm 시간 형식으로 표현 -->
                                    ${boardDto.reg_date_format_date}
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="board_content_views center_flex_item">${boardDto.view_cnt}</div>
                    </div>
                </c:forEach>

                <div class="board_write_button_pk">
                    <button onclick="location.href='<c:url value='/board/write'/>'">글쓰기</button>
                </div>
                <div class="board_page_number_pk center_flex_item">
                    <div class="board_page_number_boxPk" style="${ph.sc.page < 100
                    ? "width:500px" : ph.sc.page > 1000
                    ? "width: 800px" : "width: 700px"}"> <!-- <a> tag 개수에 비례해서 width 값 늘어나게 바꾸기 -->
                        <c:if test="${ph.total_cnt==null || ph.total_cnt == 0}">
                            <div>게시물이 없습니다.</div>
                        </c:if>
                        <c:if test="${!(ph.total_cnt==null || ph.total_cnt == 0)}">
                            <c:if test="${ph.prePageActive}">
                                <a href="<c:url value='/list${ph.sc.getQueryString(1)}'/>">&lt;&lt;</a>
                                <a href="<c:url value='/list${ph.sc.getQueryString(ph.prePage)}'/>">&lt;</a>
                            </c:if>
                            <c:if test="${!ph.prePageActive}">
                                <a class="pagingNonActive">&lt;&lt;</a>
                                <a class="pagingNonActive">&lt;</a>
                            </c:if>
                        </c:if>

                        <!-- 페이지 개수에 따라 최대 5개까지 -->
                        <c:if test="${list != null}">
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="${ph.sc.page == i ? "selectedPage" : ""}"
                                   href="<c:url value='/list${ph.sc.getQueryString(i)}'/>">${i}</a>
                            </c:forEach>
                        </c:if>


                        <c:if test="${!(ph.total_cnt==null || ph.total_cnt == 0)}">
                            <c:if test="${ph.nextPageActive}">
                                <a href="<c:url value='/list${ph.sc.getQueryString(ph.nextPage)}'/>">&gt;</a>
                                <a href="<c:url value='/list${ph.sc.getQueryString(ph.totalPage)}'/>">&gt;&gt;</a>
                            </c:if>
                            <c:if test="${!ph.nextPageActive}">
                                <a class="pagingNonActive">&gt;</a>
                                <a class="pagingNonActive">&gt;&gt;</a>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script>
    window.onload = () => {
        let TITLE = "${ph.sc.category == "" ? "entire" : ph.sc.category}"
        if (TITLE == "entire") TITLE = "전체 게시판";
        if (TITLE == "notice") TITLE = "공지";
        if (TITLE == "faq") TITLE = "FAQ";
        if (TITLE == "qna") TITLE = "QNA";
        if (TITLE == "free") TITLE = "자유 게시판";
        const title = document.getElementById("title");
        title.innerHTML = TITLE;
    }
</script>
</body>
</html>
