package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.OrderItem;

@Mapper
public interface OrderItemDao {

  void insertOrderItemData(OrderItem orderItem);

  public List<OrderItem> getItemsByOrderIdAndUserId();

}
