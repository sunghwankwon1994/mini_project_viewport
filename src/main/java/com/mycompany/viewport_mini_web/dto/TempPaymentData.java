package com.mycompany.viewport_mini_web.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class TempPaymentData {
  private int totalPrice;
  private int deliveryType;
  private List<ProductCartData> itemList;
  private int totalPriceWithDelivery;
}
