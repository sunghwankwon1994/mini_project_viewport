package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Qna;
import com.mycompany.viewport_mini_web.dto.Users;

@Mapper
public interface QnaDao {

  public void insertNewPost(Qna qna);

  public Qna selectByQid(int qid);

  public List<Qna> findPostsByUserId(int quserid);

  public int count();

  public List<Qna> selectByPage(Pager pager);

  public int getTotalBoardRowsByUserId(int usid);

public void deleteByQid(int qid);

public int update(Qna qna);

}
