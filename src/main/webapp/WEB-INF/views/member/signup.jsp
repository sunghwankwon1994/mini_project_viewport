<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>회원가입</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="wrapper">
		<div class="container container-md">
			<div class="sign-up-container">
				<form method="post" name="signupForm" id="signupForm" class="h-100">
					<div class="container py-5 h-100">
						<div class="row d-flex justify-content-center align-items-center h-100">
							<div class="col">
								<div class="my-4">
									<!-- Left Column - Image -->
									<div class="row g-0 justify-content-center">
										<!-- Right Column - Form -->
										<div class="col-xl-6 card">
											<div class="card-body p-md-5 text-black">
												<h1 class="mb-5 text-uppercase">
													<b>Sign Up</b>
												</h1>
												
												<div data-mdb-input-init class="form-outline mb-5">
													<label class="form-label" for="uemail">이메일</label>
													<!-- 이메일 -->
													<div class="row">
														<div class="col-md-8 mb-4">
															<div data-mdb-input-init class="form-outline">
																<input type="text" id="uemail" name="uemail" class="form-control form-control-md" /> <small id="emailError"></small>
																<div class="uemail_ok" style="display: none">사용 가능한 이메일입니다.</div>
																<div class="uemail_already" style="display: none">사용 중인 이메일입니다.</div>
																<div class="uemail_null" style="display: none">이메일을 입력해 주세요.</div>
															</div>
														</div>
														<div class="col-md-4 mb-4">
															<button type="button" id="checkDuplicateEmail" onclick="checkEmail();" class="emailCheck btn btn-primary">중복 확인</button>
														</div>
													</div>
												</div>

												<!-- 패스워드 -->
												<div class="column d-flex">
													<div data-mdb-input-init class="column form-outline mb-4 me-3">
														<label class="form-label" for="upassword">비밀번호</label> <input type="password" id="upassword" name="upassword" placeholder="영어 대,소문자 숫자 혼용하여 8~15자" class="form-control form-control-md" /> <small id="pw1Error"></small>
													</div>
													<div data-mdb-input-init class="column form-outline mb-4">
														<label class="form-label" for="upasswordCheck">비밀번호 확인</label> <input type="password" id="upasswordCheck" name="upasswordConfirm" placeholder="비밀번호 확인을 입력하세요" class="form-control form-control-md" /> <small id="pw2Error"></small>
													</div>
												</div>
												<!-- 주민번호 -->
												<div class="column d-flex">
													<div data-mdb-input-init class="column form-outline mb-4 me-3">
														<label class="form-label" for="ussn1">주민번호</label> <input type="text" id="ussn1" name="ussn1" placeholder="YYMMDD" maxlength="6" class="form-control form-control-md" /> <small id="ussnError"></small>
													</div>
													<span>-</span>
													<div data-mdb-input-init class="column form-outline mb-4 mt-2">
														<label class="form-label" for="ussn2"></label> <input type="password" id="ussn2" name="ussn2" maxlength="7" class="form-control form-control-md" /> <small id="ussnError"></small>
													</div>
												</div>
												<!-- 이름 -->
												<div data-mdb-input-init class="form-outline mb-4">
													<label class="form-label" for="uname">이름</label> <input type="text" id="uname" name="uname" class="form-control form-control-md" maxlength="10" /> <small id="nameError"></small>
												</div>

												<div data-mdb-input-init class="form-outline mb-3">
													<label class="form-label" for="uphonenumber">휴대폰 번호</label> <input type="text" id="uphonenumber" name="uphonenumber" class="form-control form-control-md" placeholder="숫자를 입력하세요" maxlength="13" /> <small id="phoneNumError"></small>
												</div>

												<!-- 주소 -->
												<div class="bl_stack form">
													<div class="el_ttl">주소</div>
													<div class="bl_stack bl_stack--row">
														<input type="text" class="el_input hp_txt-center" placeholder="" disabled id="zonecode" />
														<button type="button" class="el_btn el_btn--outline hp_shrink-0" id="search-btn" onclick="onClickSearch()">우편번호 찾기</button>
													</div>
													<input type="text" class="el_input" placeholder="" disabled id="uaddress" name="uaddress" /> <input type="text" class="el_input" placeholder="상세주소를 입력해주세요." id="uaddressdetail" name="uaddressdetail" />
												</div>

												<div class="d-md-flex justify-content-start align-items-center mb-2 py-2">
													<h6 class="mb-0 me-4">성별:</h6>
													<div class="form-check form-check-inline mb-0 me-4">
														<input class="form-check-input" type="radio" name="ugender" id="ugender" value="1" checked /> <label class="form-check-label" for="femaleGender">여자</label>
													</div>
													<div class="form-check form-check-inline mb-0 me-4">
														<input class="form-check-input" type="radio" name="ugender" id="maleGender" value="0" /> <label class="form-check-label" for="ugender">남자</label>
													</div>
												</div>
												<div class="d-flex justify-content-end">
													<button type="reset" data-mdb-button-init data-mdb-ripple-init class="btn btn-light btn-md border-md">
														<b>초기화</b>
													</button>
													<button type="submit" id="signupButton" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg ms-2 border-radius: 50px">
														<b>회원가입</b>
													</button>
												</div>
											</div>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Include your JavaScript files -->
	<script src="/viewport_mini_web/resources/js/login.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/viewport_mini_web/resources/js/signup.js"></script>

</body>
</html>
