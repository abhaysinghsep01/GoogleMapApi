package com.misha.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sitterdetails")
public class SitterRegistration {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String contactname;
	private String email;
	private String password;
	private String companyname;
	private String address;
	private String lat;
	private String log;
	private String opentime;
	private String closetime;
	private float chargesperhour;
	private String logo;

	public SitterRegistration() {
		super();
	}

	public SitterRegistration(String contactname, String email, String password, String companyname,
			String address, String lat, String log, String opentime, String closetime, float chargesperhour,
			String logo) {
		super();
		this.contactname = contactname;
		this.email = email;
		this.password = password;
		this.companyname = companyname;
		this.address = address;
		this.lat = lat;
		this.log = log;
		this.opentime = opentime;
		this.closetime = closetime;
		this.chargesperhour = chargesperhour;
		this.logo = logo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContactname() {
		return contactname;
	}

	public void setContactname(String contactname) {
		this.contactname = contactname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public String getClosetime() {
		return closetime;
	}

	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}

	public float getChargesperhour() {
		return chargesperhour;
	}

	public void setChargesperhour(float chargesperhour) {
		this.chargesperhour = chargesperhour;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	

}
