package com.muwei.demo.camp.model;

import java.util.Date;

public class BookCampsiteListDTO {
	private Integer orderId;
	
	private Integer campsiteId;

	private String campsiteName;

	private String arrivalDate;

	private Integer pricePerNightsCA;

	private Integer pricePerNightsTA;

	private String unitType;

	private String unitName;

	private Date bookingDate;
	
	
	
	
	

	public BookCampsiteListDTO() {
	
	}

	public BookCampsiteListDTO(Integer orderId,Integer campsiteId, String campsiteName, String  arrivalDate, Integer pricePerNightsCA,
			Integer pricePerNightsTA, String unitType, String unitName, Date bookingDate) {
		this.orderId = orderId;
		this.campsiteId = campsiteId;
		this.campsiteName = campsiteName;
		this.arrivalDate = arrivalDate;
		this.pricePerNightsCA = pricePerNightsCA;
		this.pricePerNightsTA = pricePerNightsTA;
		this.unitType = unitType;
		this.unitName = unitName;
		this.bookingDate = bookingDate;
	}

	
	
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getCampsiteId() {
		return campsiteId;
	}

	public void setCampsiteId(Integer campsiteId) {
		this.campsiteId = campsiteId;
	}

	public String getCampsiteName() {
		return campsiteName;
	}

	public void setCampsiteName(String campsiteName) {
		this.campsiteName = campsiteName;
	}

	public String  getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(String  arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public Integer getPricePerNightsCA() {
		return pricePerNightsCA;
	}

	public void setPricePerNightsCA(Integer pricePerNightsCA) {
		this.pricePerNightsCA = pricePerNightsCA;
	}

	public Integer getPricePerNightsTA() {
		return pricePerNightsTA;
	}

	public void setPricePerNightsTA(Integer pricePerNightsTA) {
		this.pricePerNightsTA = pricePerNightsTA;
	}

	public String getUnitType() {
		return unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

}
