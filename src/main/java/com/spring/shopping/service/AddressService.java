package com.spring.shopping.service;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.ShippingAddress;

public interface AddressService {
	public void saveAddress(AddressForm address,Customer customer);
	AddressForm getAddressById(Long addressId);
	public AddressForm getCustomerAddress(Long customerId);
	public void saveShippingAddress(AddressForm address, Customer customer);
	AddressForm getAddressByCustomerId(Long customerId);
}
