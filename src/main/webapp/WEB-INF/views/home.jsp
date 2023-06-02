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
	<title>home</title>
	<style>
		#root {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		main {
			position: relative;
			top: 100px;
		}
	</style>
</head>
<body>
<script>
	let msg = "${msg}"
	if(msg==="SERVER_FAIL") alert("문제가 발생하여 요청이 취소되었습니다.");
	if(msg==="USER_DELETE_SUCCESS") alert("탈퇴가 정상적으로 완료되었습니다.");
</script>
<div id="root">

	<%@ include file="header.jsp" %>

	<main class="main"></main>
	<main class="main"></main>
	<main class="main">상단의 board를 클릭해주세요.</main>
	<main class="main"></main>
	<main class="main"></main>
</div>
</body>
</html>
