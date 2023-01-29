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
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="campsite")
public class Campsite {
	
	
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY) @Column(name="id")
	private Integer id;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="campsite",cascade=CascadeType.ALL)
	private Set<CampingUnit> campingUnits = new HashSet<CampingUnit>();
	
	@Column(name="campsiteName")
	private String campsiteName;
	
	@Column(name="destination")
	private String destination;
	
	@Column(name="campsiteAddress")
	private String campsiteAddress;
	
	@Column(name="traffic")
	private String traffic;
	
	@Column(name="Introduction")
	private String Introduction;
	
	@Column(name="caIntro")
	private String caIntro;
	
	@Column(name="taIntro")
	private String taIntro;
	
	@Column(name="pricePerNightsCA")
	private Integer pricePerNightsCA;
	
	@Column(name="pricePerNightsTA")
	private Integer pricePerNightsTA;
	
	@Column(name="campervanAreaAmount")
	private Integer campervanAreaAmount;
	
	@Column(name="tentAreaAmount")
	private Integer tentAreaAmount;
	
	@Column(name="toilet")
	private String toilet;
	
	@Column(name="showerRoom")
	private String showerRoom;
	
	@Column(name="garbage")
	private String garbage;
	
	@Column(name="wifi")
	private String wifi;
	
	@Column(name="Manager")
	private String Manager;
	
	@Column(name="charge")
	private String charge;
	
	@Column(name="refrigerator")
	private String refrigerator;
	
	@Column(name="kitchenSink")
	private String kitchenSink;
	
	@Column(name="rentBike")
	private String rentBike;
	
	@Column(name="washer")
	private String washer;
	
	@Column(name="cafeBar")
	private String cafeBar;
	
	@Column(name="withPets")
	private String withPets;


	public Campsite() {
	}

	public Campsite(String campsiteName, String destination, String campsiteAddress, String traffic,
			String introduction, String caIntro, String taIntro, Integer pricePerNightsCA, Integer pricePerNightsTA,
			Integer campervanAreaAmount, Integer tentAreaAmount, String toilet, String showerRoom, String garbage,
			String wifi, String manager, String charge, String refrigerator, String kitchenSink, String rentBike,
			String washer, String cafeBar, String withPets) {
		super();
		this.campsiteName = campsiteName;
		this.destination = destination;
		this.campsiteAddress = campsiteAddress;
		this.traffic = traffic;
		Introduction = introduction;
		this.caIntro = caIntro;
		this.taIntro = taIntro;
		this.pricePerNightsCA = pricePerNightsCA;
		this.pricePerNightsTA = pricePerNightsTA;
		this.campervanAreaAmount = campervanAreaAmount;
		this.tentAreaAmount = tentAreaAmount;
		this.toilet = toilet;
		this.showerRoom = showerRoom;
		this.garbage = garbage;
		this.wifi = wifi;
		Manager = manager;
		this.charge = charge;
		this.refrigerator = refrigerator;
		this.kitchenSink = kitchenSink;
		this.rentBike = rentBike;
		this.washer = washer;
		this.cafeBar = cafeBar;
		this.withPets = withPets;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCampsiteName() {
		return campsiteName;
	}

	public void setCampsiteName(String campsiteName) {
		this.campsiteName = campsiteName;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getCampsiteAddress() {
		return campsiteAddress;
	}

	public void setCampsiteAddress(String campsiteAddress) {
		this.campsiteAddress = campsiteAddress;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getIntroduction() {
		return Introduction;
	}

	public void setIntroduction(String introduction) {
		Introduction = introduction;
	}

	public String getCaIntro() {
		return caIntro;
	}

	public void setCaIntro(String caIntro) {
		this.caIntro = caIntro;
	}

	public String getTaIntro() {
		return taIntro;
	}

	public void setTaIntro(String taIntro) {
		this.taIntro = taIntro;
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

	public Integer getCampervanAreaAmount() {
		return campervanAreaAmount;
	}

	public void setCampervanAreaAmount(Integer campervanAreaAmount) {
		this.campervanAreaAmount = campervanAreaAmount;
	}

	public Integer getTentAreaAmount() {
		return tentAreaAmount;
	}

	public void setTentAreaAmount(Integer tentAreaAmount) {
		this.tentAreaAmount = tentAreaAmount;
	}

	public String getToilet() {
		return toilet;
	}

	public void setToilet(String toilet) {
		this.toilet = toilet;
	}

	public String getShowerRoom() {
		return showerRoom;
	}

	public void setShowerRoom(String showerRoom) {
		this.showerRoom = showerRoom;
	}

	public String getGarbage() {
		return garbage;
	}

	public void setGarbage(String garbage) {
		this.garbage = garbage;
	}

	public String getWifi() {
		return wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public String getManager() {
		return Manager;
	}

	public void setManager(String manager) {
		Manager = manager;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public String getRefrigerator() {
		return refrigerator;
	}

	public void setRefrigerator(String refrigerator) {
		this.refrigerator = refrigerator;
	}

	public String getKitchenSink() {
		return kitchenSink;
	}

	public void setKitchenSink(String kitchenSink) {
		this.kitchenSink = kitchenSink;
	}

	public String getRentBike() {
		return rentBike;
	}

	public void setRentBike(String rentBike) {
		this.rentBike = rentBike;
	}

	public String getWasher() {
		return washer;
	}

	public void setWasher(String washer) {
		this.washer = washer;
	}

	public String getCafeBar() {
		return cafeBar;
	}

	public void setCafeBar(String cafeBar) {
		this.cafeBar = cafeBar;
	}

	public String getWithPets() {
		return withPets;
	}

	public void setWithPets(String withPets) {
		this.withPets = withPets;
	}

	public Set<CampingUnit> getCampingUnits() {
		return campingUnits;
	}

	public void setCampingUnits(Set<CampingUnit> campingUnits) {
		this.campingUnits = campingUnits;
	}
	
	
}
	

