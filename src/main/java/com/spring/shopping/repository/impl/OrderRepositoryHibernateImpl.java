package com.spring.shopping.repository.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Orders;
import com.spring.shopping.model.OrderItem;
import com.spring.shopping.model.Product;
import com.spring.shopping.repository.OrderRepository;
import com.spring.shopping.util.Utility;


@Repository
public class OrderRepositoryHibernateImpl implements OrderRepository {

	@Autowired
	 private SessionFactory sessionFactory;	
	private final String PENDING_ORDER_STATUS = "Pending";
	public void createOrder(Orders order, List<OrderItem> orderItemsList,
			AddressForm address) {
		// TODO Auto-generated method stub

	}

	
	public List<Product> readAllOrderItems(Orders order) {
		// TODO Auto-generated method stub
		System.out.println("chekicng odrer id"+order.getOrderId());
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Product> productList =  session.createQuery("From Product p WHERE p.productId IN(select o.productId from OrderItem o where o.ordersId = :ordersId)").setParameter("ordersId", order.getOrdersId()).list();
		
		System.out.println("chekcing productsList size"+productList.size());
		return productList;
		
	}

	
	public List<Orders> readAllOrdersForCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Orders> ordersList =  session.createQuery("from Orders o where o.customerId= :customerId").setParameter("customerId", customer.getCustomerId()).list();
		
		System.out.println("chekcing productsList size"+ordersList.size());
		return ordersList;
		
	}

	
	public Orders readOrderById(String ordersId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Orders order =  (Orders) session.createQuery("from Orders o where o.ordersId=:ordersId").setParameter("ordersId", ordersId).uniqueResult();
		
		System.out.println("chekcing orderId size"+ordersId);
		
		return order;
	}


	@Override
	public Orders placeOrder(List<CartProducts> CartProductsList,Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(date);
		Date presentDate=null;
		try {
			presentDate = dateFormat.parse(formattedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Long addressId=CartProductsList.get(0).getAddressId();
		System.out.println("address id onfo plave order"+CartProductsList.get(0).getAddressId());
		java.util.Date sqlDate = new java.util.Date(presentDate.getTime());
		Long orderId = Utility.generateOrderNumber(date, customer);
		Orders order = new Orders();
		order.setOrderId(orderId);
		order.setCreatedDate(sqlDate);
		order.setUpdatedDate(sqlDate);
		order.setEmailAddress(customer.getEmailAddress());
		order.setOrderStatus(PENDING_ORDER_STATUS);
		order.setOrderTotal(CartProductsList.get(0).getOrderTotal());
		order.setCustomerId(customer.getCustomerId());
		order.setAddressId(addressId);
		order.setOrdersId(CartProductsList.get(0).getOrdersId());
		order.setCardNumberLast4(CartProductsList.get(0).getCardNumberLast4());
		order.setFormUrl(CartProductsList.get(0).getFormUrl());
		session.save(order);
		System.out.println("chekicng order value"+orderId);
		tx.commit();
		
		Transaction tx1 = session.beginTransaction();
		Long orderId1 = Utility.generateOrderNumber(date, customer);
	for (int i = 0; i < CartProductsList.size(); i++) {
			
		
			
			OrderItem orderItem=new OrderItem();
			
			System.out.println("chekicng order value111111111111111111111"+orderId);
			orderItem.setCategoryId(CartProductsList.get(i).getCategoryId());
			orderItem.setSubCategoryId(CartProductsList.get(i).getSubCategoryId());
			orderItem.setProductId(CartProductsList.get(i).getProductId());
			orderItem.setPrice(CartProductsList.get(i).getPrice());
			orderItem.setProductName(CartProductsList.get(i).getName());
			orderItem.setQuantity(CartProductsList.get(i).getQuantity());
			orderItem.setOrdersId(CartProductsList.get(i).getOrdersId());
			orderItem.setOrderId(orderId1);
			
			session.save(orderItem);
			
			//orderItem.setQuantity(productsList.get(i).get);
		}
	tx1.commit();
	return order;	
	}


	@Override
	public List<OrderItem> getAllOrderItemsCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<OrderItem> OrderItemsList =  session.createQuery("from OrderItem o where o.customerId= :customerId").setParameter("customerId", customer.getCustomerId()).list();
		
		System.out.println("chekcing OrderItemsList size"+OrderItemsList.size());
		return OrderItemsList;
	}


	@Override
	public List<OrderItem> getAllOrderItemsBasedonOrders(Orders o) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
List<OrderItem> OrderItemsList =  session.createQuery("from OrderItem o where o.ordersId= :ordersId").setParameter("ordersId", o.getOrdersId()).list();
		
		System.out.println("chekcing OrderItemsList size"+OrderItemsList.size());
		return OrderItemsList;
	}


	

}
