package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mycompany.viewport_mini_web.dto.CartItem;

@Mapper
public interface CartItemDao {

  //
  public CartItem findByCartIdAndProductId(CartItem cartItem);

  // 상품의 수량 변경
  public void updateCqty(CartItem cartItem);

  // 카트 상품들 다 불러올때
  public List<CartItem> selectAllCartItems(int cuid);

  // 하나만 삭제
  public void removeCartItemByProductId(CartItem cartItem);

  // 장바구니에 담을때
  public void createCartWithProduct(CartItem cartItem);

  public CartItem findCartByUserIdAndProductId(@Param("cuid") int cuid, @Param("cpid") int cpid);

  public List<CartItem> findCartByUserId(int cuid);

  public void removeCart(int cuid);

  public int findCartIdWithUserIdAndProductId(@Param("cuid") int cuid, @Param("cpid") int cpid);

  public CartItem findRemoveProduct(CartItem cartItem);


}
