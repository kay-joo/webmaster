<%@ page import="kr.mjc.kwanghyun.web.servlets.examples.User" %>
<%
    User me = (User) session.getAttribute("ME");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand"; href="./home.jsp">홈</a>
        <a class="navbar-brand"; href="./model1/user/userList?count=20&page=1">회원</a>
        <a class="navbar-brand"; href="./model1/article/articleList?count=20&page=1">게시판</a>
        <% if (me == null) { // 로그인 안함 %>
        <a class="navbar-brand"; href="./model1/user/signinForm">로그인</a>
        <a class="navbar-brand"; href="./model1/user/signupForm">회원가입</a>
        <% } else { // 로그인 함 %>
        <a class="navbar-brand"; href="./model1/user/myInfo"><%=me.getName()%>님</a>
        <a class="navbar-brand"; href="./model1/user/signout">로그아웃</a>
        <% } %>
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </nav>




