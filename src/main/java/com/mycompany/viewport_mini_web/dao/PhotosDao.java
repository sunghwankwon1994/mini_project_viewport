package com.mycompany.viewport_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Photos;


@Mapper
public interface PhotosDao {
	public int insert(Photos photos);

	public int deleteByPtpid(int ptpid);

	public int updateImg(Photos photos);

	public List<Integer> selectPtidsList(int ptpid);

	public List<Photos> selectByPtpidsList(int ptpid);

	public Photos selectByPtid(int ptid);

}
