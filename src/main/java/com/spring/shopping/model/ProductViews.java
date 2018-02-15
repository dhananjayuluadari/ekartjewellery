package com.spring.shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="productviews",schema = "ekart")
public class ProductViews implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2832624410029646632L;
	@Id
	@GenericGenerator(name="ProductViews" , strategy="increment")
	@GeneratedValue(generator="ProductViews")
	@Column(name = "view_Id")
	private int viewId;
	@Column(name = "Product_Id")
	private Long productId;
	@Column(name = "views")
	private int views;
	@Column(name = "Customer_Id")
	private Long customerId;
	
	
	public int getViewId() {
		return viewId;
	}
	public void setViewId(int viewId) {
		this.viewId = viewId;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	
	
	
	
	

}
