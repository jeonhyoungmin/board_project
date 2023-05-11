<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:set var="logInMy" value="${loginId=='' ? 'Log in' : 'My'}"/>
<c:set var="logInMyURI" value="${loginId=='' ? '/login' : '/certification'}"/>

<c:set var="logOutSignUp" value="${loginId=='' ? 'Sign up' : 'Log out'}"/>
<c:set var="logOutSignUpURI" value="${loginId=='' ? '/signup' : '/logout'}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/header.css"/>
</head>
<body>
<header class="header">
    <div class="logo">Surup</div>
    <ul class="goto">
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/list'/>">Board</a></li>
    </ul>
    <ul class="account">
<%--        <li><a href="<c:url value='${logInMyURI}'/>">${logInMy}</a></li>--%>
        <li><a href="<c:url value='/login'/>">Log in</a></li>
        <li class="bar"></li>
        <li><a href="<c:url value='${logOutSignUpURI}'/>">${logOutSignUp}</a></li>
    </ul>
</header>
</body>
</html>
