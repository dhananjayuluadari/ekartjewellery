package com.spring.shopping.model;

public class Products {

	private Long productId;
	private String name;
	private Double price;
	private String manufacturer;
	private String customerId;
	private int quantity;
	
	
	public Products(Long productId, String name, Double price, String manufacturer, String customerId, int quantity) {
		super();
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.manufacturer = manufacturer;
		this.customerId = customerId;
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
