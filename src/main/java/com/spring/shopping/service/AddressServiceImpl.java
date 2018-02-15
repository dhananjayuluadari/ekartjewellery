package com.spring.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.ShippingAddress;
import com.spring.shopping.repository.AddressRepository;
import com.spring.shopping.util.Utility;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	AddressRepository addressRepository;

	public void saveAddress(AddressForm address, Customer customer) {
		Long addressId = Utility.generateAddressNumber(address, customer);
		
		addressRepository.saveAddress(address,customer);
	}

	
	public AddressForm getAddressById(Long addressId) {
		return addressRepository.readAddressById(addressId);
	}


	public AddressForm getCustomerAddress(Long customerId) {
		// TODO Auto-generated method stub
		return addressRepository.getCustomerAddress(customerId);
	}


	@Override
	public void saveShippingAddress(AddressForm address, Customer customer) {
		// TODO Auto-generated method stub
//Long addressId = Utility.generateAddressNumber(shippingAddress, customer);
		
		addressRepository.saveShippingAddress(address,customer);
		
		
	}


	@Override
	public AddressForm getAddressByCustomerId(Long customerId) {
		// TODO Auto-generated method stub
		return addressRepository.getAddressByCustomerId(customerId);
	}

}