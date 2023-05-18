<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!--%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %-->
<%@ page session="false" %>
<c:set var="sessionId"
       value="${pageContext.request.getSession(false)==null ? '':pageContext.request.session.getAttribute('id')}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>myinfo</title>
    <style>
        #root {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        main {
            width: 50vw;
            height: 500px;
            position: relative;
            top: 150px;
        }

        h2 {
            border-bottom: 1px solid var(--border-color-1);
            padding-bottom: 10px;
        }


        button {
            color: var(--font-color-1);
            border-style: none;
            width: 100px;
            height: 30px;
            border-radius: 3px;
            position: relative;
            right: 120px;
        }

        button.change {
            background-color: var(--button-color-1);
        }

        button.back {
            background-color: var(--button-color-4);
        }

        button.red {
            background-color: var(--button-color-5);
        }

        label {
            width: 250px;
            height: 30px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        input {
            width: 210px;
            height: 25px;
            border: 1px solid var(--border-color-1);
            border-radius: 3px;
            padding: 5px;
        }

        .update_form {
            width: 100%;
            height: 400px;
            flex-direction: column;
            justify-content: space-between;
            display: flex;
        }

        .delete_form {
            width: 100%;
            display: flex;
            align-items: flex-end;
            margin-left: 10px;
        }

        .info_element_box {
            width: 1000px;
            display: flex;
            margin: 2px;
        }

        .info_element {
            width: 110px;
            height: 30px;
            border-right: 1px solid var(--border-color-1);
        }

        .nonchangeable {
            width: 210px;
            height: 25px;
            font-size: 16px;
        }

        .pwd_check_msg {
            color: red;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<script>
    let SERVER_MSG = "${msg}"
    if (SERVER_MSG == "PWD_UPDATE_FAIL") alert("비밀번호 변경에 실패했습니다.")
    if (SERVER_MSG == "PWD_UPDATE_SUCCESS") alert("비밀번호가 변경되었습니다.")
    if (SERVER_MSG == "PWD_FAIL") alert("영어, 숫자, 특수문자 하나씩을 포함하여 8~16자 이내로 입력해 주세요.")
    if (SERVER_MSG == "PWD_CHECK_FAIL") alert("비밀번호가 일치하지 않습니다.")
    if (SERVER_MSG == "USER_DELETE_FAIL") alert("탈퇴에 실패했습니다.")
</script>
<div id="root">

    <%@ include file="header.jsp" %>

    <main class="main">
        <h2>내 정보</h2>
        <div style="display: flex">

        <form class="update_form" action="<c:url value='/myinfo'/>" method="post">
            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">아이디</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">
                        ${userDto.id}
                    </div>
                </label>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">비밀번호</div>
                <label><input id="pwdCheck" type="password" name="pwd" value='<c:out value=""/>'/></label>
                <div id="pwdCheckMsg" class="center_flex_item fs_12 pwd_check_msg">
                </div>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">
                    비밀번호 확인
                </div>
                <label><input id="pwdDblCheck" type="password" name="pwdcheck" value='<c:out value=""/>'/></label>
                <div id="pwdDblCheckMsg" class="center_flex_item fs_12 pwd_check_msg">
                </div>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">이름</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">
                        ${userDto.username}
                    </div>
                </label>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">성별</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">${userDto.sex}</div>
                </label>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">이메일</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">
                        ${userDto.email}
                    </div>
                </label>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">생년월일</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">
                        ${userDto.birth}
                    </div>
                </label>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">닉네임</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">
                        ${userDto.nickname}
                    </div>
                </label>
            </div>

            <div class="info_element_box">
                <div class="info_element fs_16 ai_flex_center_item">가입일</div>
                <label>
                    <div class="nonchangeable ai_flex_center_item">
                        ${userDto.trans_reg_date}
                    </div>
                </label>
            </div>

            <div style="align-self: flex-end">
                <button class="change" type="submit">변경하기</button>
            </div>
        </form>
        <form class="delete_form" action="<c:url value='/myinfo'/>" method="post"
              onsubmit="return confirm('정말로 탈퇴하시겠습니까?')">
            <input type="hidden" name="_method" value="delete"/>
            <button class="red" type="submit">탈퇴하기</button>
        </form>
        </div>
    </main>
</div>
<script>
    window.onload = () => {

        const pwdCheck = document.getElementById("pwdCheck");
        const pwdCheckMsg = document.getElementById("pwdCheckMsg");
        const pwdDblCheck = document.getElementById("pwdDblCheck");
        const pwdDblCheckMsg = document.getElementById("pwdDblCheckMsg");

        const PWD_REG_EXP = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; // 영어 대소문자, 숫자, 특수문자 각각 최소 1개 포함 8~16
        const PWD_FAIL_MSG = "* 영어, 숫자, 특수문자 하나씩을 포함하여 8~16자 이내로 입력해 주세요";
        const PWD_CHECK_FAIL_MSG = "* 일치하지 않습니다"
        const FAIL_WARN_COLOR = "red";

        pwdCheck.addEventListener("keyup", () => {
            let target = pwdCheck.value;
            if (!PWD_REG_EXP.test(target)) {
                pwdCheckMsg.innerHTML = PWD_FAIL_MSG
                pwdCheckMsg.style.color = FAIL_WARN_COLOR;
            } else {
                pwdCheckMsg.innerHTML = ''
            }
        })

        pwdDblCheck.addEventListener("keyup", () => {
            let target = pwdCheck.value;
            let checkData = pwdDblCheck.value;
            if (target !== checkData) {
                pwdDblCheckMsg.innerHTML = PWD_CHECK_FAIL_MSG
                pwdDblCheckMsg.style.color = FAIL_WARN_COLOR;
            } else {
                pwdDblCheckMsg.innerHTML = ''
            }
        })

    }
</script>
</body>
</html>
