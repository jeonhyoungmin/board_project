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
	<title>signup</title>
</head>
<style>
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
			<div class="logo">Surup</div>
			<div>이미 슈룹 계정이 있으신가요? &nbsp; <span>로그인</span></div>
		</div>

		<div class="signUp_box center_flex_item">
			<h2>회원가입</h2>
			<form class="center_flex_item" action="">
				<div class="jc_space_between_item fs_14">아이디</div>
				<input
						type="text"
						placeholder="영어, 숫자를 포함하여, 3~12글자 이내로 입력해 주세요"
				/>
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">* 동일한 아이디가 존재합니다</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">비밀번호</div>
				</div>
				<input
						type="password"
						placeholder="8자 이상이면서 최소한 숫자 하나와 글자 하나를 포함하여 입력해 주세요"
				/>
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">
						* 비밀번호 형식이 올바르지 않습니다
					</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">비밀번호 확인</div>
				</div>
				<input type="password" placeholder="비밀번호를 입력해 주세요" />
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">
						* 비밀번호가 일치하지 않습니다
					</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">이름</div>
				</div>
				<input type="text" placeholder="이름을 입력해 주세요" />
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">* 허용 길이를 초과하였습니다</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">성별</div>
				</div>
				<select name="" id="">
					<option value="">성별을 선택해 주세요</option>
					<option value="">남</option>
					<option value="">여</option>
				</select>
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">* 성별을 선택해 주세요</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">생년월일</div>
				</div>
				<input
						type="text"
						placeholder="주민번호 앞자리 6글자를 입력해 주세요"
				/>
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">
						* 생년월일 형식이 올바르지 않습니다
					</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">이메일</div>
				</div>
				<input type="text" placeholder="이메일을 입력해 주세요" />
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">
						* 이메일 형식이 올바르지 않습니다
					</div>
				</div>

				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_14">닉네임</div>
				</div>
				<input
						type="text"
						placeholder="한글, 영어, 숫자를 포함하여, 2~10글자 이내로 입력해 주세요"
				/>
				<div class="jc_space_between_item ai_flex_end_item">
					<div class="fs_12 mg_bottom_15">
						* 닉네임 형식이 올바르지 않습니다
					</div>
				</div>

				<div class="jc_space_between_item">
					<label class="fs_12 ai_flex_end_item" for=""
					><input type="checkbox" /> &numsp;<span>이용약관</span>과 &nbsp;
						<span> 개인정보취급방침</span>에 동의합니다</label
					>
				</div>

				<br />
				<button type="submit">가입하기</button>
			</form>

			<!-- or -->
			<div class="jc_space_between_item ai_flex_center_item">
				<hr style="width: 40%; height: 1%" />
				<div class="fs_14">or</div>
				<hr style="width: 40%; height: 1%" />
			</div>

			<!-- 소셜 로그인 -->
			<div class="social_box">
				<button class="fs_12">구글 계정으로 회원가입</button>
				<button class="fs_12">네이버 계정으로 회원가입</button>
				<button class="fs_12">카카오톡 계정으로 회원가입</button>
			</div>
			<div class="signUp_offer">
				이미 슈룹 계정이 있으신가요? &nbsp; <span>로그인</span>
			</div>
		</div>
	</div>
</div>
</body>
</html>
