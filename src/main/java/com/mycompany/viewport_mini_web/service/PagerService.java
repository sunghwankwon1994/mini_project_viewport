package com.mycompany.viewport_mini_web.service;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dto.Pager;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PagerService {

  public Pager preparePager(HttpSession session, String pageNo, int totalRows, int rowsPerPage,
      int pagesPerGroup, String sessionAttributeKey) {
    
    Pager pager = (Pager) session.getAttribute(sessionAttributeKey);
    if (pager == null) {
      pager = new Pager(rowsPerPage, pagesPerGroup, totalRows, 1); // 페이지 번호를 1로 초기화
      session.setAttribute(sessionAttributeKey, pager);   
      return pager;// 세션에 페이저 객체 저장
    }
  
    // 페이지 번호가 요청되었을 때 설정
    if (pageNo != null && !pageNo.isEmpty()) {
      pager = new Pager(rowsPerPage, pagesPerGroup, totalRows,Integer.parseInt(pageNo));
      int pageNumber = Integer.parseInt(pageNo);
      if (pageNumber > 0 && pageNumber <= pager.getTotalPageNo()) {
        pager.setPageNo(pageNumber);
      }
    }
    
    return pager;
  }
}
