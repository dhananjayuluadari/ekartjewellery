package com.spring.shopping.service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ReviewForm;

public interface ReviewService {
	void reviewProduct(ReviewForm reviewForm) throws ParseException;

	List<ReviewForm> getProductReviews(
			Long productId) throws ParseException;

	List<ReviewForm> getReviewByCustomer(Customer customer);

	HashMap<Long, Integer> getReviewsCount(List<Product> featProdList);

	HashMap<Integer, Integer> getProductRatingCount(Long productId);

	HashMap<Long, Double> getAverageRatingCountProducts(List<Product> featProdList);

	Double getAverageRatingCountForProduct(Long productId);
}
