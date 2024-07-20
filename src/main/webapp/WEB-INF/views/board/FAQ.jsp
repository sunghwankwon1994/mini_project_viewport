<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- css 설정 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/FAQ.css">
<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css?ver=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
td{
transition: 0.9s ease;
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
						<b class="qTitle">FAQ</b>
					</h2>
				</div>
				<div>
					<div class="d-flex justify-content-center">
						<a href="${pageContext.request.contextPath}/board/noticeList" class="mx-3">공지사항</a>
						 <a href="#" class="mx-3" id="qna-button">FAQ</a> 
						 <a href="${pageContext.request.contextPath}/board/qnaList" class="mx-3">Q&A</a> 
					</div>
				</div>
			</div>



			<!-- 하단 영역 -->
			<div class="row justify-content-center">
				<div class="col">
					<table class="table table-hover text-center" style="table-layout: fixed;">
						<thead>
							<tr colspan=4>
								<th scope="col">No</th>
								<th scope="col">카테고리</th>
								<!--상품 / 주문 / 기타-->
								<th colspan=2 scope="col">제목</th>
							</tr>
						</thead>
						<tbody>
<!-- 							<tr data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false">
								<td>6</td>
								<td>주문</td>
								<td colspan=2>주문을 수정하고 싶어요</td>
							</tr>
							<tr id="collapse1" class="collapse">
								<td colspan="4">주문을 완료한 상품의 옵션 변경은 불가합니다.주문 취소 후, 원하는 옵션으로 재구매만 가능합니다. <br/>
								"상품 준비중" 단계 부터는 주문 취소가 불가능하며, 수령 후 반품 및 재구매 부탁드립니다.</td>
							</tr> -->
							<tr data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false">
								<td>5</td>
								<td>상품</td>
								<td colspan=2>품절 제품도 재입고가 되나요?</td>
							</tr>
							<tr id="collapse2" class="collapse">
								<td colspan="4">[품절] 상태는 추가 입고 예정이 없는 제품이며, [일시 품절] 은 재입고가 예정된 제품입니다. <br/>
								단, 재입고 여부 및 날짜는 변경될 수 있습니다.</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false">
								<td>4</td>
								<td>배송</td>
								<td colspan=2>배송 기간은 얼마나 걸리나요?</td>
							</tr>
							<tr id="collapse3" class="collapse">
								<td colspan="4">주문한 제품은 영업일 기준 1-3일 내에 받아보실 수 있습니다. <br/>
								택배 사 상황에따라 수령일은 변경될 수 있는 점 참고 부탁드립니다.</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false">
								<td>3</td>
								<td>주문</td>
								<td colspan=2>선물 포장이 가능한가요?</td>
							</tr>
							<tr id="collapse4" class="collapse">
								<td colspan="4">젠틀몬스터 웹사이트를 포함한 공식 온라인 스토어에서 구매 시, 모든 주문 건에 별도 신청 없이도 선물 포장 서비스가 제공됩니다.</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false">
								<td>2</td>
								<td>주문</td>
								<td colspan=2>주문 시 쇼핑백도 받을 수 있나요?</td>
							</tr>
							<tr id="collapse5" class="collapse">
								<td colspan="4">온라인 스토어 구매 시 쇼핑백은 동봉되지 않습니다. <br>
								가까운 오프라인 스토어 (백화점&플래그십 스토어)에 방문하여 주문 내역 확인 후 수령 가능합니다.</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="false">
								<td>1</td>
								<td>배송</td>
								<td colspan=2>합배송이 가능한가요?</td>
							</tr>
							<tr id="collapse6" class="collapse">
								<td colspan="4">주문번호가 상이할 경우 개별 배송이 진행되기 때문에 합배송은 불가능합니다.</td>
							</tr>
						</tbody>
					</table>
					</table>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


</body>

</html>