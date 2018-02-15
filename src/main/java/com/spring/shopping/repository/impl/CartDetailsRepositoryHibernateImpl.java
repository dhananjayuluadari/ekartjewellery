package com.spring.shopping.repository.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.shopping.model.CartDetails;
import com.spring.shopping.model.Product;
import com.spring.shopping.repository.CartDetailsRepository;
@Repository
public class CartDetailsRepositoryHibernateImpl implements CartDetailsRepository {

	@Autowired
	 private SessionFactory sessionFactory;
	
	public void addNewProduct(Long productId, Long customerId) {
		System.out.println("chekicng add new last page dhanaaaaaaaaaaaaaa");
		// TODO Auto-generated method stub
	Session session = sessionFactory.openSession();
	CartDetails cartDetails  = new CartDetails();
		 cartDetails  = (CartDetails) session.createQuery("from com.spring.shopping.model.CartDetails c where c.productId=:productId and c.customerId=:customerId").setParameter("productId", productId).setParameter("customerId", customerId).uniqueResult();
		
		Transaction tx = session.beginTransaction();
		
		if(cartDetails!=null){
			int quantity=cartDetails.getQuantity()+1;
			int detailsId=cartDetails.getDetailsId();
			System.out.println("data exists"+cartDetails.getQuantity()+"detailsId"+detailsId);
			cartDetails.setQuantity(quantity);
			cartDetails.setDetailsId(detailsId);
			session.saveOrUpdate(cartDetails);
			
		}else{
			System.out.println("NO data");
			CartDetails cartDetails1=new CartDetails();
			cartDetails1.setCustomerId(customerId);
			cartDetails1.setProductId(productId);
			cartDetails1.setQuantity(1);
			session.save(cartDetails1);
			}
		tx.commit();
		
	}

	@SuppressWarnings("unchecked")
	public List<Product> fetchCartDetails(Long customerId) {
		// TODO Auto-generated method stub
	Session session = sessionFactory.openSession();
		List<Product> productsList = new ArrayList<Product>();
		
		productsList=(List<Product>) session.createQuery("SELECT p.productId,p.name,p.price,p.manufacturer,c.customerId,c.quantity  From  Product p,CartDetails c  WHERE c.customerId = :customerId AND p.productId = c.productId").setParameter("customerId", customerId).list();
		return productsList;
	}

	public void updateProductCartQuantity(Long customerId, Long productId, int quantity) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		CartDetails cartDetails  = new CartDetails();
		cartDetails  = (CartDetails) session.createQuery("from com.spring.shopping.model.CartDetails c where c.productId=:productId and c.customerId=:customerId").setParameter("productId", productId).setParameter("customerId", customerId).uniqueResult();
		int detailsId=cartDetails.getDetailsId();
		Transaction tx = session.beginTransaction();
		cartDetails.setQuantity(quantity);
		cartDetails.setDetailsId(detailsId);
		session.saveOrUpdate(cartDetails);
		tx.commit();
	}
	
	public void removeProduct(Long customerId, Long productId) {
		// TODO Auto-generated method stub
		System.out.println("chekcing reomvie product hibernate code");
		
		Session session = sessionFactory.openSession();	
		Transaction tx = session.beginTransaction();
		String sql = "DELETE FROM com.spring.shopping.model.CartDetails c WHERE c.productId=:productId and c.customerId=:customerId";
        @SuppressWarnings("rawtypes")
		Query query = session.createQuery(sql);
        query.setParameter("productId", productId);
        query.setParameter("customerId", customerId);
        query.executeUpdate();
       tx.commit();
		
	}

	public void clearCart(Long customerId) {
		// TODO Auto-generated method stub
		System.out.println("clear cart delet query");
		Session session = sessionFactory.openSession();	
		Transaction tx = session.beginTransaction();
		String sql = "DELETE FROM com.spring.shopping.model.CartDetails c WHERE c.customerId=:customerId";
        @SuppressWarnings("rawtypes")
		Query query = session.createQuery(sql);
        query.setParameter("customerId", customerId);
        query.executeUpdate();
       tx.commit();
	}

	@Override
	public List<Product> fetchProductsList(Long customerId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();	
		@SuppressWarnings("unchecked")
		List<Product> productsList =  session.createQuery("from Product where productId IN(SELECT productId from CartDetails WHERE customerId=:customerId)").setParameter("customerId", customerId).list();
		
		System.out.println("chekcing fetch productss s     dhanaa productsList size"+productsList.size());
		return productsList;
		
	}
	
	

}
