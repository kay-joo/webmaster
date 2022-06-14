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
    <div class="card-body">
        <div class="table-responsive">
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <span style=" font-size:2em;  color: black;">6월 총 결제 금액은 ${sum}원 입니다.</span>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <c:forEach var="subscribe" items="${subscribeList}">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1">
                                                    ${subscribe.name}</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 mb-1">
                                                ₩${subscribe.price}</div>
                                            <div class="small font-weight-bold">결제예정일</div>
                                            <div class="small font-weight-bold">${subscribe.pdate}</div>
                                        </div>
                                        <div class="col-auto">
                                            <c:choose>
                                                <c:when test="${subscribe.name eq 'NETFLIX.COM'}">
                                                    <img src="./images/netflix.png" alt="넷플릭스 로고" width="100px">
                                                </c:when>
                                                <c:when test="${subscribe.name eq 'TVING.COM'}">
                                                    <img src="./images/tiving.png" alt="티빙 로고" width="100px">
                                                </c:when>
                                                <c:when test="${subscribe.name eq 'DISNEYPLUS.COM'}">
                                                    <img src="./images/disneyplus.jpg" alt="디즈니 플러스 로고" width="100px">
                                                </c:when>
                                                <c:when test="${subscribe.name eq 'COUPANGPLAY.COM'}">
                                                    <img src="./images/coupangplay.png" alt="쿠팡 로고" height="100px">
                                                </c:when>
                                                <c:when test="${subscribe.name eq 'WATCHA.COM'}">
                                                    <img src="./images/watcha.png" alt="왓챠 로고" width="100px">
                                                </c:when>
                                                <c:when test="${subscribe.name eq 'YOUTUBE.COM'}">
                                                    <img src="./images/youtube.png" alt="유튜브 로고" width="100px">
                                                </c:when>

                                                <c:otherwise>
                                                    <img src="./images/noimage.png" alt="이미지 없음" width="100px">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card shadow mb-4">
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
                <tbody>
                <c:forEach var="subscribe" items="${subscribeList}">
                    <tr>
                        <td>${subscribe.name}</td>
                        <td>${subscribe.price}원</td>
                        <td>${subscribe.pdate}
                            <div style="float: right">
                                <a href="./app/subscribe/subscribeEdit?subId=${subscribe.subId}"
                                   type="button" class="btn btn-outline-primary">수정</a>
                                <a href="./app/subscribe/deleteSubscribe?subId=${subscribe.subId}"
                                   id="btnDel${subscribe.subId}" type="button" class="btn btn-outline-danger">삭제</a>
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