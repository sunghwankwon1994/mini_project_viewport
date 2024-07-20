<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- css 설정 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findStores.css">
<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>
<body class="">
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	
	
<section class="container text-center">
    <div class="d-flex justify-content-center" style="margin-top: 90px;">
        <div class="branch mr-3">
            <a href="${pageContext.request.contextPath}/findStores?blocation=대한민국" class="branch">
                <img src="${pageContext.request.contextPath}/resources/image/bthumbnail/branch1.jpeg" class="rounded-circle" width="85" height="85" alt="..." />
                <p class="ps-2">대한민국</p>
            </a>
        </div>
        <div class="branch mr-3">
            <a href="${pageContext.request.contextPath}/findStores?blocation=홍콩" class="branch">
                <img src="${pageContext.request.contextPath}/resources/image/bthumbnail/branch2.jpeg" class="rounded-circle" width="85" height="85" alt="..." />
                <p class="ps-2">홍콩</p>
            </a>
        </div>
        <div class="branch mr-3">
            <a href="${pageContext.request.contextPath}/findStores?blocation=미국" class="branch">
                <img src="${pageContext.request.contextPath}/resources/image/bthumbnail/branch3.jpeg" class="rounded-circle" width="85" height="85" alt="..." />
                <p class="ps-2">미국</p>
            </a>
        </div>
        <div class="branch">
            <a href="${pageContext.request.contextPath}/findStores?blocation=싱가포르" class="branch">
                <img src="${pageContext.request.contextPath}/resources/image/bthumbnail/branch4.jpeg" class="rounded-circle" width="85" height="85" alt="..." />
                <p class="ps-2">싱가포르</p>
            </a>
        </div>
    </div>
</section>

	
	
	<section class="container text-center">
		<div class="card mb-3  border-0 mb-5">
			<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/resources/image/bcontent/bimage4.jpg" class="d-block w-100" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="http://www.designtwoply.com/wp-content/uploads/2018/01/designtwoply-project092-1.jpg" class="d-block w-100" height="730" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="http://www.designtwoply.com/wp-content/uploads/2018/01/designtwoply-project092-3-8.jpg" height="730" class="d-block w-100" alt="..." />
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
			<div class="d-flex flex-row text-start">
				<div class="card-body w-50">
					<h5 class="card-title"><b>${branch.bname}</b></h5>
					<p class="card-text">${branch.baddress}</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
				<div class="card-body w-50">
					<p class="card-text">${branch.binfo}</p>
				</div>
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/findStores.js"></script>
</body>
</html>
