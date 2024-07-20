package com.mycompany.viewport_mini_web.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Photos {
  private int ptid;
  private String ptattachoname;
  private String ptattachsname;
  private String ptattachtype;
  private byte[] ptattachdata;
  private int ptpid;
  
  private List<MultipartFile> ptattach;
}
