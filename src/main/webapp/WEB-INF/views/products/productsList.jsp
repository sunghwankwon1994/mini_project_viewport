<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Products List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css?ver=1">
<link rel="stylesheet" href="/viewport_mini_web/resources/css/productsList.css?ver=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<div class="wrap">
		<div class="filter-block">
			<form id="filterForm" action="productsList" method="get">
				<div class="filter-category mt-3">
					<h6>카테고리</h6>
					<ul>
						<li><input type="checkbox" class="form-check-input" id="glasses" name="category" value="안경" <c:if test="${param.category == '안경'}">checked</c:if>> <label class="form-check-label" for="glasses">안경</label></li>
						<li><input type="checkbox" class="form-check-input" id="sunglasses" name="category" value="선글라스" <c:if test="${param.category == '선글라스'}">checked</c:if>> <label class="form-check-label" for="sunglasses">선글라스</label></li>
					</ul>
				</div>
				<div class="filter-price">
					<h6>가격</h6>
					<ul>
						<li><input type="checkbox" class="form-check-input" id="lowPrice" name="price" value="lowPrice" <c:if test="${param.price == 'lowPrice'}">checked</c:if>> <label class="form-check-label" for="lowPrice">낮은 가격순</label></li>
						<li><input type="checkbox" class="form-check-input" id="highPrice" name="price" value="highPrice" <c:if test="${param.price == 'highPrice'}">checked</c:if>> <label class="form-check-label" for="highPrice">높은 가격순</label></li>
					</ul>
				</div>
				<div class="filter-sort">
					<h6>정렬</h6>
					<ul>
						<li><input type="checkbox" class="form-check-input" id="older" name="date" value="older" <c:if test="${param.date == 'older'}">checked</c:if>> <label class="form-check-label" for="older">오래된순</label></li>
						<li><input type="checkbox" class="form-check-input" id="newer" name="date" value="newer" <c:if test="${param.date == 'newer'}">checked</c:if>> <label class="form-check-label" for="newer">최신순</label></li>
					</ul>
				</div>
				<div class="filter-shape">
					<h6>모양</h6>
					<ul>
						<li><input type="checkbox" class="form-check-input" id="circle" name="shape" value="원형" <c:if test="${param.shape == '원형'}">checked</c:if>> <label class="form-check-label" for="circle">원형</label></li>
						<li><input type="checkbox" class="form-check-input" id="rectangle" name="shape" value="사각형" <c:if test="${param.shape == '사각형'}">checked</c:if>> <label class="form-check-label" for="rectangle">사각형</label></li>
						<li><input type="checkbox" class="form-check-input" id="oval" name="shape" value="타원형" <c:if test="${param.shape == '타원형'}">checked</c:if>> <label class="form-check-label" for="oval">타원형</label></li>
					</ul>
				</div>

				<div class="filter-button">
					<button type="reset" id="resetButton">초기화</button>
					<button type="submit">검색</button>
				</div>
			</form>
		</div>
		<div class="list-block">
			<ul class="card-list">
				<c:forEach var="product" items="${products}">
					<li><a href="productDetail?pid=${product.pid}">
							<div>
								<img src="attachProductDownload?pid=${product.pid}" />
							</div>
							<div>
								<p class="mt-2 mb-0 fw-bold">${product.pname}</p>
								<p>
									<fmt:formatNumber value="${product.pprice}" pattern="#,###" />
								</p>
							</div>
					</a></li>
				</c:forEach>
			</ul>
			<%--javascript:void(0);는 자바스크립트에서 void와 같음 빈 값 리턴--%>
			<c:if test="${pager.totalRows != 0}">
				<div class="pagination-center">
					<div class="pagination">
						<c:if test="${pager.groupNo > 1}">
							<a href="javascript:void(0);" onclick="navigateToPage(${pager.startPageNo - 1})">&laquo;</a>
						</c:if>
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a href="javascript:void(0);" onclick="navigateToPage(${i})">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a href="javascript:void(0);" onclick="navigateToPage(${i})" class="text-warning">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pager.groupNo < pager.totalGroupNo}">
							<a href="javascript:void(0);" onclick="navigateToPage(${pager.endPageNo + 1})">&raquo;</a>
						</c:if>
					</div>
				</div>
			</c:if>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script src="/viewport_mini_web/resources/js/productsList.js"></script>

</body>
</html>
