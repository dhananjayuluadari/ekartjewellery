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
@Table(name="shippingaddress",schema = "ekart")
public class ShippingAddress implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7333634513574787366L;
	@Id
	@GenericGenerator(name="shippingaddress" , strategy="increment")
	@GeneratedValue(generator="shippingaddress")
	/*@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "Address_Id")*/
	private Long addressId;
	@Column(name = "fullname")
	private String fullName;
	@Column(name = "address_1")
	private String address1;
	@Column(name = "address_2")
	private String address2;
	@Column(name = "city")
	private String city;
	@Column(name = "zip")
	private String zipCode;
	@Column(name = "state")
	private String state;
	
	@Column(name = "customer_id")
	private Long customerId;
	@Column(name = "phone_number")
	private String phoneNumber;
	@Column(name = "landmark")
	private String landmark;
	
	
	
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
