<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="/viewport_mini_web/resources/css/login.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>LOGIN</title>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="wrapper">
		<div class="container container-md">
			<div class="sign-in-container">
				<!-- 로그인!!!!!!!!!!! -->
				<form method="post" id="loginform" action="${pageContext.request.contextPath}/login" class="loginform" novalidate>
					<h1 class="logintitle">
						<b>로그인</b>
					</h1>

					<input type="text" placeholder="Email" id="uemail" name="uemail" class="logininput mb-4"> <small class="error-message" id="idError"></small> <input type="password" placeholder="Password" id="upassword" name="upassword" class="logininput mb-4"> <small class="error-message" id="pwError"></small>

					<div class="login-remember mb-4 mt-3">
						<!-- 	<input type="checkbox" name="login-remember" id="login-rememberbox">  -->
						<!-- 			<label for="login-remember">
						Remember ID
						</label> -->
					</div>

					<div class="width: 300px mb-3 ">
						<button type="submit" class="form_btn_login justify-content-center align-content-center">LOGIN</button>
					</div>


					<div class="width: 300px mb-3 ">
						<button type="button" class="form_btn_signup justify-content-center align-content-center" onclick="location.href='signup'">SIGN UP</button>
					</div>

<!-- 					<div class="kakaologin mt-3">
						<img src="/viewport_mini_web/resources/image/kakaotalkcircle.png" class="height: 30px width:30px;">
					</div> -->


					<div class="forgot row mt-5 mb-5">
						<div class="col text-center">
						   <a href="#" id="forgotPw" class="forgotpassword" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal"><b>비밀번호 찾기</b></a>
						</div>
					</div>
				</form>
			</div>

			<!--------------- 모달---------- -->
			<div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기 </h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form class="modal-form">
			                <div class="mb-3">
			            <label for="findPwEmail" class="col-form-label">이메일 (아이디):</label>
			            <input type="text" class="form-control" id="findPwEmail">
			          </div>
			          <div class="mb-3">
			            <label for="findPwName" class="col-form-label">이름:</label>
			            <input type="text" class="form-control" id="findPwName">
			          </div>
			
			           <div class="mb-3">
			            <label for="findPwPhonenumber" class="col-form-label">휴대폰 번호:</label>
			            <input type="text" class="form-control" id="findPwPhonenumber">
			          </div>
			          
			          <p id=random></p>
			          <a href="${pageContext.request.contextPath}/loginForm" id="goToLogin" style="display: none"><b>Go to Login</b></a>      
			          
			       </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="generatePwBtn" onclick="generateTemporaryPassword()">임시 비밀번호 생성하기</button>
			      </div>
			      <div>
			      </div>
			    </div>
			  </div>
			</div>

			<!-- 옆으로 -->

			<div class="overlay-container">
				<div class="overlay-left">
					<h2>V I E W P O R T</h2>
					<p>To keep connected with us, please login with your personal info</p>
<!-- 					<button id="signIn" class="overlay_btn">Sign In</button>
 -->				</div>
				<div class="overlay-right">
					<h2>V I E W P O R T</h2>
<!-- 					<button id="seeMore" class="overlay_btn">SEE MORE?</button>
 -->				</div>
			</div>
		</div>
	</div>


	 <script src = "/viewport_mini_web/resources/js/login.js"></script> 
</body>
</html>