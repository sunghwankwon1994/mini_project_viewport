package com.mycompany.viewport_mini_web.dto;

import lombok.Data;

@Data
public class SignupForm {
  private String uemail;
  private String upassword;
  private String passwordConfirm;
  private String uname;
  private String uphonenumber;
  private String uaddress;
  private String uaddressdetail;
  private String upostcode;
  private String ussn;
  private Integer ugender;
}
