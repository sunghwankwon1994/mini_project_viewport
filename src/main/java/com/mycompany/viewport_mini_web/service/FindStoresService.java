package com.mycompany.viewport_mini_web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.BranchDao;
import com.mycompany.viewport_mini_web.dto.Branch;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FindStoresService {
  @Autowired
  private  BranchDao branchDao;
  
/*  public List<Branch> getBranch() {
	  log.info("실행");
	  List<Branch> branches = branchDao.selectBranchAll();
	return branches;
  }*/

public Branch selectByLocation(String blocation) {
	Branch branches= branchDao.selectByLocation(blocation);
	return branches;
}


/*public Branch getByLocation(int bnum) {
	  Branch branches = branchDao.selectByLocation(bnum);
	return branches;
}*/
  
/*  public int getBnum () {
    int bnum = branchDao.count();
    return bnum;
  }
  
  public String getBname() {
	    String bname = branchDao.count();
	    return bnum;
	  }
  */


  
}