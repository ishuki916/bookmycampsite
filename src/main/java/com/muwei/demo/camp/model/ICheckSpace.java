package com.muwei.demo.camp.model;

import java.util.Date;

public interface ICheckSpace {
	Integer getCount();

	Date getArrivalDate();

	String getPaidStatus();

	String getUnitType();

	Integer getCampsiteId();
}
