%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		<div class="d-flex flex-row justify-content-center">
			<a href="${pageContext.request.contextPath}/findStores?blocation=대한민국" class="branch">
				<img src="${pageContext.request.contextPath}/resources/image/bimage/bimage1" class="rounded-circle" width="85" height="85" alt="..." />
			</a>
				
				
			<a href="${pageContext.request.contextPath}/findStores?blocation=홍콩" class="branch">
				<img src="${pageContext.request.contextPath}/resources/image/bimage/bimage2" class="rounded-circle" width="85" height="85" alt="..." />
			</a>
				
				
				<a href="${pageContext.request.contextPath}/findStores?blocation=미국" class="branch">
				<img src="${pageContext.request.contextPath}/resources/image/bimage/bimage3" class="rounded-circle" width="85" height="85" alt="..." />
			</a>
				
				
				<a href="${pageContext.request.contextPath}/findStores?blocation=싱가포르" class="branch">
				<img src="${pageContext.request.contextPath}/resources/image/bimage/bimage4" class="rounded-circle" width="85" height="85" alt="..." />
			</a>
				
		</div>
		
		
		
	</section>
	<section class="container text-center">
		<div class="card mb-3  border-0 mb-5">
			<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://inhouse-resource.gentlemonster.com/store/17102963412966_HAUSNOWHERE_SH_1920x1080_1.jpg" class="d-block w-100" alt="..." />
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
					<h5 class="card-title">젠틀몬스터 샤먼 MIXC</h5>
					<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
				<div class="card-body w-50">
					<p class="card-text">젠틀몬스터만의 방법으로 퓨처 리테일의 새로운 방향성을 제시하고자 합니다. HAUS DOSAN(하우스 도산)은 앞으로 젠틀몬스터가 선보일 또다른 퓨처리테일의 시작점입니다. 해당 공간에는 젠틀몬스터와 더불어 감각적인 아름다움을 지향하는 코스메틱 브랜드 '탬버린즈'와 디저트를 통해 새로운 판타지를 구현하는 '누데이크'가 함께 입점했습니다. 젠틀몬스터가 보여줄 퓨처 리테일은 HAUS DOSAN(하우스 도산)을 시작으로, 앞으로도 소비자들은 계속하여 브랜드의 새로운 시도가 만들어낼 공간들을 마주할 수 있을 것입니다.</p>
				</div>
			</div>
		</div>

		<div class="card mb-3 border-0 mb-5">
			<div id="carouselControlsNoTouching1" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://cdn.shopify.com/s/files/1/0352/4571/9597/files/StoreImage_UpperCanadaMall_862x576_2.jpg?v=1599160091" height="730"class="d-block w-100" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="https://cdn.shopify.com/s/files/1/0352/4571/9597/files/Store_Generic_10.jpg?v=1596657687" height="730" class="d-block w-100" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="https://i.pinimg.com/originals/59/72/28/59722810631a950b14fe2a4992c14076.jpg"height="730" class="d-block w-100" alt="..." />
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselControlsNoTouching1" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselControlsNoTouching1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
			<div class="d-flex flex-row text-start">
				<div class="card-body w-50">
					<h5 class="card-title">젠틀몬스터 청두 타이쿠리</h5>
					<p class="card-text">1213, Central Lane, Sino-Ocean Taikoo Li Chengdu, No.8 Middle Shamao Street, Jinjiang District, Chengdu,China +86 028-6502-2026</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
				<div class="card-body w-50">

					<p class="card-text">젠틀몬스터 샤먼MIXC 플래그십 스토어는 미술사조의 ‘해체주의’에서 영감을 받아 디자인 되었습니다. 리테일에 대한 끊임없는 생각과 연구를 바탕으로 구현된 샤먼MIXC 스토어는 공간의 과감한 색감과 대비를 이루는 화이트 오브제들을 통해 자유로운 동선을 만들며 입체적인 공간 경험을 제공합니다. 1층의 거대한 키네틱 구조물 “ACCELATOR”는 앞 뒤로 움직이며 오브제 사이를 가로 지릅니다. 과감하게 전진하는 “ACCELATOR”는 추상적이면서도 압도적인 움직임을 선보이며 매장을 방문한 고객들에게 흥미로운 감정을 선사합니다. 또한 젠틀몬스터의 제품을 바라보는 순간에 대한 지속적인 연구는2층에 들어서며 마주하는 건축적 형태의 거대한 구조물을 통해 새로운 감각으로 표현됩니다. 대담하게 전진하며 추상적인 움직임을 선보이는 키네틱 구조물과 건축적 공간 속에서 감각적으로 존재하는 오브제의 결합으로 구현된 새롭고 다각적인 리테일을 공간을 경험해보세요.</p>

				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/findStores.js"></script>
</body>
</html>
