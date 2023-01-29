package com.muwei.demo.paypal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.muwei.demo.camp.model.BookCampsiteListDTO;
import com.muwei.demo.camp.service.MyCampsiteService;
import com.muwei.demo.users.model.Users;



@Controller
public class ShoppingCartForPaypalController {


	
	@Autowired
	private MyCampsiteService mCSer;

	
	
	@GetMapping("/showBrandNewCart")
	public String showBrandNewCart(Model m,HttpServletRequest r) {
		
		Users u = (Users) r.getSession().getAttribute("loginUser");
		
		Integer userid = u.getId();
	
		List<BookCampsiteListDTO> newbclist = mCSer.getBookCampsiteListBeforeCheckout(userid);

		m.addAttribute("newbclist", newbclist);
		

		
		return "campsite/shoppingCart";

	}
	
	
	
	

}
