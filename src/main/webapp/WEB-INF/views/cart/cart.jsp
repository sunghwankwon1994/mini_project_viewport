<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>장바구니</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css?ver=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
    <%@ include file="/WEB-INF/views/common/nav.jsp"%>
    <form method='post' action="/viewport_mini_web/payment">
        <div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col">
                                <h4>
                                    <b>Shopping Cart</b>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="row border-top border-bottom" id="cart-list-container">
                        <c:if test="${productDataList != null}">
                            <c:forEach var="productData" items="${productDataList}">
                                <input type="hidden" name="productIds" value="${productData.product.pid}">
                                <input type="hidden" class="product-quantity" name="quantities" data-pid="${productData.product.pid}" value="${productData.quantity}">
                                <div class="product-row row main align-items-center" data-pid="${productData.product.pid}">
                                    <div class="col-2">
                                        <img class="img-fluid" src="products/attachProductDownload?pid=${productData.product.pid}">
                                    </div>
                                    <div class="col">
                                        <div class="row text-muted">${productData.product.pcategory}</div>
                                        <div class="row">${productData.product.pname}</div>
                                    </div>
                                    <div class="col">
                                        <button type="button" class="btn btn-sm" onclick="editCount(${productData.product.pid}, 'minus')">-</button>
                                        <span class="border-0 count-box" data-pid="${productData.product.pid}">${productData.quantity}</span>
                                        <button type="button" class="btn btn-sm" onclick="editCount(${productData.product.pid}, 'plus')">+</button>
                                    </div>
                                    <div class="col" data-price="${productData.product.pprice}">
                                        <fmt:formatNumber value="${productData.product.pprice * productData.quantity}" type="currency" currencySymbol="₩" groupingUsed="true" maxFractionDigits="0" />
                                        <span class="close-btn btn btn-sm" onclick="removeItem(${productData.product.pid})">&#10005;</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                      
                    </div>
                      <c:if test="${empty productDataList}">
                            <p class="text-muted">카트가 비어있습니다.</p>
                        </c:if>
                </div>
                <div class="col-md-4 summary">
                    <div>
                        <h5>
                            <b>Summary</b>
                        </h5>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col num-of-items" style="padding-left: 0;"></div>
                        <div class="col text-right total-price">0 원</div>
                    </div>
                    <p>배송비</p>
                    <select id="delivery-option">
                        <option class="text-muted" value="5000">일반 배송- ₩ 5,000</option>
                        <option class="text-muted" value="12000">익스프레스- ₩ 12,000</option>
                    </select>
                    <div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
                        <div class="col">
                            전체 가격 <br />(배송비 포함)
                        </div>
                        <div class="col text-right" id="total-price">0 원</div>
                    </div>
                    <input type="hidden" name="totalPriceWithoutDelivery" id="totalPriceWithoutDelivery" value="">
                    <input type="hidden" name="totalPriceWithDelivery" id="totalPriceWithDelivery" value="">
                    <input type="hidden" name="deliveryType" id="deliveryType" value="">
                    <button type="submit" class="checkout-btn btn">결제페이지로 이동</button>
                    <a href="/viewport_mini_web">
                        <div class="back-to-shop shopping-btn text-center">
                            <span class="text-muted">돌아가기</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</body>
</html>
