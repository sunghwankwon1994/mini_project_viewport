package com.mycompany.viewport_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Notice;
import com.mycompany.viewport_mini_web.dto.Pager;

@Mapper
public interface NoticeDao {
	public int insert(Notice notice);
	
	public List<Notice> selectByPage(Pager pager);

	public int update(Notice notice);

	public List<Notice> selectNoticeAll();

	public Notice selectByNid(int nid);

	public int deleteByNid(int nid);

	public int count();

}
