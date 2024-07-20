package com.mycompany.viewport_mini_web.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.CartItemDao;
import com.mycompany.viewport_mini_web.dto.CartItem;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartService {
  //생성자 주입
  private final CartItemDao cartItemDao;

  @Autowired
  public CartService(CartItemDao cartItemDao) {
    this.cartItemDao = cartItemDao;
  }

  public void addCartProduct(Users user, Product product) {
    log.info("실행");
    CartItem cart = cartItemDao.findCartByUserIdAndProductId(user.getUsid(), product.getPid());
    //카트에 상품이 없는 경우 새로 카드를 생성 아니라면 기존에 카트에 존재하는 상품인지 확인후 수량 추가
    if (cart == null) {
      cart = new CartItem();
      cart.setCuid(user.getUsid());
      cart.setCpid(product.getPid());
      cart.setCqty(1);
      cartItemDao.createCartWithProduct(cart);
      log.info("Product added to cart for user ID {}: product ID {}", user.getUsid(), product.getPid());
    } else {
      incrementCartItemQuantity(cart);
    }
  }

  public List<CartItem> getCartByUserId(int usid) {
    return cartItemDao.findCartByUserId(usid);
  }

  public List<CartItem> getAllCartItems(int cuid) {
    return cartItemDao.selectAllCartItems(cuid);
  }
  //js로 전달받은 수량 업데이트
  public boolean updateCartItemQty(CartItem cartItem) {
    CartItem existingCartItem = cartItemDao.findByCartIdAndProductId(cartItem);
    if (existingCartItem != null && cartItem.getCqty() > 0) {
      existingCartItem.setCqty(cartItem.getCqty());
      cartItemDao.updateCqty(existingCartItem);
      log.info("Quantity updated successfully for product ID {} in cart ID {}", cartItem.getCpid(),
          cartItem.getCid());
      return true;
    } else {
      log.warn("Product not found in cart or invalid quantity");
      return false;
    }
  }

  public boolean removeProduct(CartItem cartItem) {
    CartItem existingCartItem = cartItemDao.findRemoveProduct(cartItem);
    if (existingCartItem != null) {
      cartItemDao.removeCartItemByProductId(cartItem);
      log.info("Product removed successfully from cart ID {}", cartItem.getCid());
      return true;
    } else {
      log.warn("Product not found in cart");
      return false;
    }
  }

  public boolean removeCart(int usid) {
    List<CartItem> cartItems = cartItemDao.selectAllCartItems(usid);
    if (cartItems != null && !cartItems.isEmpty()) {
      cartItemDao.removeCart(usid);
      log.info("Cart removed for user ID {}", usid);
      return true;
    } else {
      log.warn("No cart items found for user ID {}", usid);
      return false;
    }
  }

  public int getCartIdByUserIdAndProductId(int cuid, int cpid) {
    int cartId = cartItemDao.findCartIdWithUserIdAndProductId(cuid, cpid);
    log.info("Cart ID found: {}", cartId);
    return cartId;
  }

  public void incrementCartItemQuantity(CartItem cart) {
    cart.setCqty(cart.getCqty() + 1);
    cartItemDao.updateCqty(cart);
    log.info("Product quantity incremented for cart ID {}: product ID {}", cart.getCid(), cart.getCpid());
  }
}
