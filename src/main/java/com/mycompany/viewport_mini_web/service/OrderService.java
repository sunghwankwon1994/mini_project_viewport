package com.mycompany.viewport_mini_web.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.OrderItemDao;
import com.mycompany.viewport_mini_web.dao.OrdersDao;
import com.mycompany.viewport_mini_web.dao.ProductDao;
import com.mycompany.viewport_mini_web.dao.ShipmentDao;
import com.mycompany.viewport_mini_web.dto.OrderItem;
import com.mycompany.viewport_mini_web.dto.Orders;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.ProductCartData;
import com.mycompany.viewport_mini_web.dto.TempPaymentData;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderService {
  @Autowired
  private OrdersDao orderDao;
  @Autowired
  private OrderItemDao orderItemDao;
  @Autowired
  private ProductDao productDao;
  @Autowired
  private ShipmentDao shipmentDao;

  // 카트로 부터 전달받은 임시 결제 데이터
  public TempPaymentData addOrderConfirmData(String[] productIds, String[] quantities,
      String totalPriceWithoutDelivery, String totalPriceWithDelivery, String deliveryType) {
    TempPaymentData tempPaymentData = new TempPaymentData();
    tempPaymentData.setTotalPrice(Integer.parseInt(totalPriceWithoutDelivery));
    tempPaymentData.setTotalPriceWithDelivery(Integer.parseInt(totalPriceWithDelivery));
    tempPaymentData.setDeliveryType(Integer.parseInt(deliveryType));

    List<ProductCartData> ItemList = new ArrayList<>();

    for (int i = 0; i < productIds.length; i++) {
      ProductCartData item = new ProductCartData(
          productDao.selectByPid(Integer.parseInt(productIds[i])), Integer.parseInt(quantities[i]));
      ItemList.add(item);
    }
    tempPaymentData.setItemList(ItemList);
    return tempPaymentData;
  }

  // 주문데이터 추가
  public void addOrderData(Orders orders) {
    orderDao.insertOrderData(orders);
    for (OrderItem orderItem : orders.getOrderItems()) {
      orderItemDao.insertOrderItemData(orderItem);
    }
    // 배송 요청사항과 기본적인 배송 데이터 생성
    shipmentDao.insertShipmentData(orders.getShipment());
  }

  public List<Orders> getOrderListByUserId(Pager pager, int usid) {
    List<Orders> ordersList = orderDao.selectAllOrdersByUserId(pager, usid);
    return ordersList;
  }

  public int getTotalSalesAmount() {
    int totalSalesAmount = 0;
    if (orderDao.getTotalSalesAmount() != null)
      totalSalesAmount = orderDao.getTotalSalesAmount();
    return totalSalesAmount;
  }

  public int getTotalOrderRows() {
    int totalRows = orderDao.getTotalRows();
    return totalRows;
  }

  public List<Orders> getAllOrderList(Pager pager) {
    List<Orders> orderList = orderDao.selectByPage(pager);
    return orderList;
  }

  public void updateStatusByOrderId(Orders order) {
    orderDao.updateStatusByOrderId(order);

  }

  public Orders getOrderListByOrderIdAndUserId(int orderId, int ouserid) {
    Orders orderData = orderDao.selectOrdersByOrderIdAndUserId(orderId, ouserid);
    return orderData;
  }

  public int getTotalOrderRowsById(int usid) {
    int totalOrderRows = orderDao.totalOrderRowsByUserId(usid);
    return totalOrderRows;
  }
}
