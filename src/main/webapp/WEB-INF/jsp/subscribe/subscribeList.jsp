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

<div class="card shadow mb-4">
    <%--<div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">
            <div><a href="./app/subscribe/subscribeForm">추가</a></div>
        </h6>
    </div>--%>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>구독명</th>
                    <th>금액</th>
                    <th>결제 예정일자</th>
                </tr>
                </thead>
                <%--<tfoot>
                <tr>
                    <th>구독명</th>
                    <th>금액</th>
                    <th>결제 예정일자</th>
                </tr>
                </tfoot>--%>
                <tbody>
                <c:forEach var="subscribe" items="${subscribeList}">
                    <tr>
                        <td>${subscribe.name}</td>
                        <td>${subscribe.price}원</td>
                        <td>${subscribe.pdate}
                            <div style="float: right">
                                <a type="button" class="btn btn-outline-primary">수정</a>
                                <a href="./app/subscribe/deleteSubscribe?subId=${subscribe.subId}"
                                   id="btnDel${subscribe.subId}" type="button" class="btn btn-outline-danger">
                                    삭제
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tbody>
                <td>합계</td>
                <td>${sum}원</td>
                <td>
                    <div style="float: right">
                        <a href="./app/subscribe/subscribeForm" type="button" class="btn btn-outline-success">
                            추가
                        </a>
                    </div>
                </td>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--삭제 확인 스크립트를 버튼별로 만들기 위한 반복문--%>
<c:forEach var="subscribe" items="${subscribeList}">
    <script>
        document.querySelector("#btnDel${subscribe.subId}").onclick = function () {
            return confirm("삭제하시겠습니까?");
        };
    </script>
</c:forEach>
</body>
</html>