package com.mycompany.viewport_mini_web.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycompany.viewport_mini_web.dto.Orders;
import com.mycompany.viewport_mini_web.dto.ProductCartData;
import com.mycompany.viewport_mini_web.dto.TempPaymentData;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.CartService;
import com.mycompany.viewport_mini_web.service.OrderService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment")
public class PaymentController {

  @Autowired
  private UserService userService;
  @Autowired
  private OrderService orderService;
  @Autowired
  private ProductService productService;
  @Autowired
  private CartService cartService;


  @GetMapping("")
  public String payment() {
    log.info("payment() 실행");
    return "redirect:/";
  }

  @PostMapping("")
  public String getOrderDataFromView(@RequestParam("productIds") String[] productIds,
      @RequestParam("quantities") String[] quantities,
      @RequestParam("totalPriceWithoutDelivery") String totalPriceWithoutDelivery,
      @RequestParam("totalPriceWithDelivery") String totalPriceWithDelivery,
      @RequestParam("deliveryType") String deliveryType, Authentication authentication,
      Model model) {

    // 사용자 정보를 가져오기 위해 인증 객체에서 사용자 이름을 얻음
    Users user = userService.getUser(authentication.getName());

    // 주문 확인 데이터를 생성하기 위해 서비스 메서드를 호출
    TempPaymentData tempPaymentData = orderService.addOrderConfirmData(productIds, quantities,
        totalPriceWithoutDelivery, totalPriceWithDelivery, deliveryType);

    // 생성된 데이터를 모델에 추가하여 뷰로 전달
    model.addAttribute("tempData", tempPaymentData);
    model.addAttribute("user", user);

    // "payment/payment" 뷰를 반환
    return "payment/payment";
  }


  @Secured("ROLE_USER")
  @GetMapping("/orderConfirmation")
  public String orderConfirmation(HttpSession session, Model model, Authentication authentication) {
    log.info("OrderConfirmation() 실행");
    Users user = userService.getUser(authentication.getName());
    Orders order = (Orders) session.getAttribute("orderData");
    Boolean isOrderProcessed = (Boolean) session.getAttribute("isOrderProcessed");

    if (Boolean.TRUE.equals(isOrderProcessed)) {
      session.removeAttribute("orderData");
      session.removeAttribute("isOrderProcessed");

      model.addAttribute("user", user);
      model.addAttribute("orderData", order);
      model.addAttribute("productCartDataList", getProductCartDataList(order));
      return "payment/orderConfirmation";
    } else {
      return "redirect:/";
    }
  }

  @Transactional
  @PostMapping("/orderConfirmation")
  public String processOrderData(@ModelAttribute("orders") Orders orders,
      Authentication authentication, HttpSession session) {
    Users user = userService.getUser(authentication.getName());

    if (Boolean.TRUE.equals(session.getAttribute("isOrderProcessed"))) {
      return "redirect:/payment/orderConfirmation";
    }

    orders.setOuserid(user.getUsid());
    orders.getShipment().setSuserid(user.getUsid());
    orders.setOstatus("주문접수");
    orderService.addOrderData(orders);

    session.setAttribute("isOrderProcessed", true);
    session.setAttribute("orderData", orders);
    cartService.removeCart(user.getUsid());
    return "redirect:/payment/orderConfirmation";
  }

  public List<ProductCartData> getProductCartDataList(Orders order) {
    List<ProductCartData> productCartDataList = new ArrayList<>();
    order.getOrderItems().forEach(item -> {
      ProductCartData productCartData =
          new ProductCartData(productService.getProduct(item.getOipid()), item.getOiqty());
      productCartDataList.add(productCartData);
    });
    return productCartDataList;
  }
}
