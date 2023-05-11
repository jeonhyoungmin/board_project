<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!--%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %-->
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/style.css" />
	<title>login</title>
</head>
<style>
	a {
		color: var(--word-highlight-1);
	}
	a:visited {
		color: var(--word-highlight-1);
	}
	span {
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
		margin: 5px 0 10px 0;
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

	.logo {
		font-size: 26px;
		font-family: "Pacifico", cursive; /* logo font */
		text-align: start;
		position: relative;
		bottom: 10px;
	}
	.container {
		width: 100vw;
		height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		align-items: center;
	}
	.signUp_offer {
		font-size: 14px;
		padding: 15px;
	}
	.logIn_box {
		width: 400px;
		height: 600px;
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
			<div class="logo">Surup</div>
			<div>
				아직 슈룹 계정이 없으신가요? &nbsp; <span><a href="<c:url value='/signup'/>">지금 가입하기</a></span>
			</div>
		</div>

		<div class="logIn_box center_flex_item">
			<h2>로그인</h2>
			<form class="center_flex_item" action="">
				<div class="jc_space_between_item fs_14">아이디</div>
				<input type="text" placeholder="아이디 입력" />

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">비밀번호</div>
					<span><a>비밀번호를 잊으셨나요?</a></span>
				</div>
				<input type="password" placeholder="비밀번호 입력" />

				<div class="jc_space_between_item">
					<label class="fs_12 center_flex_item"><input type="checkbox" /> &nbsp; 아이디 기억</label>
				</div>

				<br />
				<button type="submit">로그인</button>
			</form>

			<!-- or -->
			<div class="jc_space_between_item ai_flex_center_item">
				<hr style="width: 40%; height: 1%" />
				<div class="fs_14">or</div>
				<hr style="width: 40%; height: 1%" />
			</div>

			<!-- 소셜 로그인 -->
			<div class="social_box">
				<button class="fs_12">구글 계정으로 로그인</button>
				<button class="fs_12">네이버 계정으로 로그인</button>
				<button class="fs_12">카카오톡 계정으로 로그인</button>
			</div>
			<div class="signUp_offer">
				아직 슈룹 계정이 없으신가요? &nbsp; <span><a href="<c:url value='/signup'/>">지금 가입하기</a></span>
			</div>
		</div>
	</div>
</div>
</body>
</html>
