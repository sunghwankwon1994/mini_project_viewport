document.addEventListener('DOMContentLoaded', () => {
    updateTotalPrice();  // 초기 가격 업데이트
});

// 아이템의 총 가격과 배송비를 계산하여 업데이트
const updateTotalPrice = () => {
  const deliveryOption = document.getElementById('delivery-option');
  let deliveryPrice = parseInt(deliveryOption.value);
  let itemsTotalPrice = Array.from(document.querySelectorAll('.product-row')).reduce((total, item) => {
      const price = parseInt(item.querySelector('.col[data-price]').getAttribute('data-price'));
      const quantity = parseInt(item.querySelector('.count-box').textContent);
      const itemTotalPrice = price * quantity;

      return total + (price * quantity);
  }, 0);

  let totalPrice = itemsTotalPrice + deliveryPrice;
  document.getElementById('totalPriceWithoutDelivery').value = itemsTotalPrice;
  document.getElementById('totalPriceWithDelivery').value = totalPrice;
  document.getElementById('deliveryType').value = deliveryPrice;

  document.querySelector('.total-price').textContent = `${itemsTotalPrice.toLocaleString('kr-KR')} 원`;
  document.getElementById('total-price').textContent = `${totalPrice.toLocaleString('kr-KR')} 원`;

  // 결제 버튼 참조
  const checkoutButton = document.querySelector('.checkout-btn');
  
  // 아이템 총 수량을 확인하고 버튼 활성화 또는 비활성화
  const totalQuantity = Array.from(document.querySelectorAll('.count-box')).reduce((sum, countBox) => sum + parseInt(countBox.textContent), 0);
  if (totalQuantity > 0) {
      checkoutButton.disabled = false; // 아이템이 있으면 버튼 활성화
  } else {
      checkoutButton.disabled = true;  // 아이템이 없으면 버튼 비활성화
  }
};

// 수량 변경 처리
const editCount = (pid, type) => {
  let countBox = document.querySelector(`.count-box[data-pid="${pid}"]`);
  let hiddenInput = document.querySelector(`input.product-quantity[data-pid="${pid}"]`);
  let quantity = parseInt(countBox.textContent);
  const newQty = type === 'plus' ? quantity + 1 : quantity - 1;

  if (newQty >= 1) {
      $.ajax({
          url: 'cart/updateQuantity',
          type: 'POST',
          contentType: 'application/json',
          data: JSON.stringify({ cpid: pid, cqty: newQty }),
          success: function(response) {
              countBox.textContent = newQty;
              hiddenInput.value = newQty; 
              updateTotalPrice();  
          },
          error: function(error) {
              console.error('아이템 수량 업데이트 중 에러발생: ', error);
          }
      });
  }
};


// 아이템 삭제 처리
const removeItem = (productId) => {
  $.ajax({
    url: 'cart/removeProduct',
    type: 'POST',
    contentType: 'application/json',
    data: JSON.stringify({ cpid: productId }), 
    success: function(response) {
      $(`input[name='productIds'][value='${productId}']`).remove();
      $(`input.product-quantity[data-pid='${productId}']`).remove();
      $(`.product-row[data-pid="${productId}"]`).remove();
      updateTotalPrice();
    },
    error: function(error) {
      console.error('카트 제품 삭제중 에러 발생:', error);
      alert('제품 제거에 실패하였습니다.');
    }
  });
};

document.getElementById('delivery-option').addEventListener('change', updateTotalPrice); 
