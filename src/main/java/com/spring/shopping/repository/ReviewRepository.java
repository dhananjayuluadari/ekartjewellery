package com.spring.shopping.repository;

import java.util.HashMap;
import java.util.List;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ReviewForm;

public interface ReviewRepository {
	void reviewProduct(ReviewForm reviewForm);

	List<ReviewForm> getProductReviews(Long productId);

	List<ReviewForm> getReviewByCustomer(Customer customer);

	HashMap<Long, Integer> getReviewsCount(List<Product> featProdList);

	HashMap<Integer, Integer> getProductRatingCount(Long productId);

	HashMap<Long, Double> getAverageRatingCountProducts(List<Product> featProdList);

	Double getAverageRatingCountProducts(Long productId);
}
