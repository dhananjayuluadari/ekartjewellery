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
@Table(name="wishlistdetails",schema = "ekart")
public class WishList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2678097760295239585L;
	@Id
	@GenericGenerator(name="wishlistdetails" , strategy="increment")
	@GeneratedValue(generator="wishlistdetails")
	@Column(name = "details_id")
	private int detailsId;
	@Column(name = "product_id")
	private Long productId;
	@Column(name = "customer_id")
	private Long customerId;

	
	public int getDetailsId() {
		return detailsId;
	}
	public void setDetailsId(int detailsId) {
		this.detailsId = detailsId;
	}
	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

}