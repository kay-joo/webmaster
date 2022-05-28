<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--부트스트랩 사용하기 위한 구문--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<nav class="navbar navbar-dark bg-primary">
    <a class="navbar-brand" href="./index.jsp">홈</a>
    <a class="navbar-brand" href="./app/subscribe/subscribeList?count=20&page=1">구독목록</a>
    <a class="navbar-brand" href="./app/article/articleList?count=20&page=1">공지사항</a>
    <c:if test="${empty sessionScope.ME}">
        <a class="navbar-brand" href="./app/user/signinForm">로그인</a>
        <a class="navbar-brand" href="./app/user/signupForm">회원가입</a>
    </c:if>
    <c:if test="${!empty sessionScope.ME}">
        <a class="navbar-brand" href="./app/user/myInfo">${sessionScope.ME.name}님</a>
        <a class="navbar-brand" href="./app/user/signout">로그아웃</a>
    </c:if>
    <form class="form-inline">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>