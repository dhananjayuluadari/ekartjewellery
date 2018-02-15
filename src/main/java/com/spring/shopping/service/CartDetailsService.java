package com.spring.shopping.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;

public interface CartDetailsService {

	
	public void addNewProduct(Long productId, Long customerId);

	public List<Product> fetchCartDetails(Long customerId);

	public void updateProductCartQuantity(Long customerId, Long productId, int quantity);

	public void removeProduct(Long customerId, Long productId);

	public void clearCart(Long customerId);

	public List<Product> fetchProductsList(Long customerId);

	public void sendSmsOrder(Customer customer, List<CartProducts> cartProductsList);

	public int cartSize(HttpServletRequest request);
}
