<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin">대시보드</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">사용자 관리</a></li>
						<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/products">상품 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/shippings">배송 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/notices">공지사항 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/styles">스타일 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">홈으로 돌아가기</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="card">
		<div class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
			<h2 class="ms-4">상품 관리</h2>

			<div>
				<input type="text" />
				<button>검색</button>
			</div>

		</div>
		<table class="table table-hover text-center align-middle" id="user-table">
			<thead>
				<tr>
					<th scope="col">상품#</th>
					<th scope="col">이름</th>
					<th scope="col">가격</th>
					<th scope="col">사진</th>
					<th scope="col">카테고리</th>
					<th scope="col">모양</th>
					<th scope="col">날짜</th>
					<th scope="col"><button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#createUserModal">상품 정보 생성</button></th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}">
					<tr>
						<th scope="row">${product.pid}</th>
						<td>${product.pname}</td>
						<td><fmt:formatNumber value="${product.pprice}" type="currency" currencySymbol="₩" groupingUsed="true" maxFractionDigits="0" /></td>
						<td>
							<img src="/viewport_mini_web/products/attachProductDownload?pid=${product.pid}" width="100" height="100" />
						</td>
						<td>${product.pcategory}</td>
						<td>${product.pshape}</td>
						<td><fmt:formatDate value="${product.pdate}" pattern="yyyy-MM-dd" /></td>
						<td>
							<button type="button" class="btn btn-dark edit-btn btn-sm productDataEditBtn" onclick="clickEventProduct('${product.pid}', '${product.pname}', ${product.pprice},'${product.pinfo}', '${product.pdetail}', '${product.pcategory}', '${product.pshape}')" data-bs-toggle="modal" data-bs-target="#editProductModal">상품 정보 수정</button>
							<button class="btn btn-danger edit-btn btn-sm" data-bs-toggle="modal" onclick="deleteProduct(${product.pid})" data-bs-target="#deleteUserModal">삭제</button>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
			<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<c:if test="${pager.groupNo>1 }">
					<li class="page-item"><a class="page-link" href="products?pageNo=${pager.startPageNo-1 }">Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
					<c:if test="${pager.pageNo!=i }">
						<li class="page-item"><a class="page-link" href="products?pageNo=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.pageNo ==i }">
						<li class="page-item ative"><a class="page-link" href="products?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
				<li class="page-item"><a class="page-link" href="products?pageNo=${pager.endPageNo+1}">Next</a></li>
				</c:if>
				
			</ul>
		</nav>

	</section>
	<!-- The Modal -->
	<div class="modal" id="editProductModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">상품 정보 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<form method="post" action="editProduct" class="modal-body" id="productModal"  enctype="multipart/form-data">
					<!-- js 출력 -->
				</form>
			</div>
		</div>
	</div>
	<div class="modal" id="createUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">상품 생성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="createProductForm" method="post" action="createProduct" enctype="multipart/form-data">
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pname">상품 이름</label> <input type="text" id="pname" name="pname" class="form-control form-control-lg" /> <small id="nameError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pprice">가격</label> <input type="text" id="pprice" name="pprice" class="form-control form-control-lg" /> <small id="priceError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pattach">썸네일 사진</label> <input type="file" id="pattach" name="pattach" class="form-control form-control-lg" /> <small id="imageError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ptattach">상품 사진</label> <input type="file" id="ptattach" name="ptattach" class="form-control form-control-lg" multiple="multiple" /> <small id="imageError"><a href="#">file1</a></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pinfo">상품 설명</label> <input type="text" id="pinfo" name="pinfo" class="form-control form-control-lg" /> <small id="infoError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pdetail">상품 상세 설명</label> <input type="text" id="pdetail" name="pdetail" class="form-control form-control-lg" /> <small id="detailError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pcategory">카테고리</label>
							<div class="col">
								<label><input type="radio" id="glasses" name="pcategory" value="안경" checked />안경</label>
							</div>
							<div class="col">
								<label><input type="radio" id="sunglasses" name="pcategory" value="선글라스" />선글라스</label>
							</div>
							<small id="categoryError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pshape">모양</label>
							<div class="col">
								<label><input type="radio" id="circle" name="pshape" value="원형" checked />원형</label>
							</div>
							<div class="col">
								<label><input type="radio" id="oval" name="pshape" value="타원형" /> 타원형</label>
							</div>
							<div class="col">
								<label><input type="radio" id="rectangle" name="pshape" value="사각형" />사각형</label>
							</div>							
							<small id="shapeError"></small>
						</div>						
						<button type="submit" class="btn btn-danger">생성</button>
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="deleteUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">유저 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal footer -->
				<div class="modal-body">
					<p>삭제하시겠습니까?</p>
				</div>
				<form method="post" action="deleteProduct" class="modal-footer" id="deleteProduct-modal-footer">
					<!-- js -->
				</form>


			</div>
		</div>
	</div>
	<script src="/viewport_mini_web/resources/js/admin.js"></script>
</body>
</html>
