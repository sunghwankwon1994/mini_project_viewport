package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mycompany.viewport_mini_web.dto.Orders;
import com.mycompany.viewport_mini_web.dto.Pager;

@Mapper
public interface OrdersDao {

  public void insertOrderData(Orders orders);

  public Orders selectOrderDataByOid();

  public List<Orders> selectAllOrdersByUserId(@Param("pager")Pager pager,@Param("ouserid")int ouserid);

  public Integer getTotalSalesAmount();

  public int getTotalRows();

  public List<Orders> selectByPage(Pager pager);

  public void updateStatusByOrderId(Orders order);

  public Orders selectOrdersByOrderIdAndUserId(@Param("oid")int oid, @Param("ouserid")int ouserid);

  public int totalOrderRowsByUserId(int usid);


}
