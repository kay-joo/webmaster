<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>구독물 추가</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/"/>
</head>

<body>
<%@ include file="/WEB-INF/jsp/top.jsp" %>

<div style="padding:10px;">
    <span style=" font-size:2em;  color: black;">구독물 추가</span>
</div>

<form action="./app/subscribe/addSubscribe" method="post">
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
                <td>
                    <select name="name">
                        <option>NETFLIX.COM</option>
                        <option>TVING.COM</option>
                        <option>DISNEYPLUS.COM</option>
                        <option>COUPANGPLAY.COM</option>
                        <option>WATCHA.COM</option>
                        <option>YOUTUBE.COM</option>
                    </select>
                </td>
                <%--<td><input type="text" name="name" placeholder="구독명" required autofocus/></td>--%>
                <td><input type="number" name="price" placeholder="금액" required/></td>
                <td><input type="date" name="pdate" placeholder="결제 예정일자" required/></td>
            </tr>
            </tbody>
        </table>
        <div style="padding:10px;" class="mb-4">
            <button class="btn btn-primary" type="submit">등록</button>
        </div>
    </div>
</form>
</body>
</html>
