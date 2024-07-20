/*$(document).ready(function() {
  $('.btn.btn1').click(function() {
      const productId = ${product.pid}; 
      $.ajax({
          url: '/viewport_mini_web/cart/add',
          type: 'POST',
          data: { pid: productId },
          success: function(response) {
              $('#myModal1').modal('show');
          },
          error: function() {
              //alert('장바구니에 추가하는데 실패했습니다.');
            window.location.href = 'http://localhost:8080/viewport_mini_web/loginForm';
          }
      });
  });
});

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
        if (ostatus === '주문접수') {
          $('#orderStatus' + oid).closest('tr').find('.orderStatusEditBtn').text('상품준비중');
      } else if (ostatus === '상품준비중') {
          $('#orderStatus' + oid).closest('tr').find('.orderStatusEditBtn').text('상품출고완료');
      }
      },
      error: function(error) {
          console.error('아이템 수량 업데이트 중 에러발생: ', error);
      }
  });
  }*/

function openModal(stid, stpnum, stuserid) {
	// AJAX로 HTML 조각 받아오기	
	console.log(stid);
	$.get("styles/getStyleDetails", {stid: stid, stpnum: stpnum, stuserid: stuserid}, function(data) {
		$("#modalContent").html(data);
	   });	
	
	// 모달 띄우기
	const myModal = new bootstrap.Modal(document.getElementById('myModal'));
	myModal.show();
}


