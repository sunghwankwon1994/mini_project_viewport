package com.mycompany.viewport_mini_web.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
  private int pid;
  private String pname;
  private int pprice;
  private String pinfo;
  private String pdetail;
  private String pcategory;
  private String pattachoname;
  private String pattachsname;
  private String pattachtype;
  private byte[] pattachdata;
  private String pshape;
  private Date pdate;
  private String pmodelnum;
  
  private MultipartFile pattach;
}
