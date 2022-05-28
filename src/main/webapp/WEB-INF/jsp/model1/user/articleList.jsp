<%@ page import="java.util.List" %>
<%@ page import="kr.mjc.kwanghyun.web.servlets.examples.Article" %>
<%
    List<Article> articleList = (List<Article>) request.getAttribute("articleList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>기사목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=request.getContextPath()%>/"/>
    <style>
        .grid {
            display: grid;
            grid-template-columns: repeat(4, auto);
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/jsp/model1/top.jsp" %>
<h3>게시글목록</h3>
<div class="grid">
    <div>번호</div>
    <div>제목</div>
    <div>이름</div>
    <div>날짜</div>
    <% for (Article article : articleList) {%>
    <div><%=article.getArticleId()%>
    </div>
    <div><%=article.getTitle()%>
    </div>
    <div><%=article.getName()%>
    </div>
    <div><%=article.getUdate()%>
    </div>
    <% }%>
</div>
</body>
</html>