package com.muwei.demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.muwei.demo.users.model.Users;


@Entity
@Table(name="bookingCampsite")
public class BookingCampsite {
	
	@Id
	@Column(name = "orderId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId; 
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "arrivalDate")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date arrivalDate;
	
	@Column(name = "paidStatus")
	private String paidStatus;
	
	@Column(name = "paidListId")
	private Integer paidListId;
	
	@Column(name = "unitId")
	private Integer unitId;
	
    @Column(name = "userId")
	private Integer userId;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userId",insertable = false, updatable = false)
	@JsonIgnore
	private Users users; 
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="unitId",insertable = false, updatable = false)
	@JsonIgnore
	private CampingUnit campingUnit;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="paidListId",insertable = false, updatable = false)
	@JsonIgnore
	private PaidList paidList;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "bookingDate")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date bookingDate;
	

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public String getPaidStatus() {
		return paidStatus;
	}

	public void setPaidStatus(String paidStatus) {
		this.paidStatus = paidStatus;
	}

	public Integer getPaidListId() {
		return paidListId;
	}

	public void setPaidListId(Integer paidListId) {
		this.paidListId = paidListId;
	}

	public Integer getUnitId() {
		return unitId;
	}

	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public CampingUnit getCampingUnit() {
		return campingUnit;
	}

	public void setCampingUnit(CampingUnit campingUnit) {
		this.campingUnit = campingUnit;
	}

	public PaidList getPaidList() {
		return paidList;
	}

	public void setPaidList(PaidList paidList) {
		this.paidList = paidList;
	}
	


}
