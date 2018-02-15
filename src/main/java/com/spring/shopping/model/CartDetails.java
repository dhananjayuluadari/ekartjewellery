package com.spring.shopping.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="CartDetails",schema = "ekart")
public class CartDetails {
	
	@Id
	@GenericGenerator(name="CartDetails" , strategy="increment")
	@GeneratedValue(generator="CartDetails")
	@Column(name = "Details_Id")
	private int detailsId;
	@Column(name = "Customer_Id")
	private Long customerId;
	@Column(name = "Quantity")
	private int quantity;
	@Column(name = "Product_Id")
	private Long productId;
	
	
	
	
	
	public int getDetailsId() {
		return detailsId;
	}
	public void setDetailsId(int detailsId) {
		this.detailsId = detailsId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	
	
	
	
	
	

}
