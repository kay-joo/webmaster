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
            <tr>
                <td valgn="top">
                    <select name="name">
                        <option value="넷플릭스">넷플릭스</option>
                        <option value="디지니플러스">디지니플러스</option>
                        <option value="왓챠">왓챠</option>
                        <option value="쿠팡플레이">쿠팡플레이</option>
                        <option value="티빙">티빙</option>

                    </select>
                </td>

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
