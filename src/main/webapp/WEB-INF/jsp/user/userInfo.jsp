<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원정보</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/"/>
</head>
<body>
<%@ include file="/WEB-INF/jsp/top.jsp" %>

<div style="padding:10px;">
    <span style=" font-size:2em;  color: black;">회원정보</span>
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
                    <td>${user.userId}</td>
                    <td>${user.email}</td>
                    <td>${user.name}</td>
                    <td>${user.user_birth}</td>
                    <td>${user.user_phone}</td>
                    <td>${user.user_gender}</td>
                    <td>${user.zipcode}</td>
                    <td>${user.jaddress}</td>
                    <td>${user.raddress}</td>
                    <td>${user.address}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>