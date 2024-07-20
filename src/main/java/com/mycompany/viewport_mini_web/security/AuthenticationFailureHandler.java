package com.mycompany.viewport_mini_web.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import lombok.extern.slf4j.Slf4j;


@Slf4j
public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
      AuthenticationException exception) throws IOException, ServletException {
      log.info("실행");
      
      //로그인 실패 후 리다이렉트로 이동할 경로
      setDefaultFailureUrl("/loginForm");
      
      //기타 기본 설정을 적용하기 위해 상위 메소드 호출
      super.onAuthenticationFailure(request, response, exception);
      
  }
}
