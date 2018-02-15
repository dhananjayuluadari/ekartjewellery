package com.spring.shopping.repository;

import java.util.List;

import com.spring.shopping.model.Product;

public interface CartDetailsRepository {

	
	public void addNewProduct(Long productId, Long customerId);

	public List<Product> fetchCartDetails(Long customerId);

	public void updateProductCartQuantity(Long customerId, Long productId, int quantity);

	public void removeProduct(Long customerId, Long productId);

	public void clearCart(Long customerId);

	public List<Product> fetchProductsList(Long customerId);
}
