<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 추가할부분 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 추가할부분 -->
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>VIEWPORT</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- 사용자 정의 자바 스크립트-->
<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/app_style.css">
<!-- 외부 스크롤 라이브러리 -->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body {
	background-image: url("/viewport_mini_web/resources/image/main2.png");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
	overflow-x: hidden;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<main>
	<section class="section1 container-fluid"></section>

	<section class="section2 container-fluid">
		<h2 class="section-title">당신을 위한 추천 상품</h2>
		<div class="">
			<!-- 한줄에 3개의 카드가 들어가도록 부트스트랩을 사용 -->
			<div class="card-container d-flex row row-cols-1 row-cols-md-3 g-4"
				id="featuredItems" style="width: 1400px; margin: 0 auto;">
				<c:forEach var="product" items="${products}">
					<div class="col">
						<div class="card" style="width: 18rem;">
							<a
								href="${pageContext.request.contextPath}/products/productDetail?pid=${product.pid}">
								<img
								src="${pageContext.request.contextPath}/products/attachProductDownload?pid=${product.pid}"
								class="card-img">
								<div class="card-body">
									<%-- <p class="lens">${product.lens || ''}</p> --%>
									<h5 class="card-title">${product.pname}</h5>
									<p class="card-text">
										<fmt:formatNumber value="${product.pprice}" pattern="#,###" />
									</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>

		<div class="text-center">

			<a class="btn btn-outline-light mb-5"
				href="${pageContext.request.contextPath}/products/productsList">View
				More</a>
		</div>

	</section>

	<section class="section3 container-fluid text-center">
		<h3 class="pt-5 pb-5">당신의 스타일을 위한 뷰포트</h3>
		<div class="row align-items-center mb-3 hideme">
			<div data-aos-once="true" data-aos="fade-up"
				data-aos-anchor-placement="center-center" class="col-md-6">
				<a href="${pageContext.request.contextPath}/styles"> 
					<img src="${pageContext.request.contextPath}/styles/attachStylesDownload?stid=${styles[0].stid}"
					width="637" height="864" class="img-fluid "
					alt="Description for Image 1">
				</a>

			</div>
			<div class="col-md-6 ">
				<h5>제품 사용 경험을 공유하세요!</h5>
				<p>이 사진처럼 멋진 순간을 경험하셨나요? 여러분의 이야기를 들려주세요. 고객님의 소중한 후기가 다른 이들에게
					영감을 줄 수 있습니다. 지금 바로 사진과 함께 경험담을 공유하고, 우리 커뮤니티의 활동적인 멤버가 되어보세요!</p>
			</div>
		</div>
		<div class="row align-items-center mb-3 hideme">
			<div data-aos-once="true" data-aos="fade-up"
				data-aos-anchor-placement="center-center"
				class="col-md-6 order-md-2">
				<a href="${pageContext.request.contextPath}/styles">
					<img src="${pageContext.request.contextPath}/styles/attachStylesDownload?stid=${styles[1].stid}"
					width="637" height="864" class="img-fluid "
					alt="Description for Image 2">				
				</a>

			</div>
			<div class="col-md-6 order-md-1">
				<h5>당신의 순간, 우리와 함께하세요</h5>
				<p>제품을 사용하여 촬영한 특별한 사진이 있나요? 그 특별한 순간을 공유하고 다른 사용자들과 연결될 기회를 갖습니다. 여러분의 후기가 다음 고객의 선택에 큰 영향을 미칠 수 있습니다. 사진과 함께 사용했던 순간을 공유해주세요!</p>
			</div>
		</div>
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/styles"
				class="btn btn-dark mb-5 mt-5">더보기</a>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</main>
	<!-- 외부 스크롤 애니메이션 api -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script src="/viewport_mini_web/resources/js/app.js"></script>
</body>
</html>