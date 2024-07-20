<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h5 class="card-title mb-0">주문 번호: ${orderData.oid}</h5>
                </div>
                <div class="card-body">
                    <h6 class="card-subtitle mb-2 text-muted">주문 정보</h6>
                    <ul class="list-group list-group-flush mb-3">
                        <li class="list-group-item"><strong>주문 날짜:</strong> <fmt:formatDate value="${orderData.odate}" pattern="yyyy-MM-dd" /></li>
                        <li class="list-group-item"><strong>주문자 이름:</strong> ${orderData.oname}</li>
                        <li class="list-group-item"><strong>전화 번호:</strong> ${orderData.ophone}</li>
                        <li class="list-group-item"><strong>배송지:</strong> ${orderData.oaddress} ${orderData.oaddressdetail}</li>
                        <li class="list-group-item"><strong>우편번호:</strong> ${orderData.opostcode}</li>
                        <li class="list-group-item"><strong>총 가격:</strong> ${orderData.ototalprice}원</li>
                        <li class="list-group-item"><strong>결제 방법:</strong> ${orderData.opaymethod}</li>
                        <li class="list-group-item"><strong>주문 상태:</strong> ${orderData.ostatus}</li>
                    </ul>
                    
                    <h6 class="card-subtitle mb-2 text-muted">주문 항목</h6>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th>주문 날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${orderData.orderItems}">
                                    <tr>
                                        <td>${item.oipname}</td>
                                        <td>${item.oiqty}</td>
                                        <td><fmt:formatNumber value="${item.oiprice}" type="currency" currencySymbol="₩" groupingUsed="true" maxFractionDigits="0" />원</td>
                                        <td><fmt:formatDate value="${item.oidate}" pattern="yyyy-MM-dd" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
