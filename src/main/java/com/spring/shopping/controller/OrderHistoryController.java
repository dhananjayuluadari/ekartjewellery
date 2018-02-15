package com.spring.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.OrderItem;
import com.spring.shopping.model.Orders;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ShippingAddress;
import com.spring.shopping.service.AddressService;
import com.spring.shopping.service.CartDetailsService;
import com.spring.shopping.service.OrderService;
import com.spring.shopping.util.SessionUtils;

@Controller
public class OrderHistoryController {

	private static String orderHistoryPage = "template/ordersList";
	private static String orderDetailsPage = "template/orderDetails";
	@SuppressWarnings("unused")
	private HttpSession session;
	@Autowired
	private OrderService orderService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private CartDetailsService cartDetailsService;

	@RequestMapping(value = "/orderHistory", method = RequestMethod.GET)
	public String getOrderHistoryPage(HttpServletRequest request, Model model) {
		//model.addAttribute("page", orderHistoryPage);
		session = SessionUtils.createSession(request);
		Customer customer = SessionUtils.getSessionVariables(request, "customer");
		if (customer != null) {
			List<Orders> orderList = orderService
					.getAllOrdersForCustomer(customer);
			Map<List<Orders>, List<Product>> orderMap = new HashMap<List<Orders>, List<Product>>();
			List<OrderItem> orderItemsList=new ArrayList<>();
			// orderItemsList = orderService.getAllOrderItemsCustomer(customer);
			for (Orders o : orderList) {
				// orderItemsList = orderService.getAllOrderItems(o);
				List<OrderItem> temporderItemsList = orderService.getAllOrderItemsBasedonOrders(o);
				for (OrderItem oi : temporderItemsList) {
					orderItemsList.add(oi);
				}
				System.out.println("orderItemsList cheincg be"+orderItemsList.size());
				//orderMap.put(orderList, orderItemsList);
			}
			
			int cartSize=cartDetailsService.cartSize(request);
			System.out.println("orderItemsList "+orderItemsList);
			System.out.println("orderItemsList size "+orderItemsList.size());
			
			model.addAttribute("cartSize", cartSize);
			System.out.println("orderList size"+orderList.size());
			model.addAttribute("orderList", orderList);
			model.addAttribute("orderItemsList", orderItemsList);
			
			System.out.println("chekicng after model atibytr");
		}
		//return "account";
		return orderHistoryPage;
	}

	@RequestMapping(value = "/orderDetails", method = RequestMethod.GET)
	public String getOrderDetails(HttpServletRequest request, Model model,
			@RequestParam(value = "id") String id) {
		Orders order = orderService.getOrderById(id);
		System.out.println("order idd information"+order.getOrderId()+"address id"+order.getAddressId());
		AddressForm shippingAddress = addressService.getAddressById(order
				.getAddressId());
		List<Product> orderItemsList = orderService.getAllOrderItems(order);
		model.addAttribute("order", order);
		model.addAttribute("addressDetails", shippingAddress);
		model.addAttribute("orderItemsList", orderItemsList);
		model.addAttribute("page", orderDetailsPage);
		return "account";
	}

}