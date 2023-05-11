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
<div id="root">

	<%@ include file="header.jsp" %>

	<main class="main">홈페이지입니다.</main>
	<main class="main">홈페이지입니다.</main>
	<main class="main">홈페이지입니다.</main>
	<main class="main">홈페이지입니다.</main>
	<main class="main">홈페이지입니다.</main>
</div>
</body>
</html>
