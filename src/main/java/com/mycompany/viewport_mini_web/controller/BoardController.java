package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.viewport_mini_web.dto.Notice;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Qna;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.BoardService;
import com.mycompany.viewport_mini_web.service.PagerService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
  @Autowired
  BoardService boardService;
  @Autowired
  UserService userService;
  @Autowired
  private PagerService pagerService;

  @Secured("ROLE_USER")
  @GetMapping("/writeQNA")
  public String CreateNewBoard() {
    return "board/writeQNA";
  }

  @Secured("ROLE_USER")
  @GetMapping("/editQna")
  public String editQNA(int qid, Model model) {
    Qna qna = boardService.getQna(qid);
    log.info(qna.toString());
    model.addAttribute("qna", qna);
    return "board/editQna";
  }

  @GetMapping("/qnaList")
  public String QnaList(@RequestParam(required = false, defaultValue="1") String pageNo, Model model,
      HttpSession session) {
    int totalRows = boardService.getQnaTotalRows(); // 전체 수를 가져옵니다.
    Pager pager = pagerService.preparePager(session, pageNo, totalRows, 12, 5, "qnaListPager");
    List<Qna> qnaList = boardService.getQnaListByPager(pager);
    for (Qna qna : qnaList) {
      qna.setQuemail(userService.getUserByUserId(qna.getQuserid()));
    }

    model.addAttribute("pager", pager);
    model.addAttribute("qnaList", qnaList);
    return "board/qnaList";
  }

  @GetMapping("/FAQ")
  public String FAQ() {
    return "board/FAQ";
  }

  @GetMapping("/qna")
  public String Qna() {
    return "board/qna";
  }

  @Secured("ROLE_USER")
  @PostMapping("/writeQNA")
  @ResponseBody
  public String writeQNA(Qna qna, Authentication authentication) throws IOException {
    log.info("실행");
    String uemail = authentication.getName();
    qna.setQstatus("처리 중");
    qna.setQattachoname(qna.getQattach().getOriginalFilename());
    qna.setQattachtype(qna.getQattach().getContentType());
    qna.setQattachdata(qna.getQattach().getBytes());
    qna.setQattachsname(
        UUID.randomUUID().toString() + "-" + qna.getQattach().getOriginalFilename());
    boardService.insertNewPost(qna, uemail);
    return "/viewport_mini_web/board/qnaList";
  }

  @Secured("ROLE_USER")
  @PostMapping("/editQna")
  @ResponseBody
  public String editQna(Qna qna) throws IOException {
    log.info("editQna 실행");
    log.info(qna.toString());

    // 첨부 파일이 있는지 여부 조사
    if (qna.getQattach() != null && !qna.getQattach().isEmpty()) {
      qna.setQattachoname(qna.getQattach().getOriginalFilename());
      qna.setQattachtype(qna.getQattach().getContentType());
      byte[] qnaData = qna.getQattach().getBytes();
      log.info("" + qna.getQattach().getContentType());

      qna.setQattachsname(
          UUID.randomUUID().toString() + "-" + qna.getQattach().getOriginalFilename());
      qna.setQattachdata(qnaData);
    }
    boardService.updateQna(qna);


    return "/viewport_mini_web/board/qnaList";
  }

  @GetMapping("/qnaDetail")
  public String qnaDetail(int qid, Authentication authentication, Model model,
      HttpServletResponse response, RedirectAttributes redirectAttributes) throws IOException {
    log.info("실행");
    if (authentication == null) {
      redirectAttributes.addFlashAttribute("errorMessage", "로그인을 필요합니다.");
      return "redirect:/loginForm";
    }

    Qna qna = boardService.getQna(qid);
    if (qna == null) {
      redirectAttributes.addFlashAttribute("errorMessage", "해당 게시물을 찾을 수 없습니다.");
      return "redirect:/board/qnaList";
    }

    String quemail = userService.getUserByUserId(qna.getQuserid());
    Users user = userService.getUser(authentication.getName());
    if (user.getUrole().equals("ROLE_ADMIN")) {
      qna.setQuemail(quemail);
      model.addAttribute("user", user);
      model.addAttribute("qna", qna);
      return "board/qnaDetail";
    }
    log.info(quemail);
    if (quemail == null || !quemail.equals(authentication.getName())) {
      redirectAttributes.addFlashAttribute("errorMessage", "권한이 없습니다.");
      return "redirect:/error403";
    }

    qna.setQuemail(quemail);
    model.addAttribute("qna", qna);
    return "board/qnaDetail";
  }

  @GetMapping("/attachQnaDownload")
  public void attachDownload(int qid, HttpServletResponse response) throws Exception {
    // 다운로드할 데이터를 준비
    Qna qna = boardService.getQna(qid);
    byte[] data = qna.getQattachdata();
    // 응답 헤더 구성
    response.setContentType(qna.getQattachtype());
    String fileName = new String(qna.getQattachoname().getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
    // 응답 본문에 파일 데이터 출력
    OutputStream os = response.getOutputStream();
    os.write(data);
    os.flush();
    os.close();
  }

  @PostMapping("/deleteQna")
  public String deleteQna(int qid) {
    log.info("deleteQna 실행");
    boardService.removeQna(qid);
    return "redirect:/board/qnaList";
  }

  @GetMapping("/noticeList")
  public String NoticeList(@RequestParam(required = false) String pageNo, Model model,
      HttpSession session) {
    int totalRows = boardService.getTotalNoticeRows(); // 전체 수를 가져옵니다.
    Pager pager = pagerService.preparePager(session, pageNo, totalRows, 12, 5, "noticeListPager");
    List<Notice> noticeList = boardService.getNoticeListByPager(pager);

    model.addAttribute("pager", pager);
    model.addAttribute("noticeList", noticeList);
    return "board/noticeList";
  }

  @GetMapping("noticeDetail")
  public String NoticeDetail(int nid, Model model) {
    log.info("noticeDetail 실행");
    Notice notice = boardService.getNotice(nid);
    model.addAttribute("notice", notice);

    return "board/noticeDetail";
  }

}
