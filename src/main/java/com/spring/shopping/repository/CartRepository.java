package com.spring.shopping.repository;

import com.spring.shopping.model.Customer;
import com.spring.shopping.service.CartData;

public interface CartRepository {

	
	public CartData getCartDataByCustomer(Long customerId);
}
