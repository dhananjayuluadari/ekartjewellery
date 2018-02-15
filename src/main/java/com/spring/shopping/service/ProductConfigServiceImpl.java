package com.spring.shopping.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shopping.model.Product;
import com.spring.shopping.model.ProductSpecifications;
import com.spring.shopping.model.Tag;
import com.spring.shopping.repository.ProductConfigRepository;

@Service
@Repository
public class ProductConfigServiceImpl implements ProductConfigService {

	@Autowired
	private ProductConfigRepository productConfigRepository;
	@Transactional
	public List<Product> getFeaturedProducts() {
		List<Product> featuredProdList = productConfigRepository
				.readFeaturedProducts();
		return featuredProdList;
	}

	@Transactional
	public Product getProductById(Long productId) {
		Product product = productConfigRepository.readProductById(productId);
		return product;
	}

	@Override
	public List<Product> getProductNames() {
		// TODO Auto-generated method stub
		List<Product> featuredProdList = productConfigRepository
				.readFeaturedProducts();
		return featuredProdList;
	}

	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		List<Product> ProdList = productConfigRepository
				.readAllProducts();
		return ProdList;
	}

	@Override
	public Object getAllProductInfoById(Long productId) {
		// TODO Auto-generated method stub
		Object product = productConfigRepository.readAllProductInfoById(productId);
		return product;
	}

	@Override
	public void editProductInformation(Product p) {
		// TODO Auto-generated method stub
		productConfigRepository.editProductInformation(p);
	}

	@Override
	public void insertOrUpdateProductViews(Long productId, Long customerId) {
		// TODO Auto-generated method stub
		
		productConfigRepository.insertOrUpdateProductViews(productId,customerId);
	}

	@Override
	public List<ProductSpecifications> getProductSpecificationsById(Long productId) {
		// TODO Auto-generated method stub
		
		List<ProductSpecifications> ProdList = productConfigRepository
				.getProductSpecificationsById(productId);
		return ProdList;
		
	}

}
