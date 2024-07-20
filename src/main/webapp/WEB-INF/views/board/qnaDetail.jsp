<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/nav.css?ver=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="vh-100">
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="container mt-5 h-100">
		<div class="row h-100">
			<div class="col-md-8 offset-md-2 h-75">
				<div class="card mt-5 h-100">
					<div class="card-header">
						<h5 class="card-title mb-3 mt-3">${qna.qtitle }</h5>
						<p>${qna.qcategory}관련문의 사항</p>
						<p class="card-subtitle text-muted">
							작성자: ${qna.quemail } | 작성일:
							<fmt:formatDate value="${qna.qdate}" pattern="yyyy-MM-dd" />
						</p>
					</div>
					<div class="card-body">

						<p class="card-text">${qna.qcontent }</p>
						<c:if test="${qna.qattachoname != null}">
							<div class="mb-2">
								<img src="attachQnaDownload?qid=${qna.qid}" width="300" />
							</div>
						</c:if>
					</div>
					<div class="card-footer d-flex flex-wrap">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="#" class="btn btn-primary btn-sm me-2">답변 작성</a>
						</sec:authorize>
						<sec:authorize
							access="hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')">
							<a href="editQna?qid=${qna.qid}" class="btn btn-secondary btn-sm me-2">수정</a>
						</sec:authorize>
						<%-- 						<a href="#" class="btn btn-sm btn-danger"  data-bs-toggle="modal" onclick="deleteProduct(${product.pid})" data-bs-target="#deleteUserModal">삭제</a> --%>
						<button class="btn btn-danger edit-btn btn-sm"
							data-bs-toggle="modal" onclick="deleteQna(${qna.qid})"
							data-bs-target="#deleteUserModal">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="deleteUserModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">QNA 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal footer -->
				<div class="modal-body">
					<p>삭제하시겠습니까?</p>
				</div>
				<form method="post" action="deleteQna" class="modal-footer"
					id="deleteQna-modal-footer">
					<!-- js -->
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/viewport_mini_web/resources/js/qnaDetail.js"></script>
</body>
</html>