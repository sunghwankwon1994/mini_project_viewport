package com.mycompany.viewport_mini_web.security;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Users;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UsersDetailsService implements UserDetailsService {

  @Autowired
  private UserDao userDao;

  @Override // username은 PK값의 userID를 의미한다고 생각하면 됨
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    log.info("실행");
    Users member = userDao.selectByUemail(username);
    if (member == null) {
      throw new UsernameNotFoundException("아이디가 존재하지 않습니다");
    }
    
    //삭제를 한 유저인 경우 로그인 불가능
    if(member.isIsdeleted()) {
      throw new UsernameNotFoundException("삭제된 계정입니다.");
    }

    List<GrantedAuthority> authorities = new ArrayList<>();
    authorities.add(new SimpleGrantedAuthority(member.getUrole()));

    UsersDetails userDetails = new UsersDetails(member, authorities);
    return userDetails;
  }
}
