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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
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

					<div class="tab-pane active" id="myqna" role="tabpanel">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">문의 내역</h4>
								<ul class="list-group list-group-flush">
									<c:forEach var="qna" items="${qnaList}" varStatus="status">
										<li class="list-group-item">
											<div class="d-flex justify-content-between align-items-center">
												<div>
													<h5>${qna.qtitle}</h5>
													<p>${qna.qcontent}</p>
													<c:if test="${qna.qattachoname != null }">
														<img src="../board/attachQnaDownload?qid=${qna.qid}" width="150">
													</c:if>
												</div>
												<c:if test="${qna.qstatus eq '답변완료' }">
													<span class="badge bg-success">${qna.qstatus}</span>
												</c:if>
												<c:if test="${ qna.qstatus eq '처리 중'}">
													<span class="badge bg-warning">${qna.qstatus}</span>
												</c:if>
											</div>
											<div class="mt-2">
												<strong>답변:</strong>
												<p>안녕하세요, 고객님. 제품 관리에 대한 자세한 안내를 메일로 보내드렸습니다. 확인 부탁드립니다.</p>
											</div>
										</li>

									</c:forEach>
									<c:if test="${fn:length(qnaList)==0 }">
										<li class="list-group-item">작성하신 문의사항이 없습니다.</li>
									</c:if>
								</ul>
								<c:if test="${fn:length(qnaList)!=0 }">
									<nav aria-label="..." class="d-flex justify-content-center me-5">
										<ul class="pagination  d-inline-flex">
											<c:if test="${pager.groupNo>1 }">
												<li class="page-item"><a class="page-link" href="myqna?pageNo=${pager.startPageNo-1 }">Previous</a></li>
											</c:if>
											<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
												<c:if test="${pager.pageNo!=i }">
													<li class="page-item"><a class="page-link" href="myqna?pageNo=${i}">${i}</a></li>
												</c:if>
												<c:if test="${pager.pageNo ==i }">
													<li class="page-item ative"><a class="page-link" href="myqna?pageNo=${i}">${i}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${pager.groupNo<pager.totalGroupNo}">
												<li class="page-item"><a class="page-link" href="myqna?pageNo=${pager.endPageNo+1}">Next</a></li>
											</c:if>

										</ul>
									</nav>
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