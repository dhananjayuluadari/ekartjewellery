package com.spring.shopping.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ReviewForm;
import com.spring.shopping.repository.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	@Transactional
	public void reviewProduct(ReviewForm reviewForm) throws ParseException {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(date);
		Date presentDate = dateFormat.parse(formattedDate);
		java.sql.Date sqlDate = new java.sql.Date(presentDate.getTime());
		reviewForm.setDate(sqlDate);
		reviewRepository.reviewProduct(reviewForm);
	}

	
	public List<ReviewForm> getProductReviews(Long productId)
			throws ParseException {
		List<ReviewForm> reviewsList = reviewRepository
				.getProductReviews(productId);
		return reviewsList;
	}

	
	public List<ReviewForm> getReviewByCustomer(Customer customer) {
		List<ReviewForm> reviewsList =  reviewRepository.getReviewByCustomer(customer);
		return reviewsList;
	}


	
	public HashMap<Long, Integer> getReviewsCount(List<Product> featProdList) {
		// TODO Auto-generated method stub
		
		/*List<Long> products=new ArrayList<Long>();
		for (Product integer : featProdList) {
			products.add(integer.getProductId());
			
		}
		
		String array= products.stream()
		        .map( n -> n.toString() )
		        .collect( Collectors.joining( "," ) );
		*/
		System.out.println("chekicng size in servuce implementaion"+featProdList.size());
		return reviewRepository.getReviewsCount(featProdList);
	}


	@Override
	public HashMap<Integer, Integer> getProductRatingCount(Long productId) {
		// TODO Auto-generated method stub
		return reviewRepository.getProductRatingCount(productId);
	}


	@Override
	public HashMap<Long, Double> getAverageRatingCountProducts(List<Product> featProdList) {
		// TODO Auto-generated method stub
		return reviewRepository.getAverageRatingCountProducts(featProdList);
	}


	@Override
	public Double getAverageRatingCountForProduct(Long productId) {
		// TODO Auto-generated method stub
		return reviewRepository.getAverageRatingCountProducts(productId);
	}

}
