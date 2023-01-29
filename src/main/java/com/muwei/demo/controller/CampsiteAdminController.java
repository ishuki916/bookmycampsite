package com.muwei.demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muwei.demo.model.CampingUnit;
import com.muwei.demo.model.Campsite;
import com.muwei.demo.service.MyCampsiteService;

@Controller
public class CampsiteAdminController {

	@Autowired
	private MyCampsiteService mCSer;
	
	//測試用
	@GetMapping("/admin/createUnit/{id}")
	public String createUnitTest(Model m,@PathVariable int id) {
		 Campsite cs =mCSer.findById(id);
		m.addAttribute("cs",cs);

		return "campsite/createUnit";
	}

	@GetMapping("/admin/updatePhoto")
	public String updatePhoto1(Model m) {

		return "campsite/updatePhoto";
	}

	@PostMapping("/updatePhotoPost")
	public String updatePhotoPost(@RequestParam int id, @RequestParam(required = false) MultipartFile fFile1,
			@RequestParam(required = false) List<MultipartFile> fFile2,@RequestParam(required = false) MultipartFile fFile3, HttpServletRequest request, Model m) {

		String usersFolderPath = request.getServletContext().getRealPath("") + "myImage";
		String[] fName = new String[]{ "camp" + id + ".png","camp" + id + "_1.png","camp" + id + "_2.png","camp" + id + "_3.png","camp" + id + "_4.png"};
		try {
			
			if (fFile1 != null) {
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(usersFolderPath + "/" + fName[0]));
				bos.write(fFile1.getBytes());
				bos.close();
			}
			
			
			Map<Integer,BufferedOutputStream> bosList= new HashMap<Integer,BufferedOutputStream>();
			
			for(int i=1;i<fName.length-1;i++) {
				if(fFile2.get(i-1)!=null) {
					bosList.put(i, new BufferedOutputStream(new FileOutputStream(usersFolderPath + "/" + fName[i])));
					
					bosList.get(i).write(fFile2.get(i-1).getBytes());
					bosList.get(i).close();
				}

			}
			
			if (fFile3 != null) {
				BufferedOutputStream bos4 = new BufferedOutputStream(
						new FileOutputStream(usersFolderPath + "/" + fName[4]));
				bos4.write(fFile3.getBytes());
				bos4.close();
			}


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 Campsite cs =mCSer.findById(id);
		m.addAttribute("cs",cs);
		return "campsite/createUnit";
	}

	@GetMapping("/admin/showUnit/{id}")
	public String gotoUnit(@PathVariable int id, Model m) {
		List<CampingUnit> cu = mCSer.selectUnitById(id);
		m.addAttribute("cu", cu);
		return "campsite/showUnit";
	}

	@GetMapping("/admin/showCamp")
	public String gotoShowCamp(Model m) {
		List<Campsite> cslist = mCSer.findAll();
		m.addAttribute("cslist", cslist);
		return "campsite/adminShowAllc";
	}

	@GetMapping("/admin/cCamp")
	public String gotoAdmin() {
		return "campsite/createCampsite";
	}

	@GetMapping("/admin/uCamp/{id}")
	public String updateCamp1(@PathVariable int id, Model m) {
		Campsite cs = mCSer.findById(id);
		m.addAttribute("cs", cs);
		return "campsite/updateCampsite";
	}

	@PostMapping("uCamp")
	public String updateCamp2(@ModelAttribute Campsite cs, Model m) {
		mCSer.insertAndUpdate(cs);
		return "redirect:admin/showCamp";
	}

	@PostMapping("dCamp")
	public String deleteCamp(@RequestParam int id,HttpServletRequest request, Model m) {
		mCSer.deleteById(id);
		//刪除該露營地的照片（放在本機位置），前6個是範例不想刪除
		if(id>6) {
			String[] fName = new String[]{ "camp" + id + ".png","camp" + id + "_1.png","camp" + id + "_2.png","camp" + id + "_3.png","camp" + id + "_4.png"};
			String fPath = request.getServletContext().getRealPath("") + "myImage/";
		for(int i=0;i<fName.length;i++) {
			File fl =new File(fPath+fName[i]);
			if(fl.exists()) {
			fl.delete();
			}
		}
			
			
			
		}
		
		
		return "redirect:admin/showCamp";
		
	}

	@GetMapping("/admin/cUnit")
	public String createUnit1(Model m) {
		CampingUnit cUnit = new CampingUnit();
		m.addAttribute("cUnit", cUnit);

		return "campsite/testCreateUnit";
	}

	@PostMapping("cUnit")
	public String createUnit2(@ModelAttribute CampingUnit cUnit) {
		mCSer.insertAndUpdateUnit(cUnit);
		return "campsite/adminIndex";
	}

	@PostMapping("iCamp")
	public String insertCamp(@RequestParam String campsiteName, @RequestParam String destination,
			@RequestParam String campsiteAddress, @RequestParam String traffic, @RequestParam String introduction,
			@RequestParam(required = false) String taIntro, @RequestParam(defaultValue = "0") Integer pricePerNightsTA,
			@RequestParam(defaultValue = "0") Integer tentAreaAmount, @RequestParam(required = false) String caIntro,
			@RequestParam(defaultValue = "0") Integer pricePerNightsCA,
			@RequestParam(defaultValue = "0") Integer campervanAreaAmount, @RequestParam String toilet,
			@RequestParam String showerRoom, @RequestParam String garbage, @RequestParam String wifi,
			@RequestParam String Manager, @RequestParam String charge, @RequestParam String refrigerator,
			@RequestParam String kitchenSink, @RequestParam String rentBike, @RequestParam String washer,
			@RequestParam String cafeBar, @RequestParam String withPets, Model m, RedirectAttributes r) {
		Campsite cs = new Campsite(campsiteName, destination, campsiteAddress, traffic, introduction, caIntro, taIntro,
				pricePerNightsCA, pricePerNightsTA, campervanAreaAmount, tentAreaAmount, toilet, showerRoom, garbage,
				wifi, Manager, charge, refrigerator, kitchenSink, rentBike, washer, cafeBar, withPets);
		mCSer.insertAndUpdate(cs);
		r.addFlashAttribute("id", mCSer.selectLatestId());

		return "redirect:admin/updatePhoto";
	}

}
