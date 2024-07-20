<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- css 설정 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qnaList.css">
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/nav.css?ver=1">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
.table-row {
	cursor: pointer;
}
</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<div class="container-fluid">
		<div class="qna">
			<!-- 상단 영역 -->
			<div class="upper row justify-content-center align-items-center mb-5">
				<div class="col text-center">
					<h2 class="mt-5">
						<b class="qTitle">Q&A</b>
					</h2>
				</div>
				<div>
					<div class="d-flex justify-content-center">
						<a href="${pageContext.request.contextPath}/board/noticeList"
							class="mx-3">공지사항</a> <a
							href="${pageContext.request.contextPath}/board/FAQ" class="mx-3">FAQ</a>
						<a href="${pageContext.request.contextPath}/board/qnaList"
							class="mx-3" id="qna-button">Q&A</a>
					</div>
				</div>
			</div>

			<c:if test="${not empty errorMessage}">
				<div style="color: red;">
					<h3>${errorMessage}</h3>
				</div>
			</c:if>

			<!-- 하단 영역 -->
			<div class="row justify-content-center">
				<div class="col">
					<table class="table table-hover text-center"
						style="table-layout: fixed;">
						<!-- text-center 클래스 추가 -->
						<thead>
							<tr>
								<th scope="col">No <!-- <i class="fa-solid fa-sort" style="color: #fff;"></i> --></th>
								<th scope="col">카테고리</th>
								<!--상품 / 주문 / 기타-->
								<th scope="col">제목</th>
								<th scope="col">계정</th>
								<th scope="col">작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="qna" items="${qnaList}">
								<tr class="table-row"
									onClick="location.href='qnaDetail?qid=${qna.qid}'">
									<td>${qna.qid}</td>
									<td>${qna.qcategory}</td>
									<td><i class="fa-solid fa-lock"></i> ${qna.qtitle}</td>
									<td>${qna.quemail}</td>
									<td><fmt:formatDate value="${qna.qdate}"
											pattern="yyyy.MM.dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<a href="${pageContext.request.contextPath}/board/writeQNA" class="btn btn-dark btn-sm mt-0 text-white">글쓰기</a>
			</div>
			

			<!-- pagination -->
			<div class="pagination-center">
				<div class="pagination">
					<c:if test="${pager.groupNo>1}">
						<a
							href="${pageContext.request.contextPath}/styles?pageNo=${pager.startPageNo-1}">&laquo;</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a href="${pageContext.request.contextPath}/styles?pageNo=${i}">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a href="${pageContext.request.contextPath}/styles?pageNo=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a
							href="${pageContext.request.contextPath}/styles?pageNo=${pager.endPageNo+1}">&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>