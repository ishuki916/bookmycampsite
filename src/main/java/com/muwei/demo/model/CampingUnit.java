package com.muwei.demo.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="campingUnit")
public class CampingUnit {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="unitId")
	private Integer unitId;
	
	@Column(name="unitType")
	private String unitType;
	
	@Column(name="unitName")
	private String unitName;
	
	@Column(name="campsiteId")
	private Integer campsiteId;
	
	
	@Column(name="xPos")
	private Double xPos;
	
	
	@Column(name="yPos")
	private Double yPos;
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="campsiteId",insertable = false, updatable = false)
	private Campsite campsite;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="campingUnit",cascade=CascadeType.ALL)
	private Set<BookingCampsite> bookingCampsite = new HashSet<BookingCampsite>();
	
	
	
	
	public CampingUnit() {

	}
	
	public CampingUnit(String unitType, String unitName, Integer campsiteId, Double xPos, Double yPos) {
		this.unitType = unitType;
		this.unitName = unitName;
		this.campsiteId = campsiteId;
		this.xPos = xPos;
		this.yPos = yPos;
		
	}
	public Double getxPos() {
		return xPos;
	}
	public void setxPos(Double xPos) {
		this.xPos = xPos;
	}
	public Double getyPos() {
		return yPos;
	}
	public void setyPos(Double yPos) {
		this.yPos = yPos;
	}
	public Set<BookingCampsite> getBookingCampsite() {
		return bookingCampsite;
	}
	public void setBookingCampsite(Set<BookingCampsite> bookingCampsite) {
		this.bookingCampsite = bookingCampsite;
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
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
	public Campsite getCampsite() {
		return campsite;
	}
	public void setCampsite(Campsite campsite) {
		this.campsite = campsite;
	}
	public Integer getCampsiteId() {
		return campsiteId;
	}
	public void setCampsiteId(Integer campsiteId) {
		this.campsiteId = campsiteId;
	}


}
