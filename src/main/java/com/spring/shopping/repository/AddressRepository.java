package com.spring.shopping.repository;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.ShippingAddress;

public interface AddressRepository {

	public void saveAddress(AddressForm address, Customer customer);
	public AddressForm readAddressById(Long addressId);

	public AddressForm getCustomerAddress(Long customerId);
	public void saveShippingAddress(AddressForm address, Customer customer);
	public AddressForm getAddressByCustomerId(Long customerId);

	
}
