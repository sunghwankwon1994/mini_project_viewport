package com.mycompany.viewport_mini_web.dto;

import java.util.Date;
import lombok.Data;

@Data
public class OrderItem {
  private int oiid;
  private int oiqty;
  private int oiprice;
  private Date oidate;
  private int oipid;
  private int oioid;
  
  private String oipname;
}
