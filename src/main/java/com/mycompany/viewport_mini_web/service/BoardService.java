package com.mycompany.viewport_mini_web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.NoticeDao;
import com.mycompany.viewport_mini_web.dao.QnaDao;
import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Notice;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Qna;
import com.mycompany.viewport_mini_web.dto.Styles;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
  @Autowired
  QnaDao boardDao;
  @Autowired
  UserDao userDao;
  @Autowired
  NoticeDao noticeDao;  
  @Autowired
  QnaDao qnaDao;    
  
  public void insertNewPost(Qna qna,String uemail) {
    int quserid = userDao.selectByUemail(uemail).getUsid();
    qna.setQuserid(quserid);
    boardDao.insertNewPost(qna);
  }


  public Qna getQna(int qid) {
    Qna qna = boardDao.selectByQid(qid);
    return qna;
  }

  public List<Qna> getQnaByUser(int usid) {
    List<Qna> qnaList = boardDao.findPostsByUserId(usid);
    return qnaList;
  }

  public int getTotalBoardRows() {
    int totalRow = boardDao.count();
    return totalRow;
  }
  
  public int getQnaTotalRows() {
		int totalQnaRows = qnaDao.count();
		return totalQnaRows;
	}
  
  
  public List<Qna> getQnaListByPager(Pager pager) {
    List<Qna> qnaList = qnaDao.selectByPage(pager);
    return qnaList;
  }

public void createNotice(Notice notice) {
	int rowNum = noticeDao.insert(notice);
	log.info("rowNum: " + rowNum + ", nid: " + notice.getNname());
}

public List<Notice> getNoticeListByPager(Pager pager) {
    List<Notice> noticeList = noticeDao.selectByPage(pager);
    return noticeList;
}


public void updateNoticeData(Notice notice) {
	int rowNum = noticeDao.update(notice);
}

public List<Notice> getNoticeList() {
    List<Notice> noticeList = noticeDao.selectNoticeAll();
    return noticeList;
}

public Notice getNotice(int nid) {
    Notice notice = noticeDao.selectByNid(nid);
    return notice;
}

public void removeNotice(int nid) {
    int rowNum = noticeDao.deleteByNid(nid);
}

public int getTotalNoticeRows() {
    int totalRows = noticeDao.count();
    return totalRows;
}

public int getTotalBoardRowsByUserId(int usid) {
  int totalBoardRowsByUserId=boardDao.getTotalBoardRowsByUserId(usid);
  return totalBoardRowsByUserId;
}


public void removeQna(int qid) {
	qnaDao.deleteByQid(qid);
}


public void updateQna(Qna qna) {
	int rowNum = qnaDao.update(qna);	
}

}
