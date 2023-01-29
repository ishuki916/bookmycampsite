package com.muwei.demo.camp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.muwei.demo.camp.model.BookCampsiteListDTO;
import com.muwei.demo.camp.model.BookingCampsite;
import com.muwei.demo.camp.model.CampingUnit;
import com.muwei.demo.camp.model.Campsite;
import com.muwei.demo.camp.service.MyCampsiteService;
import com.muwei.demo.users.model.Users;

@Controller
public class BookingController {

	@Autowired
	private MyCampsiteService mCSer;
	

	@GetMapping("/bookingCampsite")
	public String booking(@RequestParam int id,@RequestParam String unitType, Model m, HttpServletRequest r) {

		Campsite cs = mCSer.findById(id);
		m.addAttribute("id",id);
		m.addAttribute("cs", cs);
		m.addAttribute("unitType", unitType);
		if (r.getSession().getAttribute("loginUser") == null) {
			return "campsite/loginToBook";
		}

		return "campsite/bookingpage1";
	}

	@PostMapping("/booking2")
	public String booking2(@RequestParam int id, @RequestParam String tripstart, @RequestParam String myarea, Model m)
			throws ParseException {

		// @RequestParam Integer myday

		Date date = new Date();
		date = new SimpleDateFormat("yyyy-MM-dd").parse(tripstart);
       //那塊露營地的CA區域或TA區域原本有哪些區塊 找出第一個unitId和最後一個unitId
		List<CampingUnit> culist = mCSer.selectUnitByTypeAndId(id, myarea);
	
	
		int firstId = culist.get(0).getUnitId();
		int lastId = culist.get(culist.size() - 1).getUnitId();
		System.out.println("lastId ="+lastId);
		// 找那一天裡有哪些區塊被預訂了
		List<BookingCampsite> booked_culist = mCSer.selectBookingByUnitId(date, firstId, lastId);
		// 原本的區塊跟預定區塊作比較，找出沒被預訂的區塊
	
		System.out.println("culist.size()="+culist.size());

		if (booked_culist != null && booked_culist.size()>0) {
			for (int i = 0; i < culist.size(); i++) {
				for (BookingCampsite b : booked_culist) {
					if ((int)culist.get(i).getUnitId() == (int)b.getUnitId()) {
						culist.remove(i);
						i=i-1;
						break;
					}
				}
			}
		}


		m.addAttribute("culist", culist);
		m.addAttribute("cs", mCSer.findById(id) );
		m.addAttribute("date",tripstart);
		m.addAttribute("unitType", myarea);


		return "campsite/bookingpage2test";
	}

	@PostMapping("/booking3")
	public String booking3(Model m, @RequestParam String mydate,@RequestParam Integer campsiteId, @RequestParam String[] unitIdList, HttpServletRequest r) throws ParseException {

		ArrayList<BookingCampsite> bclist = new ArrayList<BookingCampsite>();
		Users u = (Users) r.getSession().getAttribute("loginUser");
		int userid = u.getId();
		
		Date date = new Date();
		date = new SimpleDateFormat("yyyy-MM-dd").parse(mydate);
		
		String paidStatus = "N";
		
//丟unitId，paidStatus，userid，date
		for (int i = 0; i < unitIdList.length; i++) {
			Date d = new Date();
			mCSer.insertAndUpdateBooking(d,Integer.parseInt(unitIdList[i]),paidStatus,userid, date);
		}

		return "redirect:book31/" + campsiteId;
	}

	@GetMapping("/book31/{campsiteId}")
	public String test1(@PathVariable int campsiteId, Model m,HttpServletRequest r) {
	Users u = (Users) r.getSession().getAttribute("loginUser");
	Integer userid = u.getId();
		List<BookCampsiteListDTO> newbclist = mCSer.getBookCampsiteListBeforeCheckout(userid);
//
		m.addAttribute("newbclist", newbclist);
		return "campsite/bookingpage3";
//
	}

}
