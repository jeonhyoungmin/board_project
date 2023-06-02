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

        .content_textarea {
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

        #comment_content_container {
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
        }

        #comment_nickname {
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
            /*margin-top: 10px;*/
            /*padding-bottom: 5px;*/
        }

        .comment_button_box {
            display: none;
            justify-content: flex-end;
            margin-top: 5px;
        }

        .comment_button {
            width: 40px;
            height: 25px;
            margin-left: 10px;
        }

        .comment_writer {
            display: flex;
            align-items: center;
            font-size: 16px;
            margin: 10px;
        }

        #commentMenuBtn {
            font-size: 12px;
            cursor: pointer;
            display: none;
        }

        #commentMenu {
            display: none;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            list-style: none;
            width: 70px;
            height: 70px;
            box-shadow: 5px 5px 5px #e9ecef;
            font-size: 14px;
            position: absolute;
            background-color: white;
        }

        #commentReportMenu {
            display: none;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            list-style: none;
            width: 70px;
            height: 35px;
            box-shadow: 5px 5px 5px #e9ecef;
            font-size: 14px;
            position: absolute;
            background-color: white;
        }

        #commentModifyBtn {
            cursor: pointer;
        }

        #commentModifyBtn:hover {
            background-color: #e9ecef;
        }

        #commentDeleteBtn {
            cursor: pointer;
        }

        #commentDeleteBtn:hover {
            background-color: #e9ecef;
        }

        #commentReportBtn {
            cursor: pointer;
        }

        #commentReportBtn:hover {
            background-color: #e9ecef;
        }

        .comment {
            font-weight: lighter;
            font-size: 14px;
            margin: 10px;
            width: 100%;
            border: none;
        }

        .comment:focus {
            outline: none;
        }

        .comment_reg_date {
            margin: 10px;
            font-size: 12px;
        }

        #comment_container {
            display: flex;
            flex-direction: column;
        }

        .reply {
            font-size: 12px;
            margin: 10px;
        }

        .reply:hover {
            cursor: pointer;
        }

        .replyViewBtn {
            width: 100%;
            margin-left: 10px;
            color: #0086e5;
        }

        .replyViewBtn:hover {
            cursor: pointer;
        }

        #replyCommentContainer {
            display: none;
            flex-direction: column;
            position: relative;
            margin: 20px;
            width: 90%;
            height: 50px;
        }

        #replyCommentNickname {
            font-size: 14px;
        }

        #replyCommentInput {
            width: 100%;
            height: 30px;
            border: none;
            border-bottom: 1px solid var(--border-color-1);
        }

        #replyCommentInput:focus {
            width: 100%;
            height: 30px;
            border: none;
            border-bottom: 2px solid black;
            outline: none;
        }

        #replyCommentBtnBox {
            display: flex;
            justify-content: flex-end;
            margin-top: 5px;
        }

        .replyCommentBtn {
            cursor: pointer;
            width: 40px;
            height: 25px;
            margin-left: 10px;
        }

        #replyCommentViewContainer {
            display: none;
            flex-direction: column;
            margin-left: 20px;
            border-left: 1px solid black;
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
                        class="content_textarea"
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
                        <button type="button" id="modifyBtn" onclick="location.href=
                                '<c:url value='/board/modify?bno=${boardDto.bno}&before_address=${before_address}'/>'">
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

                    <button type="button" id="listBtn" onclick="location.href = '<c:url value='${before_address}'/>'">
                        <!-- 직전 페이지로 이동 -->
                        <i class="fa fa-bars"></i> 목록
                    </button>
                </div>
            </form>
        </div>
    </div>

    <%--    <c:if test="${mode == 'read' || mode == 'modify'}">--%>
    <div class="comment_container">
        <c:if test="${mode != 'write'}">
            <div id="comment_content_container">
                <h3 class="comment_header">댓글 <span id="comment_count">${boardDto.comment_cnt}</span>개</h3>

                <div class="comment_input_container">
                    <div class="comment_input_flex_box">
                        <div id="comment_nickname">${sessionIdNickname}</div>
                        <input id="comment_input" class="comment_input"
                               placeholder="${id == '' ? "로그인 후 댓글을 달 수 있습니다." : "댓글 추가.."}"
                               value='<c:out value=""/>' required/>
                        <div id="commentButtonBox" class="comment_button_box">
                            <button id="commentCancelBtn" class="comment_button">취소</button>
                            <button id="commentRequestBtn" class="comment_button">저장</button>
                        </div>
                    </div>
                </div>

                <!-- 댓글 부모 태그-->
                <div id="comment_container"></div>

            </div>
        </c:if>

        <!-- 수정&삭제 메뉴 버튼 -->
        <div id="commentMenuBtn">
            <i class='fa fa-bars' aria-hidden='true'></i>
        </div>

        <!-- 수정&삭제 메뉴 -->
        <ul id="commentMenu">
            <li id="commentModifyBtn"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&ensp; 수정</li>
            <li id="commentDeleteBtn"><i class="fa fa-trash-o" aria-hidden="true"></i>&ensp; 삭제</li>
        </ul>

        <!-- 댓글 신고 메뉴 -->
        <ul id="commentReportMenu">
            <li id="commentReportBtn"><i class="fa fa-bell-o" aria-hidden="true"></i>&ensp; 신고</li>
        </ul>

        <!-- 댓글 수정 태그 -->
        <div id="commentModifyContainer" class="comment_input_container" style="display: none">
            <div class="comment_input_flex_box">
                <div id="comment_modify_nickname"></div>
                <input id="comment_modify_input" class="comment_input" value='<c:out value=""/>' required/>
                <div id="commentModifyButtonBox" class="comment_button_box">
                    <button id="commentModifyCancelBtn" class="comment_button">취소</button>
                    <button id="commentModifyRequestBtn" class="comment_button">저장</button>
                </div>
            </div>
        </div>

        <!-- 답글 추가 태그 -->
        <div id="replyCommentContainer">
            <div id="replyCommentNickname"></div>
            <input id="replyCommentInput" value='<c:out value=""/>' required/>
            <!-- contenteditable 방식 -->
            <%--<div dir="auto" id="replyCommentInput" contenteditable="true"><c:out value="작성해주세요"/></div>--%>
            <div id="replyCommentBtnBox">
                <button id="replyCommentCancelBtn" class="replyCommentBtn">취소</button>
                <button id="replyCommentRequestBtn" class="replyCommentBtn">저장</button>
            </div>
        </div>

        <!-- 답글 보기 태그 -->
        <div id="replyCommentViewContainer"></div>

    </div>
    <script>
        window.onload = () => {
            // comment event
            // 변수 설정
            let bno = ${boardDto.bno};
            let nickname = "" // 로그인 유저의 닉네임
            const comment_container = document.getElementById("comment_container") // 댓글 컨테이너
            const comment_nickname = document.getElementById("comment_nickname") // 로그인 유저 닉네임
            const commentInput = document.getElementById("comment_input") // 댓글 input Tag
            const commentButtonBox = document.getElementById("commentButtonBox") // 댓글 취소, 작성 버튼 박스
            const commentCancelBtn = document.getElementById("commentCancelBtn") // 댓글 작성 취소 버튼
            const commentRequestBtn = document.getElementById("commentRequestBtn") // 댓글 작성 버튼
            const comment_count = document.getElementById("comment_count") // 댓글 개수
            // 메뉴 관련 태그 모음
            const commentMenuBtn = document.getElementById("commentMenuBtn") // 댓글 수정&삭제 메뉴 버튼
            const commentMenu = document.getElementById("commentMenu") // 댓글 수정&삭제 메뉴
            const commentReportMenu = document.getElementById("commentReportMenu") // 댓글 신고 메뉴
            const commentModifyBtn = document.getElementById("commentModifyBtn") // 댓글 수정 버튼
            const commentDeleteBtn = document.getElementById("commentDeleteBtn") // 댓글 삭제 버튼
            // 댓글 수정 태그 모음
            const commentModifyContainer = document.getElementById("commentModifyContainer") // 댓글 수정 컨테이너 태그
            const comment_modify_nickname = document.getElementById("comment_modify_nickname") // 댓글 수정 작성자 태그
            const comment_modify_input = document.getElementById("comment_modify_input") // 댓글 수정 input 태그
            const commentModifyButtonBox = document.getElementById("commentModifyButtonBox") // 댓글 수정 버튼 박스
            const commentModifyCancelBtn = document.getElementById("commentModifyCancelBtn") // 댓글 수정 취소 버튼
            const commentModifyRequestBtn = document.getElementById("commentModifyRequestBtn") // 댓글 수정 완료 버튼
            // 답글 추가 태그 모음
            const replyCommentContainer = document.getElementById("replyCommentContainer") // 답글 컨테이너 태그
            const replyCommentCancelBtn = document.getElementById("replyCommentCancelBtn") // 답글 취소 버튼
            const replyCommentRequestBtn = document.getElementById("replyCommentRequestBtn") // 답글 등록 버튼
            const replyCommentNickname = document.getElementById("replyCommentNickname") // 답글 작성자 태그
            const replyCommentInput = document.getElementById("replyCommentInput") // 답글 input 태그
            // 답글 보기 태그 모음
            const replyCommentViewContainer = document.getElementById("replyCommentViewContainer") // 답글 보기 컨테이너 태그

            // 제출 클릭 이벤트
            commentInput.addEventListener("click", () => { // 댓글 input Tag 클릭 시, 취소 & 댓글 버튼 보이기
                commentButtonBox.style.display = "flex"
            })
            commentCancelBtn.addEventListener("click", () => { // 댓글 input Tag 클릭 시, 취소 & 댓글 버튼 숨기기
                commentInput.value = ""
                commentButtonBox.style.display = "none"
            })


            const showNickname = () => { // bno 에 해당하는 모든 댓글을 보여주는 함수
                if ("${id}" == null || "${id}" == '') return
                fetch("/board/board/nickname?id=${id}", {
                    method: "GET",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                })
                    .then(async res => {
                        let resData = await res.json();
                        nickname = resData.nickname // 로그인 한 유저의 닉네임 저장
                        comment_nickname.innerText = nickname
                        replyCommentNickname.innerText = nickname
                    })
                    .catch(error => {
                        console.error('실패:', error)
                    })
            }

            // 함수 모음
            const showComment = () => { // bno 에 해당하는 모든 댓글을 보여주는 함수
                fetch("/board/board/comments?bno=" + bno, {
                    method: "GET",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                })
                    .then(async res => {
                        let resData = await res.json();
                        comment_container.innerHTML = commentToHtml(resData) // 댓글 추가 함수 적용
                        comment_count.innerText = resData.length
                        setTimeout(loading, 10); // comments 가져오기 후 적용할 이벤트 실행
                    })
                    .catch(error => {
                        console.error('실패:', error)
                    })
            }

            const commentToHtml = (comment) => { // 댓글 html 동적 생성
                let tmp = ""
                comment.forEach((comment) => {
                    tmp += "<div class='comment_content' data-cno=" + comment.cno + " data-pcno=" + comment.pcno + " data-bno=" + comment.bno + ">"
                    tmp += "<div>"
                    tmp += "<div class='comment_writer'> <i class='fa fa-user-o' aria-hidden='true' style='margin-right: 10px'></i>" + comment.commenter
                    tmp += "<div class='comment_reg_date'>" + comment.trans_reg_date
                    if (comment.modify) tmp += "(수정됨)"
                    tmp += "</div></div>"
                    tmp += "<div class='comment'>" + comment.comment + "</div>"
                    tmp += "<div><div class='reply'> 답글 </div></div>"
                    if (comment.pcno != -1) tmp += " <div> <div class='replyViewBtn'> &nbsp; <i class='fa fa-caret-down' aria-hidden='true'></i> &nbsp;답글 " + (Math.abs(comment.pcno) - 1) + "</div> </div>";
                    tmp += "</div>"
                    tmp += "</div>"
                })
                return tmp;
            }

            const commentRequest = () => { // 댓글 달기 이벤트 함수
                let comment = commentInput.value;
                if (comment.trim() == "") return alert("댓글을 작성해 주세요")
                if ("${id}" == "") return alert("로그인 후 댓글을 달아주세요.")
                fetch("/board/board/comments/" + bno, {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(comment)
                })
                    .then(() => {
                        commentInput.value = "";
                        showComment();
                    })
                    .catch(error => {
                        alert("로그인 후 댓글을 달아주세요.")
                        console.error(error)
                    })
            }

            const commentDelete = (cno, writer) => { // 댓글 삭제 이벤트 함수
                if (!confirm("댓글을 정말로 삭제하시겠습니까?")) {
                    // 수정&삭제 메뉴 버튼 이벤트 초기화
                    commentMenuBtn.style.display = "none"
                    commentMenuBtn.removeChild(commentMenu)
                    document.removeEventListener("click", commentMenuHide)
                    comment_container.addEventListener("mouseover", commentMenuMove)
                    comment_container.addEventListener("mouseleave", commentMenuBtnHide)
                    commentMenuBtn.addEventListener("click", commentMenuShow)
                    return
                }
                if ("${id}" == "" || nickname != writer) return alert("유효하지 않는 요청입니다.");
                fetch("/board/board/comments/" + cno, {
                    method: "DELETE",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                })
                    .then(() => {
                        // 댓글 삭제 후 이벤트
                        showComment(); // 전체 댓글을 다시 가져오기
                        commentMenuBtn.style.display = "none" // 댓글 수정&삭제 버튼 안 보이기
                        commentMenuBtn.removeChild(commentMenu) // 댓글 수정&삭제 메뉴 tag 제거
                    })
                    .catch(error => {
                        alert("로그인이 필요한 요청입니다.")
                        console.error(error)
                    })
            }

            const commentModify = (cno, writer) => { // 댓글 수정 이벤트 함수
                if ("${id}" == "" || nickname != writer) return alert("유효하지 않는 요청입니다.")
                let comment = comment_modify_input.value
                if (comment == commentValue) return alert("내용을 변경해 주세요.")
                fetch("/board/board/comments/" + cno, {
                    method: "PUT",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(comment)
                })
                    .then(() => {
                        // 댓글 삭제 후 이벤트
                        showComment(); // 전체 댓글을 다시 가져오기
                        comment_container.addEventListener("mouseover", commentMenuMove)
                        comment_container.addEventListener("mouseleave", commentMenuBtnHide)
                    })
                    .catch(error => {
                        alert("로그인이 필요한 요청입니다.")
                        console.error(error)
                    })
            }

            const replyRequest = (cno) => { // 답글 달기 이벤트 함수
                let comment = replyCommentInput.value;
                let bno = "${boardDto.bno}"
                if (comment.trim() == "") return alert("답글 작성해 주세요")
                if ("${id}" == "") return alert("로그인 후 답글을 달아주세요.")
                fetch("/board/board/replyComments/" + bno + "/" + cno + "/" + comment, {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                })
                    .then(() => {
                        replyCommentInput.value = "";
                        replyCommentContainer.style.display = "none"
                        showComment();
                    })
                    .catch(error => {
                        alert("로그인 후 답글을 달아주세요.")
                        console.error(error)
                    })
            }

            const showReply = (cno) => { // 답글 보이기 이벤트 함수
                // cno 와 동일한 pcno 을 가지고 있는 답글들 가지고 오기
                fetch("/board/board/replyComments?cno=" + cno, {
                    method: "GET",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                })
                    .then(async res => {
                        let resData = await res.json();
                        replyCommentViewContainer.innerHTML = replyToHtml(resData) // 댓글 추가 함수 적용
                        // 해당 댓글의 답글 보기 태그를 클릭 시, 답글 안의 답글 쓰기 버튼 활성화
                        setTimeout(replyOfReplyCommentBtnAll, 10);
                    })
                    .catch(error => {
                        console.error(error)
                    })
            }

            const replyToHtml = (comment) => { // 댓글 html 동적 생성
                let tmp = ""
                comment.reverse().forEach((comment) => {
                    tmp += "<div class='comment_content' data-cno=" + comment.cno + " data-pcno=" + comment.pcno + " data-bno=" + comment.bno + ">"
                    tmp += "<div>"
                    tmp += "<div class='comment_writer'> <i class='fa fa-user-o' aria-hidden='true' style='margin-right: 5px'></i>" + comment.commenter
                    tmp += "<div class='comment_reg_date'>" + comment.trans_reg_date
                    if (comment.modify) tmp += "(수정됨)"
                    tmp += "</div></div>"
                    tmp += "<div class='comment'>" + comment.comment + "</div>"
                    tmp += "<div><div class='reply'> 답글 </div></div>"
                    tmp += "</div>"
                    tmp += "</div>"
                })
                return tmp;
            }

            // 실행
            // 페이지 로딩 시, 사용자 nickname 가져오기
            showNickname();
            // 페이지 로딩 시, 전체 댓글 가져오기
            showComment();

            commentRequestBtn.addEventListener("click", () => { // 댓글 달기 버튼 클릭 이벤트
                commentRequest()
            })

            // 수정&삭제 메뉴 관련 이벤트
            // 작성자, cno 초기화
            let writer = ""
            let cno = -1;
            let modifyTarget;
            let commentValue = ""
            let commentMenuMove = (e) => { // 수정&삭제 메뉴 버튼을 옮기는 이벤트
                if (e.target.classList == "comment_content") {
                    e.target.children[0].children[0].appendChild(commentMenuBtn)
                    commentMenuBtn.style.display = "block"
                }
            }
            // 수정&삭제 메뉴 버튼 숨기는 이벤트
            let commentMenuBtnHide = () => {
                commentMenuBtn.style.display = "none"
            }
            // 수정&삭제 메뉴 숨기는 이벤트
            let commentMenuHide = () => {
                if (writer == nickname) { // 댓글 작성자와 로그인 유저가 동일하다면, 수정&삭제 메뉴 표시
                    commentMenuBtn.style.display = "none"
                    commentMenuBtn.removeChild(commentMenu)
                } else { // 댓글 작성자와 로그인 유저가 동일하지 않다면, 신고 메뉴 표시
                    commentMenuBtn.style.display = "none"
                    commentMenuBtn.removeChild(commentReportMenu)
                }
                setTimeout(() => {
                    // 5. 수정&삭제 메뉴를 안보이게 하는 document 이벤트 삭제
                    document.removeEventListener("click", commentMenuHide)
                    // 1번부터 다시 반복
                    comment_container.addEventListener("mouseover", commentMenuMove)
                    commentMenuBtn.addEventListener("click", commentMenuShow)
                    comment_container.addEventListener("mouseleave", commentMenuBtnHide)
                }, 10)
            }
            let commentMenuShow = (e) => {
                // 댓글 작성자
                commentValue = e.target.parentNode.parentNode.parentNode.childNodes[1].innerText
                writer = e.target.parentNode.parentNode.childNodes[2].data
                modifyTarget = e.target.parentNode.parentNode.parentNode.parentNode
                console.log(writer)
                console.log(nickname)
                console.dir(e.target.parentNode.parentNode.childNodes)
                if (writer == nickname) { // 댓글 작성자와 로그인 유저가 동일하다면, 수정&삭제 메뉴 표시
                    cno = e.target.parentNode.parentNode.parentNode.parentNode.dataset["cno"]
                    commentMenuBtn.appendChild(commentMenu);
                    commentMenu.style.display = "flex"
                } else { // 댓글 작성자와 로그인 유저가 동일하지 않다면, 신고 메뉴 표시
                    commentMenuBtn.appendChild(commentReportMenu);
                    commentReportMenu.style.display = "flex"
                }
                // 3. 수정&삭제 메뉴 버튼을 옮기는 mouseover 임시 중지
                comment_container.removeEventListener("mouseover", commentMenuMove)
                // 수정&삭제 메뉴 버튼을 안 보이게 하는 이벤트 임시 중지
                comment_container.removeEventListener("mouseleave", commentMenuBtnHide)

                setTimeout(() => { // 4. 이후, 어디를 클릭하든 수정&삭제 메뉴를 안보이게 하는 이벤트 실행
                    document.addEventListener("click", commentMenuHide);
                }, 10)
            }
            // 1. 댓글 위에 mouseover 시, 수정&삭제 메뉴 버튼이 해당 댓글로 이동
            comment_container.addEventListener("mouseover", commentMenuMove)
            // 수정&삭제 메뉴 버튼을 안 보이게 하는 이벤트
            comment_container.addEventListener("mouseleave", commentMenuBtnHide)
            // 2. 수정&삭제 메뉴 버튼 클릭 시, 수정&삭제 메뉴를 해당 댓글 수정&메뉴 버튼 자식 태그로 이동(붙이기)
            commentMenuBtn.addEventListener("click", commentMenuShow)
            // 댓글 삭제 버튼 이벤트
            commentDeleteBtn.addEventListener("click", () => {
                commentDelete(cno, writer)
            })
            // 댓글 수정 버튼 이벤트
            let hide_tag
            commentModifyBtn.addEventListener("click", () => {
                commentMenuBtn.style.display = "none" // 수정&삭제 메뉴 버튼 숨기기
                commentMenuBtn.removeChild(commentMenu) // 수정&삭제 메뉴 태그 삭제
                document.removeEventListener("click", commentMenuHide) // 메뉴 숨기는 click 이벤트 임시 중지

                hide_tag = modifyTarget.children[0] // 숨길 댓글 태그 모음
                hide_tag.style.display = "none" // 타겟 댓글 태그 숨김
                commentModifyContainer.style.display = "block"
                modifyTarget.appendChild(commentModifyContainer) // 수정 태그 타겟 태그에 붙이기
                comment_modify_nickname.innerText = writer // 수정자
                comment_modify_input.value = commentValue // 기존 댓글 내용
                comment_modify_input.focus()
                commentModifyButtonBox.style.display = "flex"
            })

            // 댓글 수정 취소 버튼 클릭 이벤트
            commentModifyCancelBtn.addEventListener("click", () => {
                comment_container.addEventListener("mouseover", commentMenuMove)
                comment_container.addEventListener("mouseleave", commentMenuBtnHide)
                commentModifyContainer.style.display = "none"
                hide_tag.style.display = "block"
            })

            commentModifyRequestBtn.addEventListener("click", () => {
                commentModify(cno, writer)
            })


            // reply comment event
            const loading = () => { // 댓글 로딩 후, 사용 가능한 이벤트
                // 답글 다는 버튼 이벤트 설정
                let reply = document.querySelectorAll(".reply")
                reply.forEach((reply) => {
                    reply.addEventListener("click", () => {
                        if ("${id}" == "" || "${id}" == null) return alert("로그인 후 답글을 달 수 있습니다.")
                        reply.parentNode.appendChild(replyCommentContainer)
                        replyCommentContainer.style.display = "flex"
                    })
                })

                // 답글 보는 버튼 이벤트 설정
                let replyViewBtnAll = document.querySelectorAll(".replyViewBtn")
                replyViewBtnAll.forEach((replyViewBtn) => {
                    replyViewBtn.addEventListener("click", (e) => {

                        // 해당 답글의 cno 값 가져오기
                        let cno = e.target.parentNode.parentNode.parentNode.dataset["cno"];
                        let upANDdown = e.target.children[0]
                        if (upANDdown.className == "fa fa-caret-down") { // 화살표가 아래로 향하고 있을 경우
                            showReply(cno)
                            upANDdown.className = "fa fa-caret-up"
                            replyViewBtn.parentNode.appendChild(replyCommentViewContainer)
                            replyCommentViewContainer.style.display = "flex"

                            // 클릭한 답글 보기 버튼의 댓글로 이동
                            let comment_content = e.target.parentNode.parentNode.parentNode
                            let offsetTop = comment_content.offsetTop - 60 // header 길이 만큼 뺴기
                            scrollTo({top: offsetTop, behavior: "smooth"})

                        } else if (upANDdown.className == "fa fa-caret-up") { // 화살표가 위로 향하고 있을 경우
                            upANDdown.className = "fa fa-caret-down";
                            replyCommentViewContainer.style.display = "none"
                        }

                        replyViewBtnAll.forEach((replyViewBtn) => { // 다른 답글 보기 버튼이 클릭되었을 경우, 이전에 열렸던 답글 닫기
                            if (replyViewBtn.parentNode.children.length == 1) { // 답글 보이기 태그가 없을 경우
                                replyViewBtn.children[0].className = "fa fa-caret-down";
                            }
                        })
                    })

                })

            }

            // 답글 안의 답글 이벤트 함수
            let replyOfReplyCommentBtnAll = () => {
                let replyAll = document.querySelectorAll("#replyCommentViewContainer > .comment_content > div > div > .reply")
                replyAll.forEach((reply) => {
                    reply.addEventListener("click", () => {
                        if ("${id}" == "" || "${id}" == null) return alert("로그인 후 답글을 달 수 있습니다.")
                        reply.parentNode.appendChild(replyCommentContainer)
                        replyCommentContainer.style.display = "flex"
                    })
                })
            }

            replyCommentCancelBtn.addEventListener("click", (e) => {
                replyCommentContainer.style.display = "none"
            })

            replyCommentRequestBtn.addEventListener("click", (e) => {
                let number
                let pcno = e.target.parentNode.parentNode.parentNode.parentNode.parentNode.dataset["pcno"]
                let cno = e.target.parentNode.parentNode.parentNode.parentNode.parentNode.dataset["cno"]
                if (pcno > 0) { // 0보다 클 경우 답글
                    // 답글일 경우 pcno 값을 cno 값으로 사용
                    number = pcno
                } else if (pcno < 0) { // 0보다 작을 경우 댓글
                    // 댓글일 경우 cno 값을 그대로 사용
                    number = cno
                }
                replyRequest(number)
            })

        }
    </script>
</body>
</html>
