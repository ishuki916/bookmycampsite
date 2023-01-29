package com.muwei.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


import com.muwei.demo.service.MyCampsiteService;
import com.muwei.demo.users.model.Users;

@RestController
public class CheckoutRestController {
	
	@Autowired
	private MyCampsiteService mCSer;
	
	
	
	@GetMapping("/getCartNum")
	public String getCartNum(HttpServletRequest r) {
		
		int cartNum=0;
		if(r.getSession().getAttribute("loginUser")!=null) {
		Users u = (Users) r.getSession().getAttribute("loginUser");
		int userid = u.getId();
		
		if(mCSer.getBookCampsiteListBeforeCheckout(userid)!=null) {
			cartNum+= mCSer.getBookCampsiteListBeforeCheckout(userid).size();
			System.out.println("this is inside BookCampsiteList cartNum="+cartNum);
		}
		
		
		}
		
		
		
		return  Integer.toString(cartNum);
		
	}

}
