package com.muwei.demo.users.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UsersDTO {
//	@JsonProperty("msg") ///用json傳入時替換名字  用來隱藏本來的欄位名字
//	private String text;
	
	@JsonProperty("id")
	private Integer id;
	
	@JsonProperty("email")
	private String email;
	
	@JsonProperty("pwd")
	private String pwd;
	
	@JsonProperty("username")
	private String username;
	
	@JsonProperty("auth")
	private Boolean auth;
	
	@JsonProperty("phone")
	private String phone;
	
	@JsonProperty("gender")
	private String gender;
	
	@JsonProperty("birth")
	private Date birth;
	
	@JsonProperty("lv")
	private String lv;
	
	@JsonProperty("image")
	private String image;
	
	public UsersDTO() {
		// TODO Auto-generated constructor stub
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}



}
