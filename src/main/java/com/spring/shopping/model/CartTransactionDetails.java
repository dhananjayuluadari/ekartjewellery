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
@Table(name="CartTransactionDetails",schema = "ekart")
public class CartTransactionDetails implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7487679459517799184L;
	@Id
	@GenericGenerator(name="CartTransactionDetails" , strategy="increment")
	@GeneratedValue(generator="CartTransactionDetails")
	@Column(name = "autogenerateid")
	private Long autogenerateId;
	@Column(name = "bankname")
	private String bankName;
	@Column(name = "bankTransactionId")
	private String bankTransactionId;
	@Column(name = "currency")
	private String currency;
	@Column(name = "gatewayname")
	private String gatewayName;
	@Column(name = "merchantid")
	private String merchantid;
	@Column(name = "orderid")
	private String orderid;
	@Column(name = "paymentmode")
	private String paymentmode;
	@Column(name = "responsecode")
	private String responsecode;
	@Column(name = "responsemessage")
	private String responsemessage;
	@Column(name = "status")
	private String status;
	@Column(name = "transactionamount")
	private String transactionamount;
	@Column(name = "transactiondate")
	private String transactiondate;
	@Column(name = "transactionid")
	private String transactionid;
	
	
	
	
	public Long getAutogenerateId() {
		return autogenerateId;
	}
	public void setAutogenerateId(Long autogenerateId) {
		this.autogenerateId = autogenerateId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankTransactionId() {
		return bankTransactionId;
	}
	public void setBankTransactionId(String bankTransactionId) {
		this.bankTransactionId = bankTransactionId;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getGatewayName() {
		return gatewayName;
	}
	public void setGatewayName(String gatewayName) {
		this.gatewayName = gatewayName;
	}
	public String getMerchantid() {
		return merchantid;
	}
	public void setMerchantid(String merchantid) {
		this.merchantid = merchantid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	public String getResponsecode() {
		return responsecode;
	}
	public void setResponsecode(String responsecode) {
		this.responsecode = responsecode;
	}
	public String getResponsemessage() {
		return responsemessage;
	}
	public void setResponsemessage(String responsemessage) {
		this.responsemessage = responsemessage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTransactionamount() {
		return transactionamount;
	}
	public void setTransactionamount(String transactionamount) {
		this.transactionamount = transactionamount;
	}
	public String getTransactiondate() {
		return transactiondate;
	}
	public void setTransactiondate(String transactiondate) {
		this.transactiondate = transactiondate;
	}
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	
	
	
	
	
	
	
	
	
	
}
