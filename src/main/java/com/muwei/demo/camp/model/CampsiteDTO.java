package com.muwei.demo.camp.model;


import java.util.HashSet;
import java.util.Set;



import com.fasterxml.jackson.annotation.JsonProperty;



public class CampsiteDTO {
	
	
	@JsonProperty("id")
	private Integer id;
	
	@JsonProperty("campingUnits")
	private Set<CampingUnit> campingUnits = new HashSet<CampingUnit>();
	
	@JsonProperty("campsiteName")
	private String campsiteName;

	@JsonProperty("destination")
	private String destination;
	
	@JsonProperty("campsiteAddress")
	private String campsiteAddress;
	
	@JsonProperty("traffic")
	private String traffic;
	
	@JsonProperty("Introduction")
	private String Introduction;
	
	@JsonProperty("caIntro")
	private String caIntro;
	
	@JsonProperty("taIntro")
	private String taIntro;

	@JsonProperty("pricePerNightsCA")
	private Integer pricePerNightsCA;
	
	@JsonProperty("pricePerNightsTA")
	private Integer pricePerNightsTA;
	
	@JsonProperty("campervanAreaAmount")
	private Integer campervanAreaAmount;
	
	@JsonProperty("tentAreaAmount")
	private Integer tentAreaAmount;
	
	@JsonProperty("toilet")
	private String toilet;

	@JsonProperty("showerRoom")
	private String showerRoom;
	
	@JsonProperty("garbage")
	private String garbage;
	
	@JsonProperty("wifi")
	private String wifi;
	
	@JsonProperty("Manager")
	private String Manager;
	
	@JsonProperty("charge")
	private String charge;
	
	@JsonProperty("refrigerator")
	private String refrigerator;
	
	@JsonProperty("kitchenSink")
	private String kitchenSink;
	
	@JsonProperty("rentBike")
	private String rentBike;
	
	@JsonProperty("washer")
	private String washer;

	@JsonProperty("cafeBar")
	private String cafeBar;
	
	@JsonProperty("withPets")
	private String withPets;


	public CampsiteDTO() {
	}

	public CampsiteDTO(String campsiteName, String destination, String campsiteAddress, String traffic,
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
	

