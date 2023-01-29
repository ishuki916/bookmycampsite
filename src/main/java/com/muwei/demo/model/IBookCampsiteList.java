package com.muwei.demo.model;

import java.util.Date;

public interface IBookCampsiteList {

	Integer getOrderId();

	Integer getCampsiteId();

	String getCampsiteName();

	Date getArrivalDate();

	Integer getPricePerNightsCA();

	Integer getPricePerNightsTA();

	String getUnitType();

	String getUnitName();

	Date getBookingDate();

}
