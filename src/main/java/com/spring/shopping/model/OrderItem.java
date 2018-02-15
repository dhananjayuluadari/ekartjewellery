package com.spring.shopping.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="orderitem",schema = "ekart")
public class OrderItem implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="orderitem" , strategy="increment")
	@GeneratedValue(generator="orderitem")
	@Column(name = "orderitem_id")
	private Long orderItemId;
	@Column(name = "order_id")
	private Long orderId;
	@Column(name = "product_id")
	private Long productId;
	private Product product;
	@Column(name = "quantity")
	private int quantity;
	@Column(name = "orders_id")
	private String ordersId;
	@Column(name = "price")
	private Double price;
	@Column(name = "name")
	private String productName;
	@Column(name = "subcategory_id")
	private Long subCategoryId;
	@Column(name = "category_id")
	private Long categoryId;
	
	
	
	
	
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(Long subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Long orderItemId) {
		this.orderItemId = orderItemId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void incrementQuantity() {
		quantity++;
	}

	public BigDecimal getTotal() {
		double amount = 0.0;
		if (product != null) {
			amount += product.getPrice().doubleValue() * quantity;
		}
		return new BigDecimal(amount);
	}

	public void decrementQuantity() {
		quantity--;

	}

	@Override
	public String toString() {
		return "OrderItem [product=" + product + ", quantity=" + quantity
				+ ", getProduct()=" + getProduct() + ", getQuantity()="
				+ getQuantity() + ", getTotal()=" + getTotal()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}