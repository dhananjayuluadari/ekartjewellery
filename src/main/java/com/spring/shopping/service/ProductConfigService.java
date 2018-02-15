package com.spring.shopping.service;

import java.util.List;

import com.spring.shopping.model.Product;
import com.spring.shopping.model.ProductSpecifications;
import com.spring.shopping.model.Tag;

public interface ProductConfigService {
	List<Product> getFeaturedProducts();
	List<Product> getAllProducts();
	Product getProductById(Long productId);
	
	 List<Product> getProductNames();
	Object getAllProductInfoById(Long id);
	void editProductInformation(Product p);
	void insertOrUpdateProductViews(Long productId, Long customerId);
	List<ProductSpecifications> getProductSpecificationsById(Long productId);
}
