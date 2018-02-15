package com.spring.shopping.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shopping.model.Customer;
import com.spring.shopping.repository.CartRepository;
import com.spring.shopping.repository.CustomerRepository;
import com.spring.shopping.service.CartData;
@Repository
public class CartRepositoryHibernateImpl implements CartRepository {

	@Autowired
	 private SessionFactory sessionFactory;
	public CartData getCartDataByCustomer(Long customerId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		CartData cartData  = null;//(CartData) session.createQuery("from Customer c where c.userName=:userName and c.password=:password").setParameter("userName", userName).setParameter("password", password).uniqueResult();
		
		System.out.println("chekcing customer size");
		return cartData;
	}

}
