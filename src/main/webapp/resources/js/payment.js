
// 배송 메세지 직접 입력 
$(function() {
    $('#deliverySelect-direct').hide();

    $('#deliverySelect').change(function() {
        //직접 입력 클릭 시 나타남
        if($('#deliverySelect').val() == "deliveryDirect") {
            $('#deliverySelect-direct').show();
        }  else {
            $('#deliverySelect-direct').hide();
        }
    }); 
});

