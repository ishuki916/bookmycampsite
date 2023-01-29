package com.muwei.demo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.muwei.demo.model.BookingCampsite;
import com.muwei.demo.model.CampingUnit;
import com.muwei.demo.model.Campsite;
import com.muwei.demo.model.ICheckSpace;
import com.muwei.demo.service.MyCampsiteService;

@RestController
public class CampsiteRestController {
	@Autowired
	private MyCampsiteService mCSer;
	
	
	
	//測試
//	@PostMapping("/testgetBookCampsiteListBeforeCheckout")
//	public String getBookCampsiteListBeforeCheckout(@RequestParam Integer userId) {
//		List<BookCampsiteListDTO> test = mCSer.getBookCampsiteListBeforeCheckout(userId);
//	return 	test.get(0).getCampsiteName();
//		
//	}
	
	//測試booking2的區塊(已預訂的)
	@PostMapping("/showBookedUnitForBook2")
	public String showBookedUnitForBook2(@RequestParam String id, @RequestParam String tripstart, @RequestParam String myarea, Model m)
			throws ParseException {
		Date date = new Date();
		date = new SimpleDateFormat("yyyy-MM-dd").parse(tripstart);
       //那塊露營地的CA區域或TA區域原本有哪些區塊 找出第一個unitId和最後一個unitId
		List<CampingUnit> culist = mCSer.selectUnitByTypeAndId(Integer.valueOf(id), myarea);
	
		int firstId = culist.get(0).getUnitId();
		int lastId = culist.get(culist.size() - 1).getUnitId();
		String xPosyPos="";
		// 找那一天裡有哪些區塊被預訂了
		List<BookingCampsite> booked_culist = mCSer.selectBookingByUnitId(date, firstId, lastId);
		// 原本的區塊跟預定區塊作比較，找出沒被預訂的區塊

		if (booked_culist != null&&booked_culist.size()>0) {
			for (int i = 0; i < culist.size(); i++) {
				for (BookingCampsite b : booked_culist) {
					if ((int)culist.get(i).getUnitId() == (int)b.getUnitId()) {
						xPosyPos += culist.get(i).getUnitName()+ ",";
						xPosyPos += culist.get(i).getxPos() + ",";
						xPosyPos += culist.get(i).getyPos() + ",";
						break;
					}
				}
			}
		}
		
		if(xPosyPos.endsWith(",")) {
			xPosyPos=xPosyPos.substring(0, xPosyPos.length()-1);
		}


		return xPosyPos;
	}
	
	
	//測試booking2的顯示區塊（沒人預定的）
	@PostMapping("/showUnitAVLForBook2")
	public String showUnitAVLForBook2(@RequestParam int id, @RequestParam String tripstart, @RequestParam String myarea, Model m)
			throws ParseException {

		Date date = new Date();
		date = new SimpleDateFormat("yyyy-MM-dd").parse(tripstart);
       //那塊露營地的CA區域或TA區域原本有哪些區塊 找出第一個unitId和最後一個unitId
		List<CampingUnit> culist = mCSer.selectUnitByTypeAndId(id, myarea);
	
		int firstId = culist.get(0).getUnitId();
		int lastId = culist.get(culist.size() - 1).getUnitId();
		// 找那一天裡有哪些區塊被預訂了
		List<BookingCampsite> booked_culist = mCSer.selectBookingByUnitId(date, firstId, lastId);
		// 原本的區塊跟預定區塊作比較，找出沒被預訂的區塊

		if (booked_culist != null&&booked_culist.size()>0) {
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
		String xPosyPos="";
		for(CampingUnit cu:culist) {
			xPosyPos += cu.getUnitName()+ ",";
			xPosyPos += cu.getxPos() + ",";
			xPosyPos += cu.getyPos() + ",";
	
		}

		if(xPosyPos.endsWith(",")) {
			xPosyPos = xPosyPos.substring(0, xPosyPos.length()-1);
		}

		return xPosyPos;
	}
	
	
	
	//區塊圖那頁丟TA的xPos和yPos進來，再給CampingUnit的Repository新增
	@PostMapping("/insertTaXYPos")
	public void insertTaXYPos(@RequestParam String id,@RequestParam String[] taXpos,@RequestParam String[] taYpos){
		
		for(int i=0;i<taXpos.length-1;i++) {
		mCSer.insertCampingUnit("TA", "T"+(i+1), Integer.valueOf(id), Double.valueOf(taXpos[i]), Double.valueOf(taYpos[i]));
		}
	}
	
	
	//區塊圖那頁丟CA的xPos和yPos進來，再給CampingUnit的Repository新增
	@PostMapping("/insertCaXYPos")
	public void insertCaXYPos(@RequestParam String id,@RequestParam String[] caXpos,@RequestParam String[] caYpos){
		
		for(int i=0;i<caXpos.length-1;i++) {
		mCSer.insertCampingUnit("CA", "C"+(i+1), Integer.valueOf(id), Double.valueOf(caXpos[i]), Double.valueOf(caYpos[i]));
		}
	}
	
	
	@PostMapping("/deleteOneBookingById")
	public void deleteOneBookingById(@RequestParam int orderId){
		mCSer.deleteOneBookingById(orderId);
	}

	@PostMapping("/checkspace")
	public List<BookingCampsite> checkspace(@RequestParam String startday, @RequestParam String dayNum,
			@RequestParam String unitType) throws ParseException {

		Date sdate = new Date();
		sdate = new SimpleDateFormat("yyyy-MM-dd").parse(startday);
		Date edate = new Date(sdate.getTime() + (1000 * 60 * 60 * 24) * (Integer.valueOf(dayNum) - 1));

		if (Integer.valueOf(dayNum) == 1) {

			return mCSer.selectBooking(sdate, sdate, unitType);
		}

		return mCSer.selectBooking(sdate, edate, unitType);

		// 現在拿到的是那幾天有被訂下的露營地區塊，
	}

	// 如果選一天&已選露營地 引數是單一日期/區域名稱/露營地id 可以算出某露營地某天的訂位數
	@PostMapping("/checkspace2")
	public String checkspace2(Model m, @RequestParam String startday, @RequestParam String unitType,
			@RequestParam Integer campsiteId) throws ParseException {
		Date date = new Date();
		date = new SimpleDateFormat("yyyy-MM-dd").parse(startday);

		Campsite c = mCSer.findById(campsiteId);
		Integer taOriginSpace = c.getTentAreaAmount();
		Integer caOriginSpace = c.getCampervanAreaAmount();
		//找到那一天被訂位的數量
		ICheckSpace ic = mCSer.getCountOnedaywithId(date, unitType, campsiteId);

		//如果沒有被訂位，回傳原本的值。確認原本的露營地CA/TA有位子(有些是本來就沒有)
		if (ic == null) {
			if ("CA".equalsIgnoreCase(unitType)) {
				if(caOriginSpace>0) {
				return "您還有" + caOriginSpace + "個空位可以預訂喔!";
				}
			} 
			if("TA".equalsIgnoreCase(unitType)) {
				if(taOriginSpace>0) {
				return "您還有" + taOriginSpace + "個空位可以預訂喔!";
				}
			}
			return "沒有提供這類型露營地喔！";
		}
//如果有訂位 
		if (ic != null) {
			int count = ic.getCount();
			System.out.println("count="+count);
			if ("CA".equalsIgnoreCase(unitType)) {
				int caSpace = caOriginSpace - count;
				if (caSpace == 0) {
					return "沒有空位囉";
				}
				return "您還有" + caSpace + "個空位可以預訂喔!";
			} 
			
			if("TA".equalsIgnoreCase(unitType)) {
				int taSpace = taOriginSpace - count;

				if (taSpace == 0) {
					return "沒有空位囉";
				}

				return "您還有" + taSpace + "個空位可以預訂喔!";
			}

		}

		return "您在未知的領域裡...";

	}

//	@PostMapping("/getCsById")
//	public Campsite getCsById(@RequestBody Integer id) {
//		
//		return mCSer.findById(id);
//	}

//	@GetMapping("/getLatestId")
//	public int getLatestId() {
//		return mCSer.selectLatestId();
//	}
//	
//	@PostMapping("/uploadImg")
//	public void uploadImg(@RequestParam String fName, @RequestParam MultipartFile fFile, HttpServletRequest request) {
//		// 若C槽下沒有temp資料夾，則建立一個。
//		String usersFolderPath = request.getServletContext().getRealPath("") + "myImage";
//
//		try {
//			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(usersFolderPath + "/" + fName));
//			bos.write(fFile.getBytes());
//			bos.close();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
//	
//
//	@PostMapping("/GetImg")
//	public byte[] getImg(@RequestParam int id, HttpServletRequest request) {
//		String usersFolderPath = request.getServletContext().getRealPath("") + "myImage/camp";
//
//		try {
//			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(usersFolderPath + id + ".png"));
//			byte[] bytes = bis.readAllBytes();
//			bis.close();
//			return bytes;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}
//
//	@PostMapping("/PostImg")
//	public void postImg(@RequestParam String fName, @RequestParam MultipartFile fFile, HttpServletRequest request) {
//		// 若C槽下沒有temp資料夾，則建立一個。
//		String usersFolderPath = request.getServletContext().getRealPath("") + "myImage";
//
//		try {
//			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(usersFolderPath + "/" + fName));
//			bos.write(fFile.getBytes());
//			bos.close();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
//
//	@PostMapping("/PostImg2")
//	public void postImg2(@RequestParam String[] name1, @RequestParam MultipartFile[] fFile1,
//			HttpServletRequest request) {
//		// 若C槽下沒有temp資料夾，則建立一個。
//		String usersFolderPath = request.getServletContext().getRealPath("") + "myImage";
//	
//		try {
//			BufferedOutputStream bos1 = new BufferedOutputStream(
//					new FileOutputStream(usersFolderPath + "/" + name1[0]));
//			bos1.write(fFile1[0].getBytes());
//
//			bos1.close();
//			BufferedOutputStream bos2 = new BufferedOutputStream(new FileOutputStream(usersFolderPath + "/"+name2));
//			bos2.write(fFile2.getBytes());
//			
//			bos2.close();
//			
//			BufferedOutputStream bos3 = new BufferedOutputStream(new FileOutputStream(usersFolderPath + "/"+name3));
//			bos3.write(fFile3.getBytes());
//		
//			bos3.close();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}

}
