package com.mycompany.viewport_mini_web.dto;


import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SignupFormValidator implements Validator {
  @Override
  public boolean supports(Class<?> clazz) {
    log.info("회원가입 supports 실행");
    return SignupForm.class.isAssignableFrom(clazz);
  }

  @Override
  public void validate(Object target, Errors errors) {
    SignupForm signupForm = (SignupForm) target;
    
    //이메일 검사
    String uemail = signupForm.getUemail();
    String emailPattern = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
    if(uemail == null || uemail.equals("")) {
      errors.rejectValue("uemail", null,"이메일은 필수 입력");
    } else if(!Pattern.matches(emailPattern, uemail)) {
      errors.rejectValue("uemail", null,"올바른 이메일 형식을 입력해주세요");      
    }
    
    //이름 검사
    String uname = signupForm.getUname();
    if(uname == null || uname.equals("")) {
      errors.rejectValue("uname", null,"이름은 필수 입력");
    } else if(uname.length()<2 || uname.length()>16) {
      errors.rejectValue("uname", null,"이름은 최소 2자이상 16자리 이하로 입력해야합니다.");      
    }
    
    //휴대폰 번호 검사
    String uphoneNum = signupForm.getUphonenumber();
    String phonePattern = "^01(?:0|1|[6-9])\\d{7,8}$";
    if(uphoneNum == null || uphoneNum.equals("")) {
      errors.rejectValue("uphoneNum", null,"휴대폰 번호는 필수 입력");
    } else if(!Pattern.matches(phonePattern, uphoneNum)) {
      errors.rejectValue("uphoneNum", null,"올바른 휴대폰 번호 형식을 입력해주세요");      
    }
    
    // 비밀번호 검사
    String upassword = signupForm.getUpassword();
    String pattern = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}";
    if(upassword == null || upassword.equals("")) {
      errors.rejectValue("upassword", null,"비밀번호는 필수 입력");
    } else if(upassword.length()<8 || upassword.length()>15) {
      errors.rejectValue("upassword", null,"비밀번호는 6자 이상 12자리 이하로 입력해야 합니다.");      
    } else if(!Pattern.matches(pattern, upassword)) {
      errors.rejectValue("upassword", null,"비밀번호는 알파벳 대소문자 및 숫자를 포함해야함");      
    }
    String upasswordComfirm = signupForm.getPasswordConfirm();
  
    if(upasswordComfirm == null || upasswordComfirm.equals("") ) {
      errors.rejectValue("passwordConfirm", null,"비밀번호 확인 칸은 필수 입력입니다.");
    } else if(!upasswordComfirm.equals(upassword)) {
      errors.rejectValue("passwordConfirm", null,"비밀번호가 일치하지 않습니다.");      
    }
    String uaddress = signupForm.getUaddress();
    if (uaddress == null || uaddress.isEmpty()) {
        errors.rejectValue("uaddress", null, "주소는 필수 입력입니다.");
    }
  }
}

