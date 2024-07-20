package com.mycompany.viewport_mini_web.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.viewport_mini_web.dto.CartItem;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.ProductCartData;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.CartService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_USER")
@RequestMapping("/cart")
public class CartController {

  @Autowired
  private CartService cartService;
  
  @Autowired
  private UserService userService;
  
  @Autowired
  private ProductService productService;

  // 카트 페이지
  @GetMapping("")
  public String cart(Authentication authentication, Model model) {
    Users user = getCurrentUser(authentication);
    if (user == null) {
      log.error("User not found");
      return "error";
    }

    List<CartItem> cartItemList = cartService.getCartByUserId(user.getUsid());

    if (cartItemList != null) {
      List<ProductCartData> productDataList = new ArrayList<>();
      for (CartItem item : cartItemList) {
        Product product = productService.getProduct(item.getCpid());
        int quantity = item.getCqty();
        productDataList.add(new ProductCartData(product, quantity));
      }
      model.addAttribute("productDataList", productDataList);
    }

    return "cart/cart";
  }

  // 카트에 상품 추가 메소드
  @PostMapping("/add")
  @ResponseBody
  public String addProductToCart(@RequestParam("pid") int pid, Authentication authentication) {
    try {
      Users user = getCurrentUser(authentication);
      if (user == null) {
        log.error("User not authenticated");
        return "실패";
      }
      
      Product product = productService.getProduct(pid);
      cartService.addCartProduct(user, product);
      return "성공";
    } catch (Exception e) {
      log.error("Error adding product to cart", e);
      return "실패";
    }
  }

  // 카트에 존재하는 상품 수량 업데이트 메소드
  @PostMapping("/updateQuantity")
  @ResponseBody
  public String updateQuantity(@RequestBody CartItem cartItem, Authentication authentication) {
    try {
      Users user = getCurrentUser(authentication);
      if (user == null) {
        log.error("User not authenticated");
        return "실패";
      }

      int cartId = cartService.getCartIdByUserIdAndProductId(user.getUsid(), cartItem.getCpid());
      cartItem.setCid(cartId);
      cartItem.setCuid(user.getUsid());

      boolean updateResult = cartService.updateCartItemQty(cartItem);
      return updateResult ? "성공" : "실패";
    } catch (Exception e) {
      log.error("Error updating cart item quantity", e);
      return "실패";
    }
  }

  // 카트 상품 삭제 메소드
  @PostMapping("/removeProduct")
  @ResponseBody
  public String removeProduct(@RequestBody CartItem cartItem, Authentication authentication) {
    try {
      Users user = getCurrentUser(authentication);
      if (user == null) {
        log.error("User not authenticated");
        return "실패";
      }

      cartItem.setCuid(user.getUsid());
      log.info(cartItem.toString());

      boolean removeResult = cartService.removeProduct(cartItem);
      return removeResult ? "성공" : "실패";
    } catch (Exception e) {
      log.error("Error removing product from cart", e);
      return "실패";
    }
  }

  // 현재 사용자 정보를 가져오는 메소드
  private Users getCurrentUser(Authentication authentication) {
    String uemail = authentication.getName();
    return uemail != null ? userService.getUser(uemail) : null;
  }
}
