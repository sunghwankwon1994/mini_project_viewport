<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@ include file="/WEB-INF/views/common/nav.jsp"%>
    <div class="container-fluid g-0">
        <div class="row">
            <div class="col-md-3 sidebar">
                <div class="list-group rounded-0">
                    <a href="${pageContext.request.contextPath}/mypage" class="list-group-item list-group-item-action">프로필</a>
                    <a href="${pageContext.request.contextPath}/mypage/password" class="list-group-item list-group-item-action">비밀번호 변경</a>
                    <a href="${pageContext.request.contextPath}/mypage/orders" class="list-group-item list-group-item-action">주문 내역</a>
                    <a href="${pageContext.request.contextPath}/mypage/myqna" class="list-group-item list-group-item-action">문의 내역</a>
                    <a href="${pageContext.request.contextPath}/mypage/deleteAccount" class="list-group-item list-group-item-action">회원 탈퇴</a>
                </div>
            </div>
            <div class="col-md-9 right-box">
                <div class="tab-content">
                    <div class="tab-pane active" id="profile" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">프로필 정보</h4>
                                <form id="myPageInfo" method="post" action="${pageContext.request.contextPath}/mypage/myPageInfo">
                                    <div class="mb-3">
                                        <label for="user-name" class="form-label">이름</label>
                                        <input type="text" class="form-control" name="uname" id="uname" value="${user.uname}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="user-email" class="form-label">이메일</label>
                                        <input type="email" class="form-control" name="uemail" id="user-email" value="${user.uemail}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="user-address" class="form-label">기본주소</label>
                                        <input type="text" class="form-control" name="uaddress" id="user-address" value="${user.uaddress}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="user-addressdetail" class="form-label">상세주소</label>
                                        <input type="text" class="form-control" name="uaddressdetail" id="user-address-detail" value="${user.uaddressdetail}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="user-phonenumber" class="form-label">전화번호</label>
                                        <input type="text" class="form-control" name="uphonenumber" id="user-phone-number" value="${user.uphonenumber}">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="ugender">성별</label>
                                        <c:if test="${user.ugender == 1}">
                                            <input type="radio" id="man" name="ugender" value="1" checked />남자
                                            <input type="radio" id="woman" name="ugender" value="0" />여자
                                        </c:if>
                                        <c:if test="${user.ugender == 0}">
                                            <input type="radio" id="man" name="ugender" value="1" />남자
                                            <input type="radio" id="woman" name="ugender" value="0" checked />여자
                                        </c:if>
                                    </div>
                                    <button type="submit" class="btn btn-dark">저장하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
