<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>내정보</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/"/>
</head>
<body>
<%@ include file="/WEB-INF/jsp/top.jsp" %>
<div style="padding:10px;">
    <span style=" font-size:2em;  color: black;">내정보</span>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">가입된 이용자</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>회원번호</th>
                    <th>이메일</th>
                    <th>이름</th>
                    <th>생년월일</th>
                    <th>연락처</th>
                    <th>성별</th>
                    <th>우편번호</th>
                    <th>지번 주소</th>
                    <th>도로명 주소</th>
                    <th>상세 주소</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${sessionScope.ME.userId}</td>
                    <td>${sessionScope.ME.email}</td>
                    <td>${sessionScope.ME.name}</td>
                    <td>${sessionScope.ME.user_birth}</td>
                    <td>${sessionScope.ME.user_phone}</td>
                    <td>${sessionScope.ME.user_gender}</td>
                    <td>${sessionScope.ME.zipcode}</td>
                    <td>${sessionScope.ME.jaddress}</td>
                    <td>${sessionScope.ME.raddress}</td>
                    <td>${sessionScope.ME.address}</td>
                </tr>
                </tbody>
            </table>
            <p><a href="./app/user/passwordEdit">비밀번호 수정</a></p>
        </div>
    </div>
</div>
</body>
</html>