package com.mycompany.viewport_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Styles;

@Mapper
public interface StylesDao {

	public int insert(Styles styles);

	public int count();

	public List<Styles> selectStylesListByPager(Pager pager);

	public Styles selectByStid(int stid);

	public void deleteByStid(int stid);

	public List<Styles> selectStylesListRandomly();

}
