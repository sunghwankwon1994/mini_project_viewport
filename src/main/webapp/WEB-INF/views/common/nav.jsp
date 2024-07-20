
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<%-- <div class="d-flex justify-content-around fixed-top" id="nav">
	<ul class="d-flex" id="nav-logo">
		<li><a href="${pageContext.request.contextPath}/"><span
				id="nav-logo-text">VIEWPORT</span></a></li>
	</ul>
	<ul id="nav-menu" class="d-flex justify-content-lg-center flex-grow-2">
		<li class="h-100"><a
			href="${pageContext.request.contextPath}/products/productsList"><span
				class="align-middle">상품</span></a></li>
		<li class="h-100"><a
			href="${pageContext.request.contextPath}/styles"><span
				class="align-middle">스타일</span></a></li>
		<li class="h-100"><a
			href="${pageContext.request.contextPath}/findStores?blocation=대한민국"><span
				class="align-middle">스토어</span></a></li>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<li class="h-100"><a
			href="${pageContext.request.contextPath}/admin"><span
				class="align-middle">어드민</span></a></li>
		</sec:authorize>

	</ul>
	<ul class="d-flex justify-content-end" id="nav-icon">

		<sec:authorize access="isAnonymous()">
			<li class="h-100"><a
				href="${pageContext.request.contextPath}/loginForm"> <span
					class="align-middle"><i class="fa-solid fa-right-to-bracket"
						style="color: #000000;"></i></span>
			</a></li>
			<li class="h-100"><a
				href="${pageContext.request.contextPath}/signup"> <span
					class="align-middle"><i class="fa-solid fa-user-plus"
						style="color: #000;"></i></span>
			</a></li>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div class="h-100 d-flex align-items-center">
				<div>
					<b class="text-dark me-2"> <sec:authentication
							property="principal.username" /></b>
				</div>
			</div>
			사이트간 요청 위조 방지 설정이 비 활성화되어 있을 경우 GET 방식으로 요청 가능
			<li class="h-100"><a
				href="${pageContext.request.contextPath}/cart"> <span
					class="align-middle"><i class="fa-solid fa-cart-shopping"
						style="color: #000;"></i></span>
			</a></li>
			<li class="h-100"><a
				href="${pageContext.request.contextPath}/mypage"> <span
					class="align-middle"><i class="fa-solid fa-user"
						style="color: #000000;"></i></span>
			</a></li>


			<li class="h-100"><a
				href="${pageContext.request.contextPath}/logout"> <span
					class="align-middle"><i
						class="fa-solid fa-right-from-bracket" style="color: #000000;"></i></span>
			</a></li>
		</sec:authorize>

	</ul>
</div> --%>


<nav class="navbar navbar-expand-lg navbar-light pe-4 fixed-top" style="background-color: #fff;">
	<div class="container-fluid">
		<a class="navbar-brand ms-3" href="${pageContext.request.contextPath}/"><span
			id="nav-logo-text">VIEWPORT</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse ms-3" id="navbarText">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="${pageContext.request.contextPath}/products/productsList">상품</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/styles">스타일</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/findStores?blocation=대한민국">스토어</a>
				</li>
				 <sec:authorize access="hasRole('ROLE_ADMIN')">				
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin">어드민</a></li>
				</sec:authorize>
			</ul>
			<sec:authorize access="isAuthenticated()">
			<b class="navbar-text ms-auto  d-none d-lg-block me-3 text-dark">
				<sec:authentication
							property="principal.username" /> </b>
			</sec:authorize>
			<ul class="navbar-nav  mb-2 mb-lg-0  d-flex flex-row">
				<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a class="nav-link me-3"
					href="${pageContext.request.contextPath}/loginForm"><i
						class="fa-solid fa-right-to-bracket" style="color: #000;"></i></a></li>
				<li class="nav-item"><a class="nav-link me-3"
					href="${pageContext.request.contextPath}/signup"><i
						class="fa-solid fa-user-plus" style="color: #000;"></i></a></li>
				</sec:authorize>	
				<sec:authorize access="isAuthenticated()">	
				<%-- 사이트간 요청 위조 방지 설정이 비 활성화되어 있을 경우 GET 방식으로 요청 가능 --%>
				<li class="nav-item"><a class="nav-link me-3"
					href="${pageContext.request.contextPath}/cart"><i
						class="fa-solid fa-cart-shopping" style="color: #000;"></i></a></li>
				<li class="nav-item"><a class="nav-link me-3"
					href="${pageContext.request.contextPath}/mypage"><i
						class="fa-solid fa-user" style="color: #000000;"></i></a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/logout"><i
						class="fa-solid fa-right-from-bracket" style="color: #000000;"></i></a>
				</li>
				</sec:authorize>	
			</ul>
		</div>
	</div>
</nav>
