<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<!-- 여기에 네비게이션 바 삽입 예정 -->
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="container-fluid g-0">
		<div class="row">
			<div class="col-md-3 sidebar">
				<div class="list-group rounded-0">
					<a href="${pageContext.request.contextPath}/mypage" class="list-group-item list-group-item-action">프로필</a> <a href="${pageContext.request.contextPath}/mypage/password" class="list-group-item list-group-item-action">비밀번호 변경</a> <a href="${pageContext.request.contextPath}/mypage/orders" class="list-group-item list-group-item-action">주문 내역</a> <a href="${pageContext.request.contextPath}/mypage/myqna" class="list-group-item list-group-item-action">문의 내역</a> <a href="${pageContext.request.contextPath}/mypage/deleteAccount" class="list-group-item list-group-item-action">회원 탈퇴</a>
				</div>
			</div>
			<div class="col-md-9 right-box">
				<div class="tab-content">

					<div class="tab-pane active" id="orders" role="tabpanel">
						<div class="card">
							<div class="card-body">
								<div class=" d-flex justify-content-between align-items-center">
									<h4 class="card-title">주문 내역</h4>
									<select id="orderSort" class="form-select form-select-sm" onchange="sortOrders()" style="width: auto;">
										<option value="date_desc">주문날짜 내림차순</option>
										<option value="date_asc">주문날짜 오름차순</option>
										<option value="price_desc">가격 내림차순</option>
										<option value="price_asc">가격 오름차순</option>
									</select>
								</div>
								<ul class="list-group list-group-flush">
									<c:forEach var="order" items="${ordersList}">
										<li class="list-group-item">
											<div class="row">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead class="table-light">
															<tr>
																<th>상품이미지</th>
																<th>상품명</th>
																<th>수량</th>
																<th>가격</th>
																<th>주문 날짜</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="item" items="${order.orderItems}">
																<tr>
																	<td width=100 style="table-layout: fixed;"><img src="/viewport_mini_web/products/attachProductDownload?pid=${item.oipid}" class="img-fluid" alt="${item.oipname}" height="50"></td>
																	<td>${item.oipname}</td>
																	<td>${item.oiqty}</td>
																	<td><fmt:formatNumber value="${item.oiprice}" type="currency" currencySymbol="" groupingUsed="true" maxFractionDigits="0" />원</td>
																	<td><fmt:formatDate value="${item.oidate}" pattern="yyyy-MM-dd" /></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<a href="#" class="order-detail-btn btn btn-dark btn-sm">주문 상세</a> <a href="#" class="shipment-info-btn btn btn-dark btn-sm">배송 정보</a>
											</div>
										</li>
									</c:forEach>
								</ul>
								<c:if test="${fn:length(ordersList)==0 }">
									<li class="list-group-item">작성하신 문의사항이 없습니다.</li>
								</c:if>
								<c:if test="${fn:length(ordersList)!=0 }">
									<div class="pagination-center ">
										<ul class="pagination  d-inline-flex">
											<c:if test="${pager.groupNo>1 }">
												<li class="page-item"><a class="page-link" href="orders?pageNo=${pager.startPageNo-1 }">Previous</a></li>
											</c:if>
											<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
												<c:if test="${pager.pageNo!=i }">
													<li class="page-item"><a class="page-link" href="orders?pageNo=${i}">${i}</a></li>
												</c:if>
												<c:if test="${pager.pageNo ==i }">
													<li class="page-item ative"><a class="page-link" href="orders?pageNo=${i}">${i}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${pager.groupNo<pager.totalGroupNo}">
												<li class="page-item"><a class="page-link" href="orders?pageNo=${pager.endPageNo+1}">Next</a></li>
											</c:if>

										</ul>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/viewport_mini_web/resources/js/mypage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>