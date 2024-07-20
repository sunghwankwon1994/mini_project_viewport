const modal = document.querySelector('#userModal');
const myModal = document.querySelectorAll('.userDataEditBtn');
const myInput = document.getElementById('myInput');
const deleteModalFooter = document.getElementById('delete-model-footer');

const deleteProductModalFooter = document.getElementById('deleteProduct-modal-footer');
const editProduct = document.querySelector('#productModal'); 

const deleteNoticeModalFooter = document.getElementById('deleteNotice-modal-footer');
const editNotice = document.querySelector('#noticeModal'); 

const deleteStylesModalFooter = document.getElementById('deleteStyles-modal-footer');



    function clickEvent(usid,uemail,uname,uphonenumber,uaddress,uaddressdetail,ugender,urole) {
      modal.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userNum">유저 번호</label> 
        <input type="text" id="userNum" name="usid" class="form-control form-control-lg" value="${usid}" readonly/>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userName">유저 이름</label>
        <input type="text" id="userName" name="uname" class="form-control form-control-lg" value="${uname}" readonly/> <small id="birthError"></small>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">아이디</label>
        <input type="text" id="userId" name="uemail"class="form-control form-control-lg" value="${uemail}" readonly/> <small id="birthError"></small>
      </div>
          <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">주소</label>
        <input type="text" id="userAddress" name="uaddress" class="form-control form-control-lg" value="${uaddress}" readonly/> <small id="birthError"></small>
      </div>
          <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">상세주소</label>
        <input type="text" id="userAddressDetail" name="uaddressdeatil" class="form-control form-control-lg" value="${uaddressdetail}" readonly/> <small id="birthError"></small>
      </div>
         <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">연락처</label>
        <input type="text" id="uphonenumber" name="uphonenumber"class="form-control form-control-lg" value="${uphonenumber}" readonly/> <small id="birthError"></small>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
              <label class="form-label" for="ugender">성별</label> <input type="radio" id="man" name="ugender" value="true" ${ugender=== 'true'? "checked" : ""} />남자 <input type="radio" id="woman" name="ugender" value="false" ${ugender==='false' ? "checked" : ""} />여자 <small id="birthError"></small>
            </div>
       <div data-mdb-input-init class="form-outline mb-4">
           <label class="form-label" for="urole">역할</label> 
           <input type="radio" id="admin" name="urole" value="ROLE_ADMIN" ${urole === "ROLE_ADMIN" ? "checked" : ""}/> 관리자 <input type="radio" id="user" name="urole" value="ROLE_USER" ${urole==="ROLE_USER"? "checked" : ""} /> 유저 <small id="birthError"></small>
       </div>
      <button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      `
    }

    
    function deleteBtn(index) {
      
    }
    function deleteUserData(usid) {
      console.log(usid);
      deleteModalFooter.innerHTML =`<button type="submit"  name="usid" value="${usid}" class="btn btn-dark">삭제</button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }
    
    function clickEventProduct(pid, pname, pprice, pinfo, pdetail, pcategory, pshape){
    	editProduct.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pid">상품 번호</label> <input
								type="text" id="pid" name="pid"
								class="form-control form-control-lg" value="${pid}" readonly /> <small id="idError"></small>
						</div>					
    					<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pname">상품 이름</label> <input
								type="text" id="pname" name="pname"
								class="form-control form-control-lg" value="${pname}" /> <small id="nameError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pprice">가격</label> <input
								type="text" id="pprice" name="pprice"
								class="form-control form-control-lg" value="${pprice}" /> <small id="priceError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
					    		<label class="form-label" for="pattach">썸네일 사진</label> 
					    		<input type="file" id="pattach" name="pattach" class="form-control form-control-lg" /> <small id="imageError"></small>
					    </div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ptattach">상품 사진</label> <input
								type="file" id="ptattach" name="ptattach"
								class="form-control form-control-lg" multiple="multiple" /> <small
								id="imageError"><a href="#">file1</a></small>
						</div>						    

						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pinfo">상품 설명</label> <input
								type="text" id="pinfo" name="pinfo"
								class="form-control form-control-lg" value="${pinfo}" /> <small id="infoError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pdetail">상품 상세 설명</label> <input
								type="text" id="pdetail" name="pdetail"
								class="form-control form-control-lg" value="${pdetail}" /> <small id="detailError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pcategory">카테고리</label>
							<div class="col">
								<input type="radio" id="glasses" name="pcategory" value="안경" ${pcategory==="안경"? "checked" : ""}/>
								<label for="glasses">안경</label>
							</div>
							<div class="col">
								<input type="radio" id="sunglasses" name="pcategory" value="선글라스" ${pcategory==="선글라스"? "checked" : ""} /> <label
									for="sunglasses">선글라스</label>
							</div>
							<small id="categoryError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pshape">모양</label>
							<div class="col">
								<input type="radio" id="circle" name="pshape" value="원형" ${pshape==="원형"? "checked" : ""} /> <label for="circle">원형</label>
							</div>
							<div class="col">
								<input type="radio" id="oval" name="pshape" value="타원형" ${pshape==="타원형"? "checked" : ""} /> <label for="oval">타원형</label>
							</div>
							<div class="col">
								<input type="radio" id="rectangle" name="pshape" value="사각형" ${pshape==="사각형"? "checked" : ""} /> <label for="rectangle">사각형</label>
							</div>							
							<small id="shapeError"></small>
						</div>								
					<button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }
    
    function deleteProduct(pid) {
    	deleteProductModalFooter.innerHTML=`<button type="submit" name="pid" value="${pid}" class="btn btn-dark">삭제</button>
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }
    
    
    function clickEventNotice(nid,nname,ninfo,ncategory){
    	editNotice.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="nid">공지사항 번호</label> <input
								type="text" id="nid" name="nid"
								class="form-control form-control-lg" value="${nid}" readonly /> <small id="idError"></small>
						</div>								
    	<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="nname">제목</label> <input type="text" id="nname" name="nname" class="form-control form-control-lg" value="${nname}" /> <small id="nameError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ninfo">내용</label> <input type="text" id="ninfo" name="ninfo" class="form-control form-control-lg" value="${ninfo}" /> <small id="infoError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ncategory" >카테고리</label>
							<div class="col">
								<label><input type="radio" id="product" name="ncategory" value="상품"  ${ncategory==="상품"? "checked" : ""} />상품</label>
							</div>
							<div class="col">
								<label><input type="radio" id="order" name="ncategory" value="주문"  ${ncategory==="주문"? "checked" : ""}/>주문</label>
							</div>
							<div class="col">
								<label><input type="radio" id="etc" name="ncategory" value="기타"  ${ncategory==="기타"? "checked" : ""}/>기타</label>
							</div>							
							<small id="categoryError"></small>
						</div>												
					<button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }
        
    
    function deleteNotice(nid) {
    	deleteNoticeModalFooter.innerHTML=`<button type="submit" name="nid" value="${nid}" class="btn btn-dark">삭제</button>
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }  
    
    function deleteStyles(stid) {
    	deleteStylesModalFooter.innerHTML =`<button type="submit"  name="stid" value="${stid}" class="btn btn-dark">삭제</button>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
      }    
    
    // 주문 상태 업데이트 ajax
    function clickStatusEvent(oid,ostatus) {
      console.log("클릭이벤트 실행");
      $.ajax({
        url: 'admin/updateStatus',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ oid: oid, ostatus: ostatus }),
        success: function(response) {
          console.log(response);
          
          $('#orderStatus'+oid).text(ostatus);
          console.log(ostatus);
          if (ostatus === '상품준비중') {
            console.log("이거 실행됨1");
            $('#orderStatus' + oid).closest('tr').find('.orderStatusEditBtn').text('상품출고완료');
            $('#orderStatus' + oid).closest('tr').find('.orderStatusEditBtn').attr('onclick', function() {
                return "clickStatusEvent('" + oid + "', '상품출고완료')";
            }); } else if (ostatus === '상품출고완료') {
          console.log("이거 실행됨123");
          $('#orderStatus' + oid).closest('tr').find('.orderStatusEditBtn').remove();
        }
        },
        error: function(error) {
            console.error('아이템 수량 업데이트 중 에러발생: ', error);
        }
    });
    }
    
    $(document).ready(function() {
      // 주문 상세보기 버튼 클릭 이벤트 핸들러
      $(".order-detail-btn").click(function() {
          var orderId = $(this).data("order-id"); 
          var orderUid = $(this).data("order-ouid"); 
          
          $.ajax({
              url: "admin/orderDetail", 
              type: "GET",
              data: { oid: orderId, ouserid: orderUid }, 
              success: function(data) {
                  // 모달의 컨텐츠 영역 업데이트
                  $("#orderDetailContent").html(data);
              },
              error: function() {
                  alert("주문 상세 정보를 불러오는 중 오류가 발생했습니다.");
              }
          });
      });
  });


