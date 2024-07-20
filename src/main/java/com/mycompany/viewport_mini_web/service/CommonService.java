package com.mycompany.viewport_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.ProductDao;
import com.mycompany.viewport_mini_web.dao.UserDao;

@Service
public class CommonService {
	@Autowired
	private UserDao userDao;

	public int getUserTotalRows() {
		int totalRows = userDao.count();
		return totalRows;
	}

}
