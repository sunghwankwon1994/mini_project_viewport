package com.mycompany.viewport_mini_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;


import com.mycompany.viewport_mini_web.dto.Branch;
import com.mycompany.viewport_mini_web.service.FindStoresService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/findStores")
public class FindStoresController {
	  @Autowired
	  private FindStoresService findStoresService ;

	  @GetMapping("")
	  public String findStores(String blocation, Model model) {
		  Branch branch = findStoresService.selectByLocation(blocation);
		  
		  model.addAttribute("branch", branch);
/*		  log.info(branch.toString());*/
		  
		  
		  if(blocation.equals("대한민국")) {
			  return "findStores/korea";
		  } else if (blocation.equals("홍콩")) {
			  return "findStores/hongkong";
		  } else if (blocation.equals("미국")) {
			  return "findStores/us";
		  } else  {
			  return "findStores/singapore";
		  }
	  }
}  