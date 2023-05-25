<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="false" %>

<c:set var="formAction" value="${mode == 'write' ? '/board/write' : mode == 'modify' ? '/board/modify' : ''}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>board</title>
    <style>
        #root {
            height: 100vh;
        }

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
            display: flex;
            align-items: flex-end;
        }

        .board_writer {
            margin-left: 20px;
            font-size: 14px;
            font-weight: lighter;
        }

        .title_input {
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
            width: 60px;
            height: 25px;
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
            display: flex;
            flex-direction: column;
            width: 700px;
            margin-bottom: 20vh;
        }

        .comment_header {
            padding-bottom: 5px;
            margin: 10px;
        }

        .comment_input_container {
            margin-left: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .comment_input_flex_box {
            width: 100%;
            height: 100px;
            display: grid;
            align-content: space-between;
        }

        .comment_nickname {
            height: 30px;
        }

        .comment_input {
            width: 100%;
            height: 30px;
            border: none;
            border-bottom: 1px solid var(--border-color-1);
        }

        .comment_input:focus {
            width: 100%;
            height: 30px;
            border: none;
            border-bottom: 2px solid black;
            outline: none;
        }

        .comment_content {
            border-bottom: 1px solid var(--border-color-1);
            margin-top: 10px;
            padding-bottom: 5px;
        }

        .comment_button {
            width: 40px;
            height: 25px;
            justify-self: flex-end;
        }

        .comment_writer {
            display: flex;
            align-items: center;
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

        button,
        select {
            border: 1px solid #ced4da;
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
<script>
    let SERVER_MSG = "${msg}"
    if (SERVER_MSG == "NEW_BOARD_REGISTER_FAIL") alert("게시물 등록에 실패했습니다.")
</script>
<div id="root">

    <%@ include file="header.jsp" %>

    <!-- 삭제 form -->
    <form style="display: none" id="removeForm" action="<c:url value='/board/remove'/>" method="post"
          onsubmit="return confirm('정말로 삭제하시겠습니까?')">
        <input type="hidden" name="_method" value="delete"/>
        <input type="hidden" name="bno" value='<c:out value="${boardDto.bno}"/>'/>
        <input type="hidden" name="before_address" value='<c:out value="${before_address}"/>'/>
    </form>

    <!-- 글쓰기, 댓글 포함 컨테이너 -->
    <div class="board_container">
        <!-- 글쓰기 컨테이너 -->
        <div class="board_content_container">
            <h2 class="board_header">게시판 ${mode == "write" ? "글쓰기" : mode == "read" ? "읽기" : "수정하기"}</h2>
            <!-- 읽기 및 수정 form -->
            <form action="<c:url value='${formAction}'/>" method="post" id="form" class="board_write_form">
                <input class="title_input" id="title" type="text" name="title"
                       value='<c:out value="${boardDto.title}"/>'
                       placeholder="  제목을 입력해 주세요"
                       minlength="1" maxlength="50" required ${mode == "read" ? "readonly" : ""}/>
                <input type="hidden" name="bno" value='<c:out value="${boardDto.bno}"/>'/>
                <input type="hidden" name="before_address" value='<c:out value="${before_address}"/>'/>
                <textarea
                        id="content"
                        name="content"
                        rows="20"
                        placeholder=" 내용을 입력해 주세요"
                        required
                ${mode == "read" ? "readonly" : ""}
                ><c:out value="${boardDto.content}"/></textarea>

                <div class="board_button_container">
                    <c:if test="${mode == 'write' || mode == 'modify'}"> <!-- mode 가 새 글 쓰기 또는 수정일 때 보이기 -->
                        <select name="category">
                            <option value="free" selected>자유</option>
                            <option value="qna" ${boardDto.category == "qna" ? "selected" : ""}>Q&A</option>
                        </select>
                    </c:if>

                    <c:if test="${mode == 'write'}">
                        <button type="submit" id="writeBtn">
                            <i class="fa fa-pencil"></i> 등록
                        </button>
                    </c:if>

                    <c:if test="${mode == 'read' && writerId != null && writerId == id}">
                        <button type="button" id="modifyBtn">
                            <i class="fa fa-edit"></i> 수정
                        </button>
                    </c:if>
                    <c:if test="${mode == 'modify' && writerId != null && writerId == id}">
                        <button type="submit" id="modifyBtn">
                            <i class="fa fa-edit"></i> 수정
                        </button>
                        <button type="submit" id="removeBtn" form="removeForm"> <!-- form 속성으로 target form 설정 -->
                            <i class="fa fa-trash"></i> 삭제
                        </button>
                    </c:if>

                    <button type="button" id="listBtn">
                        <!-- 직전 페이지로 이동 -->
                        <i class="fa fa-bars"></i> 목록
                    </button>
                </div>
            </form>
        </div>
    </div>

    <%--    <c:if test="${mode == 'read' || mode == 'modify'}">--%>
    <c:if test="${mode != 'write'}">
        <div class="comment_container">
            <div class="comment_content_container">
                <h3 class="comment_header">댓글 5개</h3>

                <div class="comment_input_container">
                    <div class="comment_input_flex_box">
                        <div class="comment_nickname">닉네임</div>
                        <input class="comment_input" placeholder="댓글 추가.."/>
                        <button class="comment_button">댓글</button>
                    </div>
                </div>

                <!-- 댓글 -->
                <div class="comment_content">
                    <div class="comment_writer">우당탕탕엉망진창개발자
                        <div class="comment_reg_date">2023-05-04 14:48</div>
                    </div>
                    <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                    <div></div>
                </div>

                <div class="comment_content">
                    <div class="comment_writer">우당탕탕엉망진창개발자
                        <div class="comment_reg_date">2023-05-04 14:48</div>
                    </div>
                    <div class="comment">여기는 댓글의 본 내용이 들어갑니다 !!</div>
                </div>
            </div>
        </div>
    </c:if>
</div>
<script>
    window.onload = () => {
        const listBtn = document.getElementById("listBtn");
        const modifyBtn = document.getElementById("modifyBtn");

        listBtn.addEventListener("click", () => { // 직전 목록 페이지로 이동
            location.href = '<c:url value='${before_address}'/>'
        })

        modifyBtn.addEventListener("click", () => { // 수정 페이지로 이동
            location.href = '<c:url value='/board/modify?bno=${boardDto.bno}&before_address=${before_address}'/>'
        })

    }
</script>
</body>
</html>
