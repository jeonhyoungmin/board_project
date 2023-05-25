<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!--%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="css/style.css"/>
    <title>signup</title>
</head>
<style>
    a {
        color: var(--word-highlight-1);
    }

    a:visited {
        color: var(--word-highlight-1);
    }

    span {
        color: var(--word-highlight-1);
        font-size: 12px;
        font-weight: bold;
    }

    span:hover {
        cursor: pointer;
    }

    form {
        width: 100%;
        flex-direction: column;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        height: 40px;
        border: 1px solid var(--border-color-1);
        border-radius: 3px;
        padding: 0 10px;
        margin-top: 5px;
    }

    select {
        width: 100%;
        height: 40px;
        border: 1px solid var(--border-color-1);
        border-radius: 3px;
        padding-left: 5px;
        margin-top: 5px;
        color: var(--select-color-1);
    }

    input[type="checkbox"] {
        width: 15px;
        height: 15px;
    }

    button[type="submit"] {
        background-color: var(--button-color-1);
        color: var(--box-color-1);
        width: inherit;
        height: 40px;
        font-size: 17px;
        border: none;
        border-radius: 3px;
    }

    button {
        width: 100%;
        height: 35px;
        background-color: var(--box-background-2);
        border: 1px solid var(--border-color-1);
        text-align: center;
    }

    .mg_bottom_15 {
        margin-bottom: 15px;
        color: red;
    }

    .logo {
        font-size: 26px;
        font-family: "Pacifico", cursive; /* logo font */
        text-align: start;
        position: relative;
        bottom: 10px;
    }
    .logo:hover {
        cursor: pointer;
    }

    .container {
        width: 100%;
        height: 170vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
    }

    .signUp_offer {
        font-size: 14px;
        padding: 15px;
    }

    .signUp_box {
        width: 500px;
        height: 3000px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        margin-bottom: 80px;
    }

    /* 소셜 로그인 박스 */
    .social_box {
        width: 100%;
        height: 120px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
</style>
<body>
<div id="root">
    <div class="container">
        <div class="signUp_offer jc_space_between_item">
            <div class="logo" onclick='location.href="<c:url value='/'/>"'>Surup</div>
            <div>이미 슈룹 계정이 있으신가요? &nbsp; <span><a href="<c:url value='/login'/>">로그인</a></span></div>
        </div>

        <div class="signUp_box center_flex_item">
            <h2>회원가입</h2>
            <form class="center_flex_item" action="<c:url value='/signup'/>" method="post">
                <div class="jc_space_between_item fs_14">아이디</div>
                <input
                        id="idCheck"
                        name="id"
                        value='<c:out value="${userDto.id}"/>'
                        type="text"
                        placeholder="영어, 숫자를 조합하여 5~12글자 이내로 입력해 주세요"
                        required
                />
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="idCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">비밀번호</div>
                </div>
                <input
                        id="pwdCheck"
                        name="pwd"
                        value='<c:out value="${userDto.pwd}"/>'
                        type="password"
                        placeholder="영어, 숫자, 특수문자 하나씩을 포함하여 8~16자 이내로 입력해 주세요"
                        required
                />
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="pwdCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">비밀번호 확인</div>
                </div>
                <input id="pwdDblCheck" name="pwdcheck" value='<c:out value="${userDto.pwdcheck}"/>' type="password"
                       placeholder="비밀번호를 입력해 주세요" required/>
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="pwdDblCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">이름</div>
                </div>
                <input id="usernameCheck" name="username" value='<c:out value="${userDto.username}"/>' type="text"
                       placeholder="이름을 입력해 주세요" required/>
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="usernameCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">닉네임</div>
                </div>
                <input
                        id="nicknameCheck"
                        name="nickname"
                        value='<c:out value="${userDto.nickname}"/>'
                        type="text"
                        placeholder="한글, 영어, 숫자를 조합하여 2~10글자 이내로 입력해 주세요"
                        required
                />
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="nicknameCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">성별</div>
                </div>
                <select name="sex" id="sexCheck" required>
                    <option value="" >성별을 선택해 주세요</option>
                    <option value='<c:out value="남"/>' ${fn:contains(userDto.sex, '남') ? "selected" : ""}>남</option>
                    <option value='<c:out value="여"/>' ${fn:contains(userDto.sex, '여') ? "selected" : ""}>여</option>
                </select>
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="sexCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">생년월일</div>
                </div>
                <input
                        id="birthCheck"
                        name="resident_registration_number"
                        value='<c:out value="${userDto.resident_registration_number}"/>'
                        type="text"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                        placeholder="생년월일 8글자를 입력해주세요"
                        required
                />
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="birthCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>

                <div class="jc_space_between_item ai_flex_end_item">
                    <div class="fs_14">이메일</div>
                </div>
                <input id="emailCheck" name="email" value='<c:out value="${userDto.email}"/>' type="text"
                       placeholder="이메일을 입력해 주세요" required/>
                <div class="jc_space_between_item ai_flex_end_item">
                    <div id="emailCheckMsg" class="fs_12 mg_bottom_15"></div>
                </div>


                <div class="jc_space_between_item">
                    <label class="fs_12 ai_flex_end_item"
                    ><input id="policyAgreeCheck" name="policy_agree" type="checkbox"/> &numsp;<span>이용약관</span>과 &nbsp;
                        <span> 개인정보취급방침</span>에 동의합니다</label
                    >
                </div>

                <br/>
                <button type="submit">가입하기</button>
            </form>

            <!-- or -->
            <div class="jc_space_between_item ai_flex_center_item">
                <hr style="width: 40%; height: 1%"/>
                <div class="fs_14">or</div>
                <hr style="width: 40%; height: 1%"/>
            </div>

            <!-- 소셜 로그인 -->
            <div class="social_box">
                <button class="fs_12">구글 계정으로 회원가입</button>
                <button class="fs_12">네이버 계정으로 회원가입</button>
                <button class="fs_12">카카오톡 계정으로 회원가입</button>
            </div>
            <div class="signUp_offer">
                이미 슈룹 계정이 있으신가요? &nbsp; <span><a href="<c:url value='/login'/>">로그인</a></span>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = () => {
        // 태그
        const idCheck = document.getElementById("idCheck")
        const idCheckMsg = document.getElementById("idCheckMsg")
        const nicknameCheck = document.getElementById("nicknameCheck")
        const nicknameCheckMsg = document.getElementById("nicknameCheckMsg")
        const pwdCheck = document.getElementById("pwdCheck")
        const pwdCheckMsg = document.getElementById("pwdCheckMsg")
        const pwdDblCheck = document.getElementById("pwdDblCheck")
        const pwdDblCheckMsg = document.getElementById("pwdDblCheckMsg")
        const usernameCheck = document.getElementById("usernameCheck")
        const usernameCheckMsg = document.getElementById("usernameCheckMsg")
        const birthCheck = document.getElementById("birthCheck")
        const birthCheckMsg = document.getElementById("birthCheckMsg")
        const sexCheck = document.getElementById("sexCheck")
        const sexCheckMsg = document.getElementById("sexCheckMsg")
        const emailCheck = document.getElementById("emailCheck")
        const emailCheckMsg = document.getElementById("emailCheckMsg")

        // 리터럴
        let SERVER_MSG = "${msg}"
        const FAIL_WARN_COLOR = "red";
        const ID_CHECK_URI = "idCheck";
        const NICKNAME_CHECK_URI = "nicknameCheck";
        const ID_FAIL_MSG = "* 아이디는 영어, 숫자를 조합하여 5~12글자 이내로 입력해 주세요";
        const ID_REG_EXP = /^[a-zA-Z0-9]{5,12}$/; // 영어 대소문자, 숫자 5~12
        const PWD_FAIL_MSG = "* 영어, 숫자, 특수문자 하나씩을 포함하여 8~16자 이내로 입력해 주세요";
        const PWD_REG_EXP = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; // 영어 대소문자, 숫자, 특수문자 각각 최소 1개 포함 8~16
        const PWD_CHECK_FAIL_MSG = "* 비밀번호가 일치하지 않습니다";
        const USERNAME_REG_EXP = /^[a-zA-Z가-힣]{2,10}$/; // 영어 대소문자 혹은 한글 2~10
        const USERNAME_FAIL_MSG = "* 형식 혹은 길이가 올바르지 않습니다";
        const NICKNAME_REG_EXP = /^[a-zA-Z0-9가-힣]{2,10}$/; // 영어 대소문자, 숫자, 한글 2~10
        const NICKNAME_FAIL_MSG = "* 한글, 영어, 숫자를 조합하여 2~10글자 이내로 입력해 주세요";
        const SEX_FAIL_MSG = "* 성별을 선택해 주세요";
        const BIRTH_REG_EXP = /^(19|20)[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1])$/; // yyyyMMdd
        const BIRTH_FAIL_MSG = "* 생년월일 8글자를 입력해주세요";
        const EMAIL_REG_EXP = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
        const EMAIL_FAIL_MSG = "* 이메일 형식이 올바르지 않습니다";



        // 함수
        // id, nickname SERVER 유효성 검사 및 동일 검사 함수
        const checkFunc = (inputTag, msgTag, regExp, msg, uri) => {
            inputTag.addEventListener("keyup", () => {
                let data = inputTag.value;
                if (!regExp.test(data)) {
                    msgTag.innerHTML = msg;
                    msgTag.style.color = FAIL_WARN_COLOR;
                    return
                }
                fetch("/board/" + uri, {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data)
                })
                    .then(async res => {
                        let resData = await res.json();
                        msgTag.innerHTML = resData.word;
                        msgTag.style.color = resData.color;
                    })
                    .catch(error => {
                        console.error('실패:', error)
                    })
            });
        };

        // SERVER 유효성 검사, 실패 RETURN MSG 함수
        const FAIL_ACTION = (alertMsg, targetTag, msgTag, msg) => {
            alert(alertMsg)
            targetTag.focus();
            msgTag.innerHTML = msg;
            msgTag.style.color = FAIL_WARN_COLOR;
        }

        // id, nickname 제외 유효성 검사 함수
        const validationFuc = (targetTag, regExp, msgTag, msg, pwdDblCheck = "", sexCheck = false, event = 'keyup') => {
            targetTag.addEventListener(event, () => {
                let data = targetTag.value;
                if (pwdDblCheck) {
                    let checkData = pwdDblCheck.value;
                    if (data !== checkData) {
                        msgTag.innerHTML = msg
                        msgTag.style.color = FAIL_WARN_COLOR;
                    } else {
                        msgTag.innerHTML = ''
                    }
                } else if (sexCheck) {
                    if (data === "") {
                        msgTag.innerHTML = msg
                        msgTag.style.color = FAIL_WARN_COLOR;
                    } else {
                        msgTag.innerHTML = ''
                    }
                } else {
                    if (!regExp.test(data)) {
                        msgTag.innerHTML = msg;
                        msgTag.style.color = FAIL_WARN_COLOR;
                        return
                    } else {
                        msgTag.innerHTML = "";
                    }
                }
            })
        }



        // 실행
        // SERVER 유효성 검사, 실패 RETURN MSG
        if (SERVER_MSG == "ID_DUPLICATION") FAIL_ACTION("이미 존재하는 아이디입니다.", idCheck, idCheckMsg, ID_FAIL_MSG);
        if (SERVER_MSG == "ID_FAIL") FAIL_ACTION("아이디 형식이 유효하지 않습니다.", idCheck, idCheckMsg, ID_FAIL_MSG);
        if (SERVER_MSG == "PWD_FAIL") FAIL_ACTION("비밀번호 형식이 유효하지 않습니다.", pwdCheck, pwdCheckMsg, PWD_FAIL_MSG);
        if (SERVER_MSG == "PWD_CHECK_FAIL") FAIL_ACTION("비밀번호 확인이 일치하지 않습니다.", pwdDblCheck, pwdDblCheckMsg, PWD_CHECK_FAIL_MSG);
        if (SERVER_MSG == "USERNAME_FAIL") FAIL_ACTION("이름의 형식 혹은 길이가 올바르지 않습니다.", usernameCheck, usernameCheckMsg, USERNAME_FAIL_MSG);
        if (SERVER_MSG == "NICKNAME_DUPLICATION") FAIL_ACTION("이미 존재하는 닉네임입니다.", nicknameCheck, nicknameCheckMsg, NICKNAME_FAIL_MSG);
        if (SERVER_MSG == "NICKNAME_FAIL") FAIL_ACTION("닉네임 형식 혹은 길이가 올바르지 않습니다.", nicknameCheck, nicknameCheckMsg, NICKNAME_FAIL_MSG);
        if (SERVER_MSG == "SEX_FAIL") FAIL_ACTION("성별을 선택해 주세요.", sexCheck, sexCheckMsg, SEX_FAIL_MSG);
        if (SERVER_MSG == "BIRTH_FAIL") FAIL_ACTION("생년월일 형식이 올바르지 않습니다.", birthCheck, birthCheckMsg, BIRTH_FAIL_MSG);
        if (SERVER_MSG == "EMAIL_FAIL") FAIL_ACTION("이메일 형식이 올바르지 않습니다.", emailCheck, emailCheckMsg, EMAIL_FAIL_MSG);
        if (SERVER_MSG == "EMAIL_DUPLICATION") FAIL_ACTION("이미 존재하는 이메일입니다.", emailCheck, emailCheckMsg, EMAIL_FAIL_MSG);
        if (SERVER_MSG == "REGISTER_FAIL") alert("회원 가입에 실패했습니다.")
        if (SERVER_MSG == "POLICY_AGREE_FAIL") alert("이용약관과 개인정보취급방침에 동의해 주세요.")

        // id, nickname 유효성 검사
        checkFunc(idCheck, idCheckMsg, ID_REG_EXP, ID_FAIL_MSG, ID_CHECK_URI) // id 유효성 검사 및 동일 검사
        checkFunc(nicknameCheck, nicknameCheckMsg, NICKNAME_REG_EXP, NICKNAME_FAIL_MSG, NICKNAME_CHECK_URI) // nickname 유효성 검사 및 동일 검사

        // id, nickname 외 유효성 검사
        validationFuc(pwdCheck, PWD_REG_EXP, pwdCheckMsg, PWD_FAIL_MSG);
        validationFuc(pwdDblCheck, "", pwdDblCheckMsg, PWD_CHECK_FAIL_MSG, pwdCheck);
        validationFuc(usernameCheck, USERNAME_REG_EXP, usernameCheckMsg, USERNAME_FAIL_MSG);
        validationFuc(sexCheck, "", sexCheckMsg, SEX_FAIL_MSG, "", true, 'change');
        validationFuc(birthCheck, BIRTH_REG_EXP, birthCheckMsg, BIRTH_FAIL_MSG);
        validationFuc(emailCheck, EMAIL_REG_EXP, emailCheckMsg, EMAIL_FAIL_MSG);
    };
</script>
</body>
</html>
