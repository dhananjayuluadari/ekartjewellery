package com.spring.shopping.service;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.easypost.model.Tracker;
import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.OrderItem;
import com.spring.shopping.model.Orders;
import com.spring.shopping.model.Product;

public interface OrderService {
	public Orders createOrder(CartService cartService,
			Customer customer, AddressForm address, HttpServletRequest request) throws ParseException;
	public List<Product> getAllOrderItems(Orders order);
	
	public List<Orders> getAllOrdersForCustomer(Customer customer);
	
	Orders getOrderById(String orderId);
	
	public Orders placeOrder(List<CartProducts> CartProductsList,Customer customer);
	
	public Tracker createTracking();
	public List<OrderItem> getAllOrderItemsCustomer(Customer customer);
	public List<OrderItem> getAllOrderItemsBasedonOrders(Orders o);

}
