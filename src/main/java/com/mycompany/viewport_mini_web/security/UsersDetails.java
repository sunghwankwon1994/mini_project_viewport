package com.mycompany.viewport_mini_web.security;

import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.mycompany.viewport_mini_web.dto.Users;

public class UsersDetails extends User {

  private Users member;

  public UsersDetails(Users member, List<GrantedAuthority> authorities) {
    super(member.getUemail(), member.getUpassword(), member.isUenabled(), true, true, true,
        authorities);
    this.member = member;
  }
  
  public Users getMember() {
    return member;
  }

}
