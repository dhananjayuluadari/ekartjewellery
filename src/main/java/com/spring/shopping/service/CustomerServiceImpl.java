package com.spring.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shopping.model.Customer;
import com.spring.shopping.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	
	public Customer validateUsers(String phoneNumber, String password) {
		System.out.println("3333333333333333 ctomer servuceimpl class from customer service interface before customer controlleer class "+"phoneNumber"+phoneNumber+"password"+password);
		Customer customer = customerRepository
				.validateUsers(phoneNumber, password);
		return customer;
	}

	
	public Integer registerUser(Customer customer) {
		customer.setRole("USER");
		return customerRepository.registerUser(customer);
	}

	
	public boolean changePassword(String password, Customer customer) {
		return customerRepository.changePassword(password, customer);
	}

	
	public Customer getCustomerById(Long customerId) {
		return customerRepository.getCustomerById(customerId);
	}

	
	public Long getCustomerId(String userName) {
		return customerRepository.getCustomerById(userName);
	}
	
	public Integer updateaccountinformation(Customer customer) {
		return customerRepository.updateaccountinformation(customer);
	}

}
