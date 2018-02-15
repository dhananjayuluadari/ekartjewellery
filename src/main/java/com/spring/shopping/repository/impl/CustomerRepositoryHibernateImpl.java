package com.spring.shopping.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.shopping.model.Customer;
import com.spring.shopping.repository.CustomerRepository;


@Repository
public class CustomerRepositoryHibernateImpl implements CustomerRepository {
	@Autowired
	 private SessionFactory sessionFactory;
	public Customer validateUsers(String phoneNumber, String password) {
		// TODO Auto-generated method stub
		
		
	Session session = sessionFactory.openSession();
	Customer customer  = (Customer) session.createQuery("from Customer c where (c.phoneNumber=:phoneNumber or c.emailAddress=:phoneNumber) and c.password=:password").setParameter("phoneNumber", phoneNumber).setParameter("password", password).uniqueResult();
	
	System.out.println("chekcing customer size");
	return customer;
		
	}

	public Integer registerUser(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();	
		session.save(customer);
		tx.commit();
		return 1;
	}

	public boolean changePassword(String password, Customer customer) {
		// TODO Auto-generated method stub
Session session = sessionFactory.openSession();
		
		 customer=(Customer) session.createQuery("from Customer c where c.customerId=:customerId").setParameter("customerId", customer.getCustomerId()).uniqueResult();
		Transaction tx = session.beginTransaction();
		System.out.println("");
		customer.setPassword(password);
		session.saveOrUpdate(customer);
		tx.commit();
		return false;
	}

	public Customer getCustomerById(Long customerId) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Customer customer  = (Customer) session.createQuery("from Customer c where c.customerId=:customerId").setParameter("customerId", customerId).uniqueResult();
		
		System.out.println("chekcing customer size");
		return customer;
	}

	public Long getCustomerById(String userName) {
		// TODO Auto-generated method stub
		
		return null;
	}
	
	public Integer updateaccountinformation(Customer customer1) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		
		Customer customer=(Customer) session.createQuery("from Customer c where c.customerId=:customerId").setParameter("customerId", customer1.getCustomerId()).uniqueResult();
		
		Transaction tx = session.beginTransaction();
		System.out.println("");
		customer.setFirstName(customer1.getFirstName());
		customer.setUserName(customer1.getUserName());
		customer.setLastName(customer1.getLastName());
		customer.setPhoneNumber(customer1.getPhoneNumber());
		customer.setEmailAddress(customer1.getEmailAddress());
		session.saveOrUpdate(customer);
		tx.commit();
		return 1;
	}
}
