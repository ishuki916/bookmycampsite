package com.muwei.demo.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface CampsiteRepository extends JpaRepository<Campsite, Integer>,CampsiteRepositoryCustom {
    //有指定地點
	@Query("from Campsite where destination = ?1")
	public List<Campsite> selectByDestination(String destination);
	//可以停露營車的露營地
	@Query("from Campsite where campervanAreaAmount > 0")
	public List<Campsite> selectByCampervan();
	
	@Query("from CampingUnit where campsiteId =?1")
	public List<CampingUnit> selectUnitById(int id);
	

	
	@Query("from CampingUnit where campsiteId = ?1 AND unitType = ?2")
	public List<CampingUnit> selectUnitByTypeAndId(int id, String unitType);
	
	@Query(value="select top 1 id from Campsite order by id DESC",nativeQuery=true)
	public int selectLatestId();
	

	
	
	
	
	
	
	
//	@Query("from Campsite where campingUnits.bookingCampsite.arrivalDate between ?1 AND ?2 AND campingUnits.bookingCampsite.paidStatus = 'Y' AND campingUnit.unitType = ?3")
//	public  List<Campsite> selectBookinfromCampsite(Date sdate,Date ddate, String unitType);
    

	
	
	
	

}
