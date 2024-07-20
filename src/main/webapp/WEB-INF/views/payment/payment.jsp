<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Payment Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css?ver=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@ include file="/WEB-INF/views/common/nav.jsp"%>

    <form action="payment/orderConfirmation" method="post" id="payment-form">
        <div class="payment-wrap">
            <div class="payment-block">
                <section class="payment-block-order">
                    <div class="title">
                        <h6>1. 주문자 정보</h6>
                    </div>
                    <div>
                        <input type="text" placeholder="이름*" class="orderName" value="${user.uname}" readonly>
                    </div>
                    <div class="order-phonenumber">
                        <p>연락처</p>
                        <input type="text" value="${user.uphonenumber}" readonly>
                    </div>
                    <div class="order-email">
                        <p>이메일</p>
                        <input type="text" id="emailId" value="${user.uemail}" readonly>
                    </div>
                </section>
                <section class="payment-block-delivery">
                    <div class="title">
                        <h6>2. 배송지 정보</h6>
                    </div>
                    <div>
                        <label for="delivery-radio1">
                            <input type="radio" name="delivery-radio" id="delivery-radio1"> 직접 입력
                        </label>
                        <label for="delivery-radio2">
                            <input type="radio" name="delivery-radio" id="delivery-radio2" checked> 회원 정보와 동일
                        </label>
                    </div>
                    <div>
                        <p>받는사람*</p>
                        <input type="text" class="form-control" name="oname" placeholder="받는 사람*" value="${user.uname}">
                    </div>
                    <div class="mt-3">
                        <p>주소*</p>
                        <input type="text" placeholder="기본 주소*" class="form-control" name="oaddress" value="${user.uaddress}">
                        <input type="text" placeholder="상세 주소" class="form-control mt-3" name="oaddressdetail" value="${user.uaddressdetail}">
                        <input type="text" placeholder="우편번호*" class="form-control" name="opostcode" value="${user.upostcode}">
                    </div>
                    <div class="delivery-phonenumber mt-3">
                        <p>휴대전화*</p>
                        <input type="text" name="ophone" id="payment-phonenumber" class="form-control" value="${user.uphonenumber}">
                        <small id="payment-phonenumber-error"></small>
                    </div>
                    <div class="delivery-message">
                        <p>배송 메시지</p>
                        <select name="shipment.srequest" id="deliverySelect">
                            <option value="" selected>배송 시 요청사항을 선택해 주세요.</option>
                            <option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
                            <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                            <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
                            <option value="deliveryDirect">직접 입력</option>
                        </select>
                        <input type="text" id="deliverySelect-direct">
                    </div>
                </section>
                <section class="payment-block-payment">
                    <div class="title">
                        <h6>3. 결제 수단</h6>
                        <select name="opaymethod" id="paymethod">
                            <option value="신용카드" selected>신용카드</option>
                        </select>
                    </div>
                </section>
            </div>
            <div class="product-block">
                <div class="product-block-product">
                    <div>
                        <p>주문 상품</p>
                    </div>
                    <div>
                        <c:forEach var="product" items="${tempData.itemList}" varStatus="status">
                            <ul>
                                <li><a href="#"><img src="products/attachProductDownload?pid=${product.product.pid}"></a></li>
                                <li>${product.product.pname}</li>
                                <li>수량 : ${product.quantity}</li>
                            </ul>
                            <input type="hidden" name="orderItems[${status.index}].oipid" value="${product.product.pid}">
                            <input type="hidden" name="orderItems[${status.index}].oiqty" value="${product.quantity}">
                            <input type="hidden" name="orderItems[${status.index}].oiprice" value="${product.product.pprice}">
                        </c:forEach>
                    </div>
                </div>
                <div class="product-block-order">
                    <div class="price-delivery">
                        <ul>
                            <li>상품 금액</li>
                            <li><fmt:formatNumber value="${tempData.totalPrice}" type="currency" currencySymbol="" groupingUsed="true" maxFractionDigits="0"/> 원</li>
                        </ul>
                        <ul>
                            <li>배송비</li>
                            <li><fmt:formatNumber value="${tempData.deliveryType}" type="currency" currencySymbol="" groupingUsed="true" maxFractionDigits="0"/> 원</li>
                        </ul>
                    </div>
                    <div>
                        <ul>
                            <li>전체 합계</li>
                            <li><fmt:formatNumber value="${tempData.totalPriceWithDelivery}" type="currency" currencySymbol="" groupingUsed="true" maxFractionDigits="0"/> 원</li>
                        </ul>
                    </div>
                    <div class="text-center">
                        <input type="hidden" name="ototalprice" value="${tempData.totalPriceWithDelivery}">
                        <input type="hidden" name="shipment.stype" value="${tempData.deliveryType}">
                        <button type="submit" id="payment-button">결제하기</button>
                        <a href="/viewport_mini_web/cart" id="cancel-button" class="mt-3 btn btn-light">카트로 돌아가기</a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
