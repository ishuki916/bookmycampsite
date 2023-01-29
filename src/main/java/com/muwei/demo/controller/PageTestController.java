package com.muwei.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageTestController {
	
	

	

	@GetMapping("/index")
	public String gotoIndex(){
		
		return "campsite/00index";
	}
	
	

	@GetMapping("admin/top")
	public String gotoAdmin2(){
		
		return "campsite/adminIndex";
	}

	
	@GetMapping("admin/chart")
	public String gotoChart(){
		
		return "admin_pages/pages/charts";
	}
	
	@GetMapping("/booking1")
	public String gotobookingpage1(){
		
		return "campsite/bookingpage1";
	}
	
	@GetMapping("/booking2")
	public String gotobookingpage2(){
		
		return "campsite/bookingpage2";
	}
	
	@GetMapping("/booking3")
	public String gotobookingpage3(){
		
		return "campsite/bookingpage3";
	}

	@GetMapping("/booking4")
	public String gotobookingpage4(){
		
		return "campsite/bookingpage4";
	}
	
	
//	@GetMapping("/booking2test")
//	public String gotobookinttest(){
//		
//		return "campsite/bookingpage2test";
//	}
}
