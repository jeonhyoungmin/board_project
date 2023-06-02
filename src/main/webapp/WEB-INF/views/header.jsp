<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:set var="id"
       value="${pageContext.request.getSession(false)== null ? '' : pageContext.request.session.getAttribute('id')}"/>

<c:set var="id" value="${msg == 'USER_DELETE_SUCCESS' ? '' : id}"/>
<%--<c:set var="toURL" value="${requestScope['javax.servlet.forward.request_uri']}"/> <!-- jsp에서 url 얻는 방법-->--%>

<c:set var="logInMy" value="${id =='' ? 'Log in' : 'My'}"/>
<c:set var="logInMyURI" value="${id =='' ? '/login' : '/certification'}"/>

<c:set var="logOutSignUp" value="${id =='' ? 'Sign up' : 'Log out'}"/>
<c:set var="logOutSignUpURI" value="${id =='' ? '/signup' : '/logout'}"/>

<head>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>"/>
</head>
<header class="header">
    <div class="logo">Surup</div>
    <ul class="goto">
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/list'/>">Board</a></li>
    </ul>
    <ul class="account">
        <%-- <li><a href="<c:url value='${logInMyURI}?toURL=${toURL}'/>">${logInMy}</a></li> jsp에서 얻은 현재 주소 넘기기 --%>
        <li><a href="<c:url value='${logInMyURI}'/>">${logInMy}</a></li>
        <li class="bar"></li>
        <li><a href="<c:url value='${logOutSignUpURI}'/>">${logOutSignUp}</a></li>
    </ul>
</header>