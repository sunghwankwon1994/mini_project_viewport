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

	<section class="card">
		<div class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
			<h2 class="ms-4">공지사항 관리</h2>

			<div>
				<input type="text" />
				<button>검색</button>
			</div>

		</div>
		<table class="table table-hover text-center align-middle" id="user-table">
			<thead>
				<tr>
					<th scope="col">번호#</th>
					<th scope="col">카테고리</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
					<th scope="col"><button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#createUserModal">공지사항 추가</button></th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${notices}">
					<tr>
						<th scope="row">${notice.nid}</th>
						<td>${notice.ncategory}</td>
						<td>${notice.nname}</td>
						<td><fmt:formatDate value="${notice.ndate}" pattern="yyyy-MM-dd" /></td>
						<td>
							<button type="button" class="btn btn-dark edit-btn btn-sm NoticeDataEditBtn" onclick="clickEventNotice('${notice.nid}', '${notice.nname}', '${notice.ninfo}', '${notice.ncategory}')" data-bs-toggle="modal" data-bs-target="#editNoticeModal">수정</button>
							<button class="btn btn-danger edit-btn btn-sm" data-bs-toggle="modal" onclick="deleteNotice(${notice.nid})" data-bs-target="#deleteUserModal">삭제</button>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<c:if test="${pager.groupNo>1 }">
					<li class="page-item"><a class="page-link" href="notices?pageNo=${pager.startPageNo-1 }">Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
					<c:if test="${pager.pageNo!=i }">
						<li class="page-item"><a class="page-link" href="notices?pageNo=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.pageNo ==i }">
						<li class="page-item ative"><a class="page-link" href="notices?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
				<li class="page-item"><a class="page-link" href="notices?pageNo=${pager.endPageNo+1}">Next</a></li>
				</c:if>
				
			</ul>
		</nav>

	</section>
	<!-- The Modal -->
	<div class="modal" id="editNoticeModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">공지사항 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<form method="post" action="editNoticeData" class="modal-body" id="noticeModal">
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
					<h4 class="modal-title">공지사항 추가</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="createNoticeForm" method="post" action="createNotice">
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="nname">제목</label> <input type="text" id="nname" name="nname" class="form-control form-control-lg" /> <small id="nameError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ninfo">내용</label> <input type="text" id="ninfo" name="ninfo" class="form-control form-control-lg" /> <small id="infoError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ncategory">카테고리</label>
							<div class="col">
								<label><input type="radio" id="product" name="ncategory" value="상품" checked />상품</label>
							</div>
							<div class="col">
								<label><input type="radio" id="order" name="ncategory" value="주문" />주문</label>
							</div>
							<div class="col">
								<label><input type="radio" id="etc" name="ncategory" value="기타" />기타</label>
							</div>							
							<small id="categoryError"></small>
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
					<h4 class="modal-title">공지사항 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal footer -->
				<div class="modal-body">
					<p>삭제하시겠습니까?</p>
				</div>
				<form method="post" action="deleteNoticeData" class="modal-footer" id="deleteNotice-modal-footer">
					<!-- js -->
				</form>


			</div>
		</div>
	</div>
	<script src="/viewport_mini_web/resources/js/admin.js"></script>
</body>
</html>
