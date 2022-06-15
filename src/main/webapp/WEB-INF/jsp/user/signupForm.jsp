<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--부트스트랩 사용하기 위한 구문--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/"/>
</head>

<body>
    <nav class="navbar navbar-dark bg-primary">
        <div class="navbar-brand">회원가입</div>
    </nav>

    <form action="./app/user/signup" method="post">
        <div class="row text-center" style="width: 100%">
            <div style="float:none; margin:0 auto">
                <div style="padding:10px;">
                    <div class="card-header">
                        <div class="navbar-brand">회원가입</div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="mb-4">
                                    <p>
                                        <input type="email" name="email" placeholder="이메일" class="form-control" required autofocus>
                                    </p>
                                </div>
                                <div class="mb-4">
                                    <p>
                                        <input type="password" name="password" placeholder="비밀번호" class="form-control" aria-describedby="passwordHelpBlock" required>
                                    </p>
                                </div>
                                <div class="mb-4">
                                    <p>
                                        <input type="text" name="name" placeholder="이름" class="form-control" aria-describedby="passwordHelpBlock" required>
                                    </p>
                                </div>
                                <div class="mb-4">
                                    <p>
                                        <button class="btn btn-primary" type="submit">회원가입</button>
                                    </p>
                                    <div>${message}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>