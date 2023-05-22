<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%--<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>board</title>
    <style>
        /* 글쓰기, 댓글 포함 컨테이너 */
        .board_container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 150px;
        }
        /* 글쓰기 컨테이너 */
        .board_content_container {
            width: 700px;
        }
        .board_header {
            border-bottom: 1px solid var(--border-color-2);
        }
        input {
            width: inherit;
            height: 35px;
            border: 1px solid var(--border-color-1);
            margin: 5px 0px 10px 0px;
            padding: 8px;
            background: var(--box-background-1);
        }
        textarea {
            width: 100%;
            background: var(--box-background-1);
            margin: 5px 0px 10px 0px;
            border: 1px solid var(--border-color-1);
            resize: none;
            padding: 8px;
        }
        .board_write_form {
            display: flex;
            flex-direction: column;
        }
        .board_button_container {
            display: flex;
            justify-content: flex-end;
        }
        .board_button_container > button {
            width: 50px;
            margin-left: 10px;
        }
        /* 댓글 컨테이너 */
        .comment_container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            margin-bottom: 200px;
        }
        .comment_content_container {
            width: 700px;
        }
        .comment_header {
            border-bottom: 1px solid var(--border-color-1);
            padding-bottom: 5px;
            margin: 10px;
        }
        .comment_content {
            border-bottom: 1px solid var(--border-color-1);
            margin-top: 10px;
            padding-bottom: 5px;
        }
        .comment_writer {
            font-size: 16px;
            margin: 10px;
        }
        .comment {
            font-weight: lighter;
            font-size: 14px;
            margin: 10px;
        }
        .comment_reg_date {
            margin: 10px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div id="root">

    <%@ include file="header.jsp" %>

    <!-- 글쓰기, 댓글 포함 컨테이너 -->
    <div class="board_container">
        <!-- 글쓰기 컨테이너 -->
        <div class="board_content_container">
            <h2 class="board_header">게시판 글쓰기</h2>
            <form action="" id="form" class="board_write_form">
                <input type="text" placeholder="  제목을 입력해 주세요" />
                <textarea
                        name=""
                        rows="20"
                        placeholder=" 내용을 입력해 주세요"
                ></textarea>

                <div class="board_button_container">
                    <select name="option">
                        <option value="">카테고리를 선택해 주세요</option>
                        <option value="">Q&A</option>
                        <option value="">자유</option>
                    </select>
                    <button type="button" id="writeBtn">
                        <i class="fa fa-pencil"></i> 등록
                    </button>
                    <button type="button" id="modifyBtn">
                        <i class="fa fa-edit"></i> 수정
                    </button>
                    <button type="button" id="removeBtn">
                        <i class="fa fa-trash"></i> 삭제
                    </button>
                    <button type="button" id="listBtn">
                        <i class="fa fa-bars"></i> 목록
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="comment_container">
        <div class="comment_content_container">
            <h3 class="comment_header">댓글</h3>

            <!-- 댓글 -->
            <div class="comment_content">
                <div class="comment_writer">우당탕탕엉망진창개발자</div>
                <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                <div class="comment_reg_date">2023-05-04 14:48</div>
            </div>

            <div class="comment_content">
                <div class="comment_writer">우당탕탕엉망진창개발자</div>
                <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                <div class="comment_reg_date">2023-05-04 14:48</div>
            </div>

            <div class="comment_content">
                <div class="comment_writer">우당탕탕엉망진창개발자</div>
                <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                <div class="comment_reg_date">2023-05-04 14:48</div>
            </div>

            <div class="comment_content">
                <div class="comment_writer">우당탕탕엉망진창개발자</div>
                <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                <div class="comment_reg_date">2023-05-04 14:48</div>
            </div>

            <div class="comment_content">
                <div class="comment_writer">우당탕탕엉망진창개발자</div>
                <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                <div class="comment_reg_date">2023-05-04 14:48</div>
            </div>

            <!-- 대댓글 -->
        </div>
    </div>
</div>
</body>
</html>
