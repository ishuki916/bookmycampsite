package com.muwei.demo.users.model;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.muwei.demo.model.BookingCampsite;



@Entity
@Table(name="users")
public class Users {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String email;
	
	private String pwd;
	
	private String username;
	
	private Boolean auth;
	
	private String phone;
	
	private String gender;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="birth")
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8" )
	@DateTimeFormat(pattern="yyyy-MM-dd")//java環境內格式
	private Date birth;
	
	private String lv;
	
	private String image;
	

	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY,mappedBy="users",cascade=CascadeType.ALL)
	private Set<BookingCampsite> bookingCampsites = new HashSet<BookingCampsite>();
	
	
	public Set<BookingCampsite> getBookingCampsites() {
		return bookingCampsites;
	}

	public void setBookingCampsites(Set<BookingCampsite> bookingCampsites) {
		this.bookingCampsites = bookingCampsites;
	}

	
	

	public Users() {
	}

	public Users(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}
	
	

	public Users(String email, String pwd, String username, String phone, Date birth, String gender) {
		this.email = email;
		this.pwd = pwd;
		this.username = username;
		this.auth= false;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.lv = "member";
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Boolean getAuth() {
		return auth;
	}
	public void setAuth(Boolean auth) {
		this.auth = auth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getLv() {
		return lv;
	}
	public void setLv(String lv) {
		this.lv = lv;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
	
}
