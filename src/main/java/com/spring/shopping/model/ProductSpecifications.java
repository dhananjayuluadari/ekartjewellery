package com.spring.shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="ProductSpecifications",schema = "ekart")
public class ProductSpecifications implements Serializable {
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1253379561592545382L;
	@Id
	@GenericGenerator(name="ProductSpecifications" , strategy="increment")
	@GeneratedValue(generator="ProductSpecifications")
	@Column(name = "productSpecificationsId")
	private Long productSpecificationsId;
	@Column(name = "Product_Id")
	private Long productId;
	@Column(name = "property")
	private String property;
	@Column(name = "description")
	private String description;
	
	
	
	
	
	public Long getProductSpecificationsId() {
		return productSpecificationsId;
	}
	public void setProductSpecificationsId(Long productSpecificationsId) {
		this.productSpecificationsId = productSpecificationsId;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
