package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Branch;

@Mapper
public interface BranchDao {

	public Branch selectByLocation(String blocation);

/*	public List<Branch> selectBranchAll();*/

}