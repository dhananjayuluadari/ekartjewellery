package com.spring.shopping.repository;

import java.util.List;

import com.spring.shopping.model.Product;
import com.spring.shopping.model.ProductSpecifications;

public interface ProductConfigRepository {

	List<Product> readFeaturedProducts();

	Product readProductById(Long productId);

	List<Product> readAllProducts();

	Object readAllProductInfoById(Long productId);

	void editProductInformation(Product p);

	void insertOrUpdateProductViews(Long productId, Long customerId);

	List<ProductSpecifications> getProductSpecificationsById(Long productId);

}
