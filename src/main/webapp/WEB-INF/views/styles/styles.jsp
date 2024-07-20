<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- css 설정 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<section class="container">
	<div class="text-center"><h2>Styles</h2>
	<p>뷰포트와 함께한 다양한 순간을 만나보세요.
여기에 당신의 스타일을 공유해보세요.</p></div>
		<div class="row">
			<div class="col-md-12 d-flex justify-content-end mb-4">
<!-- 				<select id="sortOptions" class="form-select form-select-sm" style="width: 200px;" aria-label="Sort by">
					<option selected>정렬</option>
					<option value="newest">최신순</option>
					<option value="oldest">오래된순</option>
				</select> -->
				<button type="button" class="btn btn-dark me-4 " data-bs-toggle="modal" data-bs-target="#createStylesModal" id="createStylesButton">글쓰기</button>
			</div>
		</div>
		<div class="row no-gutters row-cols-4 gx-0 justify-content-center">
			<c:forEach var="style" items="${styles}">
				<div class="col m-1 image-box" style="width: 310px; height: auto;">
					<a href="javascript:openModal(${style.stid}, ${style.stpnum}, ${style.stuserid})">
					 <img src="${pageContext.request.contextPath}/styles/attachStylesDownload?stid=${style.stid}" class="card-img" height="100%" width="100%" id="style-img" />
					</a>
				</div>			
			</c:forEach>	
				
		</div>
		
		<!-- pagination -->
			<div class="pagination-center">
				<div class="pagination">
					<c:if test="${pager.groupNo>1}">
						<a href="${pageContext.request.contextPath}/styles?pageNo=${pager.startPageNo-1}">&laquo;</a>
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
						<a href="${pageContext.request.contextPath}/styles?pageNo=${pager.endPageNo+1}">&raquo;</a>
					</c:if>
				</div>
			</div>
	</section>
	<!-- The Modal -->
	<div class="modal fade " id="myModal">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div id="modalContent" class="modal-content rounded-0">
				<!-- ################################################### -->
				<!-- stylesModal.jsp -->
				<!-- Modal Header -->
<%-- 				<div class="modal-header border-0">
					<div class="">as***@****.com</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				
					<div class="d-flex flex-row justify-content-center">
					
						<img src="${pageContext.request.contextPath}/styles/attachStylesDownload?stid=${style.stid}" class="card-img row-2" style="width: 50%" id="styleModalImg"/>
						<div class="row-2 item-info-box text-center ">
							<img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/h/u/hush-01_2_1.jpg" class="card-img row-2" style="width: 50%" />
							<div class="text-center">Eq02</div>
							<div class="text-center">300,000원</div>
							<div class="btn btn-outline-dark ">
								<span>구매하기</span>
							</div>

						</div>
					</div>
				</div> --%>
				<!-- ################################################### -->
			</div>
		</div>
	</div>
	
	<div class="modal" id="createStylesModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">스타일즈 추가</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="createStylesForm" method="post" action="styles/createStyles" enctype="multipart/form-data">
						<div data-mdb-input-init class="form-outline mb-4">
							<select id="sortOptions" name="stylesPnum" class="form-select form-select-sm"  aria-label="Sort by">
								<option selected>상품 이름</option>
								<c:forEach var="product" items="${products}">
									<option value="${product.pid}">${product.pname}</option>						
								</c:forEach>
							</select>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="stattach">사진</label> <input type="file" id="stattach" name="stattach" class="form-control"  multiple="multiple" /> <small id="imageError"></small>
						</div>
						<button type="submit" class="btn btn-dark">생성</button>
						<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%> 
	<script src="/viewport_mini_web/resources/js/styles.js"></script>
</body>
</html>
