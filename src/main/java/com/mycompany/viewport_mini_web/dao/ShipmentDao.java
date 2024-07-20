package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Orders;
import com.mycompany.viewport_mini_web.dto.Shipment;

@Mapper
public interface ShipmentDao {

  void insertShipmentData(Shipment shipment);

  void updateShipmentByOrderId(Shipment shipment);

  Shipment getShipmentDataByOrderId(int soid);

}
