package com.spring.shopping.repository;

import java.util.List;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Orders;
import com.spring.shopping.model.OrderItem;
import com.spring.shopping.model.Product;

public interface OrderRepository {
	void createOrder(Orders order, List<OrderItem> orderItemsList,AddressForm address);

	List<Product> readAllOrderItems(Orders order);

	List<Orders> readAllOrdersForCustomer(Customer customer);

	Orders readOrderById(String orderId);

	Orders placeOrder(List<CartProducts> CartProductsList,Customer customer);

	List<OrderItem> getAllOrderItemsCustomer(Customer customer);

	List<OrderItem> getAllOrderItemsBasedonOrders(Orders o);

	
}
