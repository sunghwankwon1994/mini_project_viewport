package com.mycompany.viewport_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.PhotosDao;
import com.mycompany.viewport_mini_web.dao.ProductDao;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Photos;
import com.mycompany.viewport_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
	@Resource
	private ProductDao productDao;

	@Resource
	private PhotosDao photosDao;

	public void createProduct(Product product) {
		int rowNum = productDao.insert(product);
	}

	public void createProductImg(Photos photos) {
		int CurPid = productDao.selectCurrPid();
		log.info("" + CurPid);
		photos.setPtpid(CurPid);
		photosDao.insert(photos);
	}

	public List<Product> getProductList() {
		List<Product> products = productDao.selectProductList();
		return products;
	}
	
	public List<Product> getProductListByPager(Pager pager) {
		List<Product> products = productDao.selectProductListByPager(pager);
		return products;
	}

	public void updateProduct(Product product) {
		int rowNum = productDao.update(product);

	}

	public void updateProductImg(Photos photos) {
		if (photos.getPtattachdata() != null && photos.getPtattachdata().length > 0) {
			int rowNum = photosDao.updateImg(photos);
		}
	}

	public void removeProduct(int pid) {
		photosDao.deleteByPtpid(pid);
		productDao.deleteByPid(pid);

	}

	public List<Integer> getPtids(int ptpid) {
		List<Integer> ptids = photosDao.selectPtidsList(ptpid);
		return ptids;
	}

	public Product getProduct(int pid) {
		Product product = productDao.selectByPid(pid);
		return product;
	}

	public List<Photos> getPhotos(int pid) {
		List<Photos> photos = photosDao.selectByPtpidsList(pid);
		return photos;
	}

	public Product getProductImg(int pid) {
		Product product = productDao.selectProductImg(pid);
		return product;
	}

	public Photos getPhotosByPtid(int ptid) {
		Photos photos = photosDao.selectByPtid(ptid);
		return photos;
	}

	public int getTotalProductRows() {
		int totalRows = productDao.count();
		return totalRows;
	}

	public int getProductTotalRows() {
		int totalProductRows = productDao.count();
		return totalProductRows;
	}
	
	public int getProductTotalRowsByFilter(String category, String price, String date, String shape) {
		int totalProductRows = productDao.countByFilter(category, price, date, shape);
		return totalProductRows;
	}	

	public List<Product> getProductListRandomly() {
		List<Product> products = productDao.selectProductListRandomly();
		return products;
	}

	public List<Product> getSameModels(String pname) {
		List<Product> sameModels = productDao.selectSameModelByPname(pname);
		return sameModels;
	}
	
	public List<Product> getProductsByFilterAndPager(String category, String price, String date, String shape, Pager pager) {
		List<Product> products = productDao.selectProductListByFilterAndPager(category, price, date, shape, pager);
		return products;
	}



}
