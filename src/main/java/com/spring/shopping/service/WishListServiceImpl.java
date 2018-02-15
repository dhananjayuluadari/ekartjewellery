package com.spring.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.repository.WishListRepository;
@Service
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListRepository wishListRepository;
	@Autowired
	private ProductConfigService productConfigService;

	
	public boolean addProductToWishList(Long productId, Customer customer) {
		Product product = productConfigService.getProductById(productId);
		return wishListRepository.addProductToWishList(product, customer);
		
	}

	
	public List<Product> getProductsInWishList(Customer customer) {
		List<Product> prodcutsInWishList = wishListRepository.readProductsInWishList(customer);
		return prodcutsInWishList;
	}

	
	public boolean checkIfProductAvailableInWishList(Long productId) {
		Product product = productConfigService.getProductById(productId);		
		return wishListRepository.checkIfProductAvailableInWishList(product);
	}
	
	public void deleteProductFromWishList(Long productId,Long customerId) {
		Product product = productConfigService.getProductById(productId);
		wishListRepository.deleteProductFromWishList(product,customerId);
	}
	

}
