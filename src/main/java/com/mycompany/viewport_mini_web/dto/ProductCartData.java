package com.mycompany.viewport_mini_web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductCartData {
  private Product product;
  private int quantity;
}
