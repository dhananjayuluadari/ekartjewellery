package com.spring.shopping.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.spring.shopping.model.CartDetails;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.WishList;
import com.spring.shopping.repository.WishListRepository;
@Repository
public class WishListRepositoryHibernateImpl implements WishListRepository {

	@Autowired
	 private SessionFactory sessionFactory;
	
	public boolean addProductToWishList(Product product, Customer customer) {
		Session session = sessionFactory.openSession();
		WishList wishList  = new WishList();
		wishList  = (WishList) session.createQuery("FROM WishList w where w.productId=:productId and w.customerId=:customerId").setParameter("productId", product.getProductId()).setParameter("customerId", customer.getCustomerId()).uniqueResult();
			
Transaction tx = session.beginTransaction();
		
		if(wishList!=null){
			
			tx.commit();
			return false;
		}else{
			System.out.println("NO data");
			WishList wishList1=new WishList();
			wishList1.setCustomerId(customer.getCustomerId());
			wishList1.setProductId(product.getProductId());
			
			session.save(wishList1);
			tx.commit();
			return true;
			}
		
		
	}

	
	@SuppressWarnings("unchecked")
	public List<Product> readProductsInWishList(Customer customer) {
		Session session = sessionFactory.openSession();
		List<Product> productsList = new ArrayList<Product>();
		productsList=session.createQuery("From Product p WHERE p.productId IN(select w.productId from WishList w where w.customerId = :customerId)").setParameter("customerId", customer.getCustomerId()).list();
		
		System.out.println("chekicng wishlist product list size"+productsList.size());
		return productsList;
	}

	
	public boolean checkIfProductAvailableInWishList(Product product) {
		return false;
	}

	
	public void deleteProductFromWishList(Product product,Long customerId) {

		Session session = sessionFactory.openSession();	
		
		Transaction tx = session.beginTransaction();
		String sql = "DELETE FROM WishList w WHERE w.productId=:productId and w.customerId=:customerId";
        @SuppressWarnings("rawtypes")
		Query query = session.createQuery(sql);
        System.out.println("chekicng product"+product.getProductId()+"customerId"+customerId);
        query.setParameter("productId", product.getProductId());
        query.setParameter("customerId",customerId);
        query.executeUpdate();
       tx.commit();
	
		
	}

}
