package com.mycompany.viewport_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Shipment {
  private int sid;
  private String sshipmentnum;
  private Date sdate;
  private String srequest;
  private int suserid;
  private int soid;
  private String stype;
}
