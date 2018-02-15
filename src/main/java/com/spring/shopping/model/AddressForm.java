package com.spring.shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Address",schema = "ekart")
public class AddressForm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7333634513574787366L;
	 @Id
		@GenericGenerator(name="AddressForm" , strategy="increment")
		@GeneratedValue(generator="AddressForm")
	@Column(name = "Address_Id")
	private Long addressId;
	@Column(name = "FullName")
	private String fullName;
	@Column(name = "Address_1")
	private String address1;
	@Column(name = "Address_2")
	private String address2;
	@Column(name = "City")
	private String city;
	@Column(name = "Zip")
	private String zipCode;
	@Column(name = "State")
	private String state;
	@Column(name = "Phone_Number")
	private String phoneNumber;
	@Column(name = "landmark")
	private String landmark;

	@Column(name = "Customer_Id")
	private Long customerId;
	
	
	
	
	
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}


	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
