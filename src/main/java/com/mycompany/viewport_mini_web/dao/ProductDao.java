package com.mycompany.viewport_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Product;

@Mapper
public interface ProductDao { // 이름 직관적으로 + 나중에 수정
	public int insert(Product product);

	public int selectCurrPid();

	public List<Product> selectProductList();

	public List<Product> selectProductListByPager(Pager pager);	
	
	// 상품 리스트 출력
	public Product selectByPid(int pid);
	public Product selectProductImg(int pid);
	
	public int update(Product product);
	
	public int deleteByPid(int pid);

	public int count();
	
	public int countByFilter(@Param("category") String category, @Param("price") String price, @Param("date") String date, @Param("shape") String shape);	

	public List<Product> selectProductListRandomly();

	public List<Product> selectSameModelByPname(String pname);

	public List<Product> selectProductListByFilterAndPager(@Param("category") String category, @Param("price") String price, @Param("date") String date, @Param("shape") String shape, @Param("pager") Pager pager);

}
