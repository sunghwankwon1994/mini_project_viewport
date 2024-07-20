
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ymd" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- css 설정 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderConfirmation.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<title>주문 확인</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<section class="container d-flex align-items-center main-box">
		<div class="left-sidebox h-75 col-2 bg-dark Regular shadow pt-5 text-center">
			<h2 class="text-light text-center">ORDER RECEIPT</h2>
			<p class="text-light text-center">#SDKNO7651907</p>
			
			<a class="btn btn-light" href ="/viewport_mini_web">홈으로 돌아가기</a>
		</div>
		<div class="col h-75">
			<div class="item-container h-100 border p-5 Regular shadow  overflow-auto">
				<div class="row" id="cart-list-container">
					<div>
						<h2>주문 확인</h2>
						<strong>감사합니다, ${user.uname}님</strong>
						<p>주문은 바로 확인이 되었으며, 배송은 2~3일 정도 소요가 될 것입니다.</p>
					</div>
					<div class="row border-top p-4 text-center">
						<div class="col">
							<div>주문 일자</div>
							<div>
								<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
							</div>
						</div>
						<%-- <div class="col">
							<div>주문 번호</div>
							<div>${orderData.shipment.sshipmentnum}</div>
						</div> --%>
						<div class="col">
							<div>배송지</div>
							<div>${orderData.opostcode}, ${orderData.oaddress }, ${orderData.oaddressdetail }</div>
						</div>
						
					</div>
					<c:forEach var="productCartData" items="${productCartDataList}">
						<div class="row main align-items-center border-top">
							<div class="col-2">
								<img class="img-fluid p-2" src="/viewport_mini_web/products/attachProductDownload?pid=${productCartData.product.pid}">
							</div>
							<div class="col">
								<div class="row text-muted">${productCartData.product.pcategory }</div>
								<div class="row text-muted">${productCartData.product.pname }</div>
								<div class="row text-muted">수량: ${productCartData.quantity}</div>
							</div>

							<div class="col text-end">
								<fmt:formatNumber value="${productCartData.product.pprice*productCartData.quantity }" type="currency" currencySymbol="" groupingUsed="true" />원
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="result-box row border-top p-3">
					<div class="left-result-box col">
						<p>저희가 상품을 배송할때 확인 이메일을 확인 하실 수 있습니다.</p>
						<strong>저희 제품을 구매 해주셔서 감사합니다.</strong>
					</div>
					<div class="right-result-box col-4">
				<!-- 		<div class="row mb-2 d-flex">
							<div class="col">배송</div>
							<div class="col text-end">0 원</div>
						</div> -->
						<div class="row mb-2 d-flex">
							<div class="col">배송비</div>
							<div class="col text-end">
								<fmt:formatNumber value="${orderData.shipment.stype}" type="currency" currencySymbol="" groupingUsed="true" maxFractionDigits="0" />
								원
							</div>

						</div>
						<!-- 		<div class="row mb-2 d-flex">
							<div class="col">세금</div>
							<div class="col text-end">200,000 원</div>
						</div> -->
						<div class="row mb-2 d-flex ">
							<div class="col">할인</div>
							<div class="col text-end ">0 원</div>
						</div>
						<hr />
						<div class="row mb-2 d-flex">
							<div class="col">총 금액</div>
							<div class="col text-end">
								<fmt:formatNumber value="${orderData.ototalprice }" type="currency" currencySymbol="" groupingUsed="true" />원
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/viewport_mini_web/resources/js/orderConfirmation.js"></script>
</body>
</html>
