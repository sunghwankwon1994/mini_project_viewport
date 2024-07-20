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
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/products">상품 관리</a></li>
						<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/shippings">배송 관리</a></li>
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
			<h2 class="ms-4">배송 관리</h2>

			<div>
				<input type="text" />
				<button>검색</button>
			</div>

		</div>
		<table class="table table-hover text-center align-middle" id="user-table">
			<thead>
				<tr>
					<th scope="col">배송ID#</th>
					<th scope="col">배송지</th>
					<th scope="col">운송번호</th>
					<th scope="col">배송상태</th>
					<th scope="col">배송일자</th>
					<th scope="col"><button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#createUserModal">배송 생성</button></th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="shipping" items="${shippings}">
					<tr>
						<th scope="row">${shipping.sid}</th>
						<td>${shipping.sname}</td>
						<td>${shipping.snumber}</td>
						<td>${shipping.sstatus}</td>
						<td>2024.12.10</td>
						<td>
							<button type="button" class="btn btn-dark edit-btn btn-sm userDataEditBtn" onclick="clickEvent(${shipping.sid},'${shipping.sname}','${shipping.snumber}','${shipping.sstatus}')" data-bs-toggle="modal" data-bs-target="#editUserModal">배송 정보 수정</button>
							<button class="btn btn-danger edit-btn btn-sm" data-bs-toggle="modal" data-bs-target="#deleteUserModal">삭제</button>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<li class="page-item"><a class="page-link">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item" aria-current="page"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>

	</section>
	<!-- The Modal -->
	<div class="modal" id="editUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">유저 정보</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<%-- <div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="userNum">유저 번호</label> <input type="text" id="userNum" class="form-control form-control-lg" value="${users[1].uid}" readonly />
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="userName">유저 이름</label> <input type="text" id="userName" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="userId">아이디</label> <input type="text" id="userId" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="UserRole">역할</label> <input type="text" id="UserRole" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div> --%>
				</div>

				<!-- Modal footer -->

				<div class="modal-footer">
					<a href="#" type="button" class="btn btn-dark" data-bs-dismiss="modal">수정</a>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	<div class="modal" id="createUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">유저 생성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="users" method="post" action="editUserData">
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uname">유저 이름</label> <input type="text" id="uname" name="uname" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uemail">아이디</label> <input type="text" id="uemail" name="uemail" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="urole">역할</label> <input type="text" id="urole" name="urole" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
					</form>

				</div>

				<!-- Modal footer -->

				<div class="modal-footer">
					<a href="admin/editUserData" type="submit" class="btn btn-dark">생성</a>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
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
				<div class="modal-footer">
					<a href="/viewport_mini_web/admin/deleteUserData" type="button" class="btn btn-dark">삭제</a>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	<script src="/viewport_mini_web/resources/js/admin.js"></script>
</body>
</html>
