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
	<title>certification</title>
	<style>
		#root {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		main {
			width: 700px;
			height: 500px;
			position: relative;
			top: 150px;
		}
		h2 {
			border-bottom: 1px solid var(--border-color-1);
			padding-bottom: 10px;
		}
		form {
			width: 100%;
			height: 130px;
			flex-direction: column;
			justify-content: space-between;
			display: flex;
		}
		button {
			background-color: var(--button-color-1);
			color: var(--box-color-1);
			border-style: none;
			width: 100px;
			height: 30px;
			border-radius: 3px;
			position: relative;
			top: 20px;
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
		.info_element_box {
			width: 500px;
			display: flex;
			margin: 2px;
		}
		.info_element {
			width: 110px;
			height: 30px;
			border-right: 1px solid var(--border-color-1);
		}
	</style>
</head>
<body>
<script>
	let SERVER_MSG = '${msg}'
	if(SERVER_MSG==="USER_CHECK_FAIL") alert("아이디 또는 비밀번호가 일치하지 않습니다.")
</script>
<div id="root">

	<%@ include file="header.jsp" %>

	<main class="main">
		<h2>본인 확인</h2>
		<form action="<c:url value='/certification'/>" method="post">
			<div class="info_element_box">
				<div class="info_element fs_16 ai_flex_center_item">아이디</div>
				<label><input type="text" name="id" /></label>
			</div>
			<div class="info_element_box">
				<div class="info_element fs_16 ai_flex_center_item">비밀번호</div>
				<label><input type="password" name="pwd" /></label>
			</div>
			<button style="align-self: flex-end">인증하기</button>
		</form>
	</main>
</div>
</body>
</html>
