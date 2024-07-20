package com.mycompany.viewport_mini_web.dto;

import java.util.Date;
import lombok.Data;

@Data
public class Users {
  private int usid;
  private String upassword;
  private String uname;
  private String uemail;
  private int ugender;
  private String uphonenumber;
  private String uaddress;
  private String uaddressdetail;
  private String urole;
  private Date udate;
  private String ussn;
  private String upostcode;
  private boolean uenabled;
  private boolean isdeleted;
}
