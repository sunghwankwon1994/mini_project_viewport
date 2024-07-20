  package com.mycompany.viewport_mini_web.dto;
  
  import java.util.Date;
  import java.util.List;
  import lombok.Data;
  
  @Data
  public class Orders {
    private int oid;
    private Date odate;
    private String ophone;
    private String oname;
    private int ouserid;
    private String oaddress;
    private String oaddressdetail;
    private String opostcode;
    private int ototalprice;
    private String opaymethod;
    private String ostatus;
    
    private List<OrderItem> orderItems;
    private Shipment shipment;
  }
