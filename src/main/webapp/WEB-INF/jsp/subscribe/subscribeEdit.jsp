<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>구독목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/"/>
</head>
<body>
<%@ include file="/WEB-INF/jsp/top.jsp" %>

<div style="padding:10px;">
    <span style=" font-size:2em;  color: black;">구독목록</span>
</div>

<form action="./app/subscribe/updateSubscribe" method="post">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>구독명</th>
                <th>금액</th>
                <th>결제 예정일자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="text" name="name" value="${subscribe.name}"
                           placeholder=" 구독명" required autofocus/>
                </td>
                <td><input type="number" name="price" value="${subscribe.price}"
                           placeholder=" 금액" required/>
                </td>
                <td><input type="date" name="pdate" value="${subscribe.pdate}"
                           placeholder="결제 예정일자" required/></td>
            </tr>
            </tbody>
        </table>
        <div style="padding:10px;">
            <button type="submit">등록</button>
        </div>
    </div>
    <input type="hidden" name="subId" value="${subscribe.subId}"/>
</form>

</body>
</html>
