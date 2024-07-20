<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Modal Header -->
<div class="modal-header border-0">
	<div class="">${uemail}</div>
	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<!-- Modal body -->
<div class="modal-body">

	<div class="d-flex flex-row justify-content-center">

		<img
			src="${pageContext.request.contextPath}/styles/attachStylesDownload?stid=${style.stid}"
			class="card-img row-2" style="width: 50%" id="styleModalImg" />
		<div class="row-2 item-info-box text-center ">
			<img
				src="${pageContext.request.contextPath}/products/attachProductDownload?pid=${product.pid}"
				class="card-img row-2" style="width: 50%" />
			<div class="text-center">${product.pname}</div>
			<div class="text-center"><fmt:formatNumber value="${product.pprice}" pattern="#,###" />원</div>
			<a href="${pageContext.request.contextPath}/products/productDetail?pid=${product.pid}">
				<div class="btn btn-outline-dark ">
					<span>구매하기</span>
				</div>
			</a>


		</div>
	</div>
</div>