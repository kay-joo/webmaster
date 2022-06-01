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
            <div style="width: 30%; float:none; margin:0 auto">
                <div style="padding:10px;">
                    <div class="card-header">
                        <div class="navbar-brand">회원가입</div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <table class="table" style="width:100%">
                                    <tr>
                                        <td style="width: 20%;">회원 이메일<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="text" class="form-control" style="width:200px;max-width: 150px;" name="email" id="email" placeholder="회원 이메일" required autofocus>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">비밀번호<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="password" class="form-control" style="width:200px;max-width: 150px;" name="password" id="password" placeholder="비밀번호" aria-describedby="passwordHelpBlock" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">비밀번호 확인<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="password" class="form-control" style="width:200px;max-width: 150px;" name="password2" id="password2" placeholder="비밀번호 확인" aria-describedby="passwordHelpBlock" required>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="width: 20%;">이름<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="text" class="form-control" style="width:200px;max-width: 150px;" name="name" id="name" placeholder="이름" aria-describedby="passwordHelpBlock" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">생년월일<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="number" class="form-control" style="width:200px;max-width: 150px;" name="user_birth" id="user_birth" placeholder="생년월일" >
                                            <span style="color:red;">(※ 생년월일은 8자로 입력해주세요.   예 : 20210505)</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">연락처<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="number" class="form-control" style="width:200px;max-width: 150px;" name="user_phone" id="user_phone" placeholder="연락처" >
                                            <span style="color:red;">(※ 연락처는 "-"를 빼고 넣어주세요.)</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">성별</td>
                                        <td style="width:80%">
                                            <input type="radio" name="user_gender" value="M" checked> 남성
                                            <input type="radio" name="user_gender" value="F"> 여성
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">우편번호<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <div class="form-inline">
                                                <input type="number" class="form-control" style="width:200px;max-width: 100px;" name="zipcode" id="zipcode">
                                                <button type="button" class="btn btn-danger btn-sm" onclick="sample4_execDaumPostcode();">검색</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;" rowspan="3">주소<span style="color:red;">*</span></td>
                                        <td style="width:80%">
                                            <input type="text" class="form-control" style="width:300px;max-width: 250px;" name="jaddress" id="jaddress" placeholder="지번주소">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:80%">
                                            <input type="text" class="form-control" style="width:300px;max-width: 250px;" name="raddress" id="raddress" placeholder="도로명 주소">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="width:80%">
                                            <input type="text" class="form-control" style="width:300px;max-width: 250px;" name="address" id="address" placeholder="상세주소">
                                        </td>
                                    </tr>
                                </table>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("raddress").value = roadAddr;
                document.getElementById("jaddress").value = data.jibunAddress;

            }
        }).open();
    }
</script>