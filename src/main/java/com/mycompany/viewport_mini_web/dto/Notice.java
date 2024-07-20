package com.mycompany.viewport_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
  private int nid;
  private String ncategory;  
  private String nname;
  private String ninfo;
  private Date ndate;

}
