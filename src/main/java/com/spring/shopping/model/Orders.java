package com.spring.shopping.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="orders",schema = "ekart")
public class Orders implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GenericGenerator(name="orders" , strategy="increment")
	@GeneratedValue(generator="orders")
	@Column(name = "order_id")
	private Long orderId;
	@Column(name = "createddate")
	private java.util.Date createdDate;
	@Column(name = "updateddate")
	private java.util.Date updatedDate;
	@Column(name = "email_address")
	private String emailAddress;
	@Column(name = "order_status")
	private String orderStatus;
	@Column(name = "order_subtotal")
	private BigDecimal orderTotal;
	@Column(name = "customer_id")
	private Long customerId;
	@Column(name = "address_id")
	private Long addressId;
	@Column(name = "orders_id")
	private String ordersId;
	@Column(name = "cardnumber_last4")
	private String CardNumberLast4;
	@Column(name = "tracking_url")
	private String formUrl;
	
	
	
	
	public String getCardNumberLast4() {
		return CardNumberLast4;
	}

	public String getFormUrl() {
		return formUrl;
	}

	public void setFormUrl(String formUrl) {
		this.formUrl = formUrl;
	}

	public void setCardNumberLast4(String cardNumberLast4) {
		CardNumberLast4 = cardNumberLast4;
	}

	public String getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}
	
	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(java.util.Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(java.util.Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public BigDecimal getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(BigDecimal orderTotal) {
		this.orderTotal = orderTotal;
	}

}