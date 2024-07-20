package com.mycompany.viewport_mini_web.service;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.ShipmentDao;
import com.mycompany.viewport_mini_web.dto.Shipment;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShipmentService {
  @Autowired
  ShipmentDao shipmentDao;
  //배송 데이터 생성 메소드
  public void createShipment(Shipment shipment) {
    String shipType = shipment.getStype();
    if(shipType.equals("5000")) {
      shipType = "StandardShip";
    } else {
      shipType="ExpressShip";
    }
    //배송 번호 임의 생성
    String sshipmentnum = new Date().getTime()+shipType;
   
    shipment.setSshipmentnum(sshipmentnum);
    //배송 정보 업데이트
    shipmentDao.updateShipmentByOrderId(shipment);
  }
  //주문 번호로 배송 데이터 가져오기 
  public Shipment getShipmentDataByOrderId(int oid) {
    Shipment shipment = shipmentDao.getShipmentDataByOrderId(oid);
    return shipment;
  }
  
}
