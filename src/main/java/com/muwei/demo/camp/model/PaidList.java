package com.muwei.demo.camp.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="paidList")
public class PaidList {
	
	@Id
	@Column(name = "paidListId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer paidListId; 
	
	
	@Column(name = "total")
	private Integer total;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="paidList",cascade=CascadeType.ALL)
	private Set<BookingCampsite> bookingCampsites = new HashSet<BookingCampsite>();

	
	public Integer getPaidListId() {
		return paidListId;
	}

	public void setPaidListId(Integer paidListId) {
		this.paidListId = paidListId;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Set<BookingCampsite> getBookingCampsites() {
		return bookingCampsites;
	}

	public void setBookingCampsites(Set<BookingCampsite> bookingCampsites) {
		this.bookingCampsites = bookingCampsites;
	}




}
