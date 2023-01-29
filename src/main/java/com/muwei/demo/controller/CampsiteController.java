package com.muwei.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.muwei.demo.model.Campsite;
import com.muwei.demo.service.MyCampsiteService;

@Controller
public class CampsiteController {

	@Autowired
	private MyCampsiteService mCSer;
	
	

	@GetMapping("/showSingle/{id}")
	public String showSingle(@PathVariable int id, Model m) {
		Campsite csingle = mCSer.findById(id);

		m.addAttribute("csingle", csingle);
		return "campsite/campsiteSingle";
	}
	
	
	@GetMapping("/selectAll")
	public String findAllCamp(Model m) {
		List<Campsite> cslist = mCSer.findAll();

		m.addAttribute("cslist", cslist);
		List<String> destinationList = mCSer.getAllDestination();
		m.addAttribute("destinationList", destinationList);
		return "campsite/selectCampsites";
	}

	@PostMapping("selectByCheck")
	public String selectByCheck(@RequestParam String destination,
			@RequestParam(name = "campsitePro") String[] campsitePro, Model m) {
		List<Campsite> cslist;

		if (campsitePro.length == 1 && destination != "") {
			cslist = mCSer.selectByDestination(destination);
		} else {
			cslist = mCSer.selectByDesitinationAndCheck(destination, campsitePro);
		}
		m.addAttribute("cslist", cslist);
		//放置所有地點
		List<String> destinationList = mCSer.getAllDestination();
		m.addAttribute("destinationList", destinationList);
		
		//放置選取的地點
		m.addAttribute("dchecked", destination);

		String[] items = new String[] { "campervan", "toilet", "showerRoom", "garbage", "wifi", "Manager", "charge",
				"refrigerator", "kitchenSink", "rentBike", "washer", "cafeBar", "withPets" };
		String[] showitems = new String[] { "campervan露營車營地", "toilet廁所", "showerRoom淋浴間", "garbage垃圾集中處", "wifi網路", "Manager全日管理員", "charge供電",
				"refrigerator冰箱", "kitchenSink水槽", "rentBike腳踏車租借", "washer洗衣機", "cafeBar咖啡餐飲", "withPets可攜寵物" };
		String[] cpchecked= new String[13];
		ArrayList<String> cpcheckedshort = new ArrayList<String>();
		for (int i = 0; i < 13; i++) {
			if (Arrays.asList(campsitePro).contains(items[i])) {
				cpchecked[i]=items[i];
				cpcheckedshort.add(showitems[i]);
			}else {
				cpchecked[i]="";
			}
		}
		//放置顯示的標籤
		m.addAttribute("cpcheckedshort", cpcheckedshort);
		//讓jsp判斷哪一項是被勾選的
		m.addAttribute("cpchecked", cpchecked);

		return "campsite/selectCampsites";
	}

}
