package com.muwei.demo.camp.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.muwei.demo.camp.model.BookCampsiteListDTO;
import com.muwei.demo.camp.model.BookingCampsite;
import com.muwei.demo.camp.model.BookingCampsiteRepository;
import com.muwei.demo.camp.model.CampingUnit;
import com.muwei.demo.camp.model.CampingUnitRepository;
import com.muwei.demo.camp.model.Campsite;
import com.muwei.demo.camp.model.CampsiteRepository;
import com.muwei.demo.camp.model.IBookCampsiteList;
import com.muwei.demo.camp.model.ICheckSpace;
import com.muwei.demo.camp.model.PaidList;
import com.muwei.demo.camp.model.PaidListRepository;




@Transactional
@Service
public class MyCampsiteService {

	@Autowired
	private CampsiteRepository cRepo;

	@Autowired
	private CampingUnitRepository cuRepo;

	@Autowired
	private BookingCampsiteRepository bcRepo;
	
	@Autowired
	private PaidListRepository plRepo;
	
//	public IBookCampsiteList getCountOnedaywithId(Date date,String unitType,Integer campsiteId){
//		//Date sdate,Date ddate, String unitType
//		//sdate, ddate, unitType
//		
//			return bcRepo.getCountOnedaywithId(date,unitType,campsiteId);
//	}
	
	public void insertCampingUnit(String unitType,String unitName,int id,Double xPos,Double yPos) {
		CampingUnit cu = new CampingUnit(unitType,unitName,id,xPos,yPos);
		cuRepo.save(cu);
	}
	
	
	public void updatebookingCampsiteToPaid(Integer paidListId,Integer userId) {
		bcRepo.updatebookingCampsiteToPaid(paidListId, userId);
		
	}
	
	
	public Integer insertAndUpdatePaidList(PaidList pl) {
		PaidList newpl = plRepo.save(pl);

		 return newpl.getPaidListId();
	}
	
	public void deleteOneBookingById(int orderId) {

		if (bcRepo.findById(orderId).isPresent()) {
			bcRepo.deleteById(orderId);
		}
	}
	
	public List<BookCampsiteListDTO> getBookCampsiteListBeforeCheckout(Integer userId) {
		
		List<IBookCampsiteList> ibcl = bcRepo.getBookCampsiteListBeforeCheckout(userId);
		List<BookCampsiteListDTO> bcDTOlist = new ArrayList<BookCampsiteListDTO>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日 E");
		for(int i = 0;i<ibcl.size();i++) {
			
			
			bcDTOlist.add(new BookCampsiteListDTO(ibcl.get(i).getOrderId(),
					ibcl.get(i).getCampsiteId(),
					ibcl.get(i).getCampsiteName(),
					sdf.format(ibcl.get(i).getArrivalDate()),
					ibcl.get(i).getPricePerNightsCA(),
					ibcl.get(i).getPricePerNightsTA(),
					ibcl.get(i).getUnitType(),
					ibcl.get(i).getUnitName(),
					ibcl.get(i).getBookingDate()));
	
		}
		
		
		return bcDTOlist;
	}
	
	
	
	public  List<BookingCampsite> selectBookingByUnitId(Date date,int minId , int maxId){
		return bcRepo.selectBookingByUnitId(date, minId, maxId);
	}
	
	public List<CampingUnit> selectUnitByTypeAndId(int id, String unitType){
		return cRepo.selectUnitByTypeAndId(id, unitType);
	}

	public List<BookingCampsite> selectBooking(Date sdate,Date ddate, String unitType) {
		return bcRepo.selectBooking(sdate,ddate,unitType);
	}
	
	public List<BookingCampsite> selectBooking2(Date sdate,Date ddate, String unitType) {
		return bcRepo.selectBooking(sdate,ddate,unitType);
	}
	

	
	public ICheckSpace getCountOnedaywithId(Date date,String unitType,Integer campsiteId){
		//Date sdate,Date ddate, String unitType
		//sdate, ddate, unitType
		
			return bcRepo.getCountOnedaywithId(date,unitType,campsiteId);
	}
	
	
//	public List <Campsite> selectBookinfromCampsite(Date sdate,Date ddate, String unitType) {
//		return cRepo.selectBookinfromCampsite(sdate,ddate,unitType);
//	}
//	
	

	public void insertAndUpdateBooking(Date bookingDate,int unitId,String paidStatus, int userid, Date date) {
		BookingCampsite bcs = new BookingCampsite();
		bcs.setBookingDate(bookingDate);
		bcs.setUnitId(unitId);
		bcs.setPaidStatus(paidStatus);
		bcs.setUserId(userid);
		bcs.setArrivalDate(date);
		bcRepo.save(bcs);
	}

	public List<BookingCampsite> selectBookingByUserId(int id) {

		return bcRepo.selectBookingByUserId(id);
	}

	public CampingUnit findUnitByUnitId(int id) {
		if (cuRepo.findById(id).isPresent()) {
			return cuRepo.findById(id).get();
		}
		;
		return null;
	}

	public List<Campsite> findAll() {
		return cRepo.findAll();
	}

	public ArrayList<String> getAllDestination() {
		ArrayList<String> destinationList = new ArrayList<String>();
		List<Campsite> cslist = cRepo.findAll();
		for (Campsite cs : cslist) {
			destinationList.add(cs.getDestination());
		}

		return destinationList;
	}

	public List<Campsite> selectByDestination(String destination) {

		return cRepo.selectByDestination(destination);
	}

	public List<Campsite> selectByDesitinationAndCheck(String destination, String[] campsitePro) {

		Map<String, String> checks = new HashMap<String, String>();
		boolean campervanAVL = false;
		int beginNumOfChecksArr = 1;

		// 確認有沒有填特定destination
		if (destination != "") {
			checks.put("destination", destination);
		}

		// 確認第二個勾選是否為露營車
		if (campsitePro.length > 1) {
			if ("campervan".equalsIgnoreCase(campsitePro[1])) {
				beginNumOfChecksArr = 2;
				campervanAVL = true;
			}

			for (int i = beginNumOfChecksArr; i < campsitePro.length; i++) {
				checks.put(campsitePro[i], "Y");
			}
			return cRepo.selectByCheck(checks, campervanAVL);
		}

		// 如果都沒填就一樣傳送全部
		return cRepo.findAll();
	}

	public void insertAndUpdate(Campsite cs) {
		cRepo.save(cs);
	}

	public void insertAndUpdateUnit(CampingUnit cUnit) {
		cuRepo.save(cUnit);
	}

	public Campsite findById(int id) {
		if (cRepo.findById(id).isPresent()) {
			return cRepo.findById(id).get();
		}
		;
		return null;
	}

	public void deleteById(int id) {

		if (cRepo.findById(id).isPresent()) {
			cRepo.deleteById(id);
		}
	}

	public List<CampingUnit> selectUnitById(int id) {
		return cRepo.selectUnitById(id);
	}

	public int selectLatestId() {
		return cRepo.selectLatestId();
	}

}
