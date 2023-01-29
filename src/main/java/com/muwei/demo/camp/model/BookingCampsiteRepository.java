package com.muwei.demo.camp.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;



public interface BookingCampsiteRepository extends JpaRepository<BookingCampsite, Integer> {
	
	
	@Query("from BookingCampsite where userId = ?1")
	public List<BookingCampsite> selectBookingByUserId(int id);
	
	@Query("from BookingCampsite where arrivalDate between ?1 AND ?2 AND paidStatus = 'Y' AND campingUnit.unitType = ?3")
	public  List<BookingCampsite> selectBooking(Date sdate,Date ddate, String unitType);
	
	//如果選一天&已選露營地 引數是單一日期/區域名稱/露營地id  可以算出某露營地某天的訂位數
	@Query(value="select count(*) as count,arrivalDate,unitType,campsiteId from bookingCampsite join campingUnit on campingUnit.unitId = bookingCampsite.unitId join Campsite on Campsite.id = campingUnit.campsiteId where arrivalDate = ?1 AND unitType = ?2 AND campsiteId =?3 group by arrivalDate,unitType,campsiteId",nativeQuery=true)
	public  ICheckSpace getCountOnedaywithId(Date date,String unitType,Integer campsiteId);

	@Query("from BookingCampsite where arrivalDate = ?1 AND unitId >= ?2 AND unitId <= ?3")
	public  List<BookingCampsite> selectBookingByUnitId(Date date,int minId , int maxId);
	
	//在購物車顯示的露營地小訂單所需要的資訊
	@Query(value="select orderId,campsiteId,campsiteName, arrivalDate,pricePerNightsCA,pricePerNightsTA,unitType,unitName,bookingDate from bookingCampsite join campingUnit on campingUnit.unitId = bookingCampsite.unitId join Campsite on Campsite.id = campingUnit.campsiteId where userId= ?1 AND paidStatus = 'N'",nativeQuery=true)
	public List<IBookCampsiteList> getBookCampsiteListBeforeCheckout(Integer userId);
	
	//先在訂單中找到某位使用者未付款的品項--->更改付款狀態& 塞入PaidListId
	@Query(value="update bookingCampsite set [paidStatus]= 'Y', [paidListId] = ?1 where [paidStatus]='N' AND [userId] = ?2 ",nativeQuery=true)
	@Modifying
	public void updatebookingCampsiteToPaid(Integer paidListId,Integer userId);
	
	
	
}
