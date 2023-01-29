package com.muwei.demo.camp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageTestController {

	//前台首頁
	@GetMapping("/index")
	public String gotoIndex(){
		
		return "campsite/00index";
	}
	
	
    //後台首頁
	@GetMapping("admin/top")
	public String gotoAdmin2(){
		
		return "campsite/adminIndex";
	}

	
}
