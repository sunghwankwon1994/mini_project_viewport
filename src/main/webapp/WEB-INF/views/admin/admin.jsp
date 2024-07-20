<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/global.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<title>Admin</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자 페이지</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin">대시보드</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">사용자 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/products">상품 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/shippings">배송 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/notices">공지사항 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/styles">스타일 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">홈으로 돌아가기</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
		<h2 class="ms-4">상품 관리</h2>

		<div>
			<input type="text" />
			<button>검색</button>
		</div>

	</div>
	<section class="container mt-3">
		<div class="row">
			<div class="col-md-3">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">유저</div>
					<div class="card-body">
						<h5 class="card-title">${userCount}명</h5>
						<p class="card-text">전체 등록된 유저수</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card text-white bg-success mb-3">
					<div class="card-header">판매</div>
					<div class="card-body">
						<h5 class="card-title">
							<fmt:formatNumber value="${totalSalesAmount }" maxFractionDigits="0" type="currency" currencySymbol="" groupingUsed="true" />
							원
						</h5>
						<p class="card-text">이번달 판매 총 금액</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card text-white bg-danger mb-3">
					<div class="card-header">답변 해야하는 문의</div>
					<div class="card-body">
						<h5 class="card-title">5개</h5>
						<p class="card-text">해결해야 하는 문제</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card text-white bg-warning mb-3">
					<div class="card-header">게시글</div>
					<div class="card-body">
						<h5 class="card-title">5개</h5>
						<p class="card-text">전체 게시글 개수</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="container mt-3">
		<h3>최근 주문들</h3>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">주문번호#</th>
					<th scope="col">주문자</th>
					<th scope="col">배송지</th>
					<th scope="col">주문 상태</th>
					<th scope="col">주문 날짜</th>
					<th scope="col">주문 상세보기</th>
					<th scope="col">주문 상태 변경</th>
				</tr>
			</thead>
			<tbody id="user-table-body">
				<c:forEach var="order" items="${orderList}">
					<tr>
						<th scope="row">${order.oid}</th>
						<td>${order.oname}</td>
						<td>${order.oaddress}</td>
						<td id="orderStatus${order.oid}">${order.ostatus}</td>
						<td><fmt:formatDate value="${order.odate}" pattern="yyyy-MM-dd" /></td>
						<td>
							<button class="btn btn-light btn-sm order-detail-btn" data-order-id="${order.oid}" data-order-ouid="${order.ouserid}" data-bs-toggle="modal" data-bs-target="#orderDetailModal">주문상세 보기</button>
						</td>
						<td><c:if test="${order.ostatus eq '주문접수'}">
								<button type="button" class="btn btn-dark edit-btn btn-sm orderStatusEditBtn" onclick="clickStatusEvent('${order.oid }','상품준비중')">상품준비중</button>
							</c:if> <c:if test="${order.ostatus eq '상품준비중'}">
								<button type="button" class="btn btn-dark edit-btn btn-sm" onclick="clickStatusEvent('${order.oid}','상품출고완료')">상품출고완료</button>
							</c:if></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<c:if test="${pager.groupNo>1 }">
					<li class="page-item"><a class="page-link" href="admin?pageNo=${pager.startPageNo-1 }">Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
					<c:if test="${pager.pageNo!=i }">
						<li class="page-item"><a class="page-link" href="admin?pageNo=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.pageNo ==i }">
						<li class="page-item ative"><a class="page-link" href="admin?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<li class="page-item"><a class="page-link" href="admin?pageNo=${pager.endPageNo+1}">Next</a></li>
				</c:if>

			</ul>
		</nav>
	</section>
	<div class="modal" id="orderDetailModal">
		<div class="modal-dialog modal-lg">
			<!-- modal-lg 클래스를 사용하여 모달 크기를 조절할 수 있습니다 -->
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">주문 정보</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body" id="orderDetailContent">
					<!-- 주문 상세 내용이 여기에 동적으로 로드됩니다 -->
				</div>

			</div>
		</div>
	</div>

	<script src="/viewport_mini_web/resources/js/admin.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</body>
</html>
