package com.spring.shopping.repository.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ReviewForm;
import com.spring.shopping.repository.ReviewRepository;


@Repository
public class ReviewRepositoryHibernateImpl implements ReviewRepository {

	@Autowired
	 private SessionFactory sessionFactory;
	
	public void reviewProduct(ReviewForm reviewForm) {
         System.out.println("chekicng insertig Reviwsssss starting");
         
		Session session = sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		session.save(reviewForm);
		tx.commit();
		System.out.println("chekicng insertig Reviwsssss ending");
	}

	
	@SuppressWarnings("unchecked")
	public List<ReviewForm> getProductReviews(Long productId) {
		System.out.println("chekicng getProductReviews "+productId);
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		List<ReviewForm> reviewsList = new ArrayList<ReviewForm>();
		reviewsList=session.createQuery("FROM ReviewForm r where r.productId = :productId").setParameter("productId", productId).list();
		
		System.out.println("chekcing fetchreviewsRepositoryDetails reviewsList size "+reviewsList.size());
		return reviewsList;
		
	}

	
	public List<ReviewForm> getReviewByCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}


	
	public HashMap<Long, Integer> getReviewsCount(List<Product> featProdList) {
		// TODO Auto-generated method stub
		System.out.println("Dhnaaaa chekkicing size in hql"+featProdList.size());
		Session session = sessionFactory.openSession();
		HashMap<Long, Integer> count=new HashMap<Long, Integer>();
		
			for (int i = 0; i < featProdList.size(); i++) {
			System.out.println("insdie for loppp chekicn"+featProdList.get(i).getProductId());
			String hql = "select count(productId) from ReviewForm r WHERE r.productId = :productId";
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			query.setParameter("productId",featProdList.get(i).getProductId());
			@SuppressWarnings("rawtypes")
			List listResult = query.list();
			
			Long count1 = (Long)listResult.get(0);
				Integer total = count1.intValue();
			 System.out.println("Dhnaaaa"+i);
	        System.out.println("Number of Employee: " + count1);
	        count.put(featProdList.get(i).getProductId(), total);
	        
		}
			
		return count;
	}


	@Override
	public HashMap<Integer, Integer> getProductRatingCount(Long productId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		HashMap<Integer, Integer> count=new HashMap<Integer, Integer>();
		for (int i = 1; i <=5; i++) {
		String hql = "select count(productId) from ReviewForm r WHERE r.productId = :productId AND r.ratingforproduct= :ratingforproduct";
		@SuppressWarnings("rawtypes")
		Query query = session.createQuery(hql);
		query.setParameter("productId",productId);
		query.setParameter("ratingforproduct",i);
		List listResult = query.list();
		
		Long count1 = (Long)listResult.get(0);
			Integer total = count1.intValue();
			 count.put(i, total);
		}
		return count;
	}


	@Override
	public HashMap<Long, Double> getAverageRatingCountProducts(List<Product> featProdList) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		HashMap<Long, Double> count=new HashMap<Long, Double>();
		
			for (int i = 0; i < featProdList.size(); i++) {
			System.out.println("insdie for loppp chekicn"+featProdList.get(i).getProductId());
			String hql = "select avg(ratingforproduct) from ReviewForm r WHERE r.productId = :productId";
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			query.setParameter("productId",featProdList.get(i).getProductId());
			List listResult = query.list();
			
			//Double count1 = (Double) listResult.get(0);
			Double count1 = ((Double) listResult.get(0));
			System.out.println("cchekicng cunto of sum");
			System.out.println("count1"+count1);
			Double total =0.00;
			if (count1!=null) {
				total = count1.doubleValue();
				System.out.println("if loop");
			}else{
				System.out.println("else loop");
			}
			 
			//total=total/5;
			System.out.println("total "+total);
			total=(total*100)/5;
			System.out.println("total percnet"+total);
			 System.out.println("Dhnaaaa"+i);
	        System.out.println("Number of Employee: " + count1);
	        count.put(featProdList.get(i).getProductId(), total);
	        
		}
			
		return count;
	}


	@Override
	public Double getAverageRatingCountProducts(Long productId) {
		Session session = sessionFactory.openSession();
		String hql = "select avg(ratingforproduct) from ReviewForm r WHERE r.productId = :productId";
		@SuppressWarnings("rawtypes")
		Query query = session.createQuery(hql);
		query.setParameter("productId",productId);
		Double Value= (Double) query.uniqueResult();
		if (Value!=null && Value>0) {
			Value=(Value*100)/5;
		}
		
		// TODO Auto-generated method stub
		return Value;
	}

}
