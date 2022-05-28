<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/"/>

    <style>
        .grid {
            display: grid;
            grid-template-columns: repeat(4, auto);
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/jsp/top.jsp" %>

<div style="padding:10px;">
    <span style=" font-size:2em;  color: black;">게시판</span>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">
            <div><a href="./app/article/articleForm">글쓰기</a></div>
        </h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>등록일시</th>
                </tr>
                </thead>
                <%--<tfoot>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>등록일시</th>
                </tr>
                </tfoot>--%>
                <tbody>
                <c:forEach var="article" items="${articleList}">
                    <tr>
                        <td>${article.articleId}</td>
                        <td><a href="./app/article/articleView?articleId=${article.articleId}">${article.title}</a></td>
                        <td><a href="./app/user/userInfo?userId=${article.userId}">${article.name}</a></td>
                        <td>${article.udate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>