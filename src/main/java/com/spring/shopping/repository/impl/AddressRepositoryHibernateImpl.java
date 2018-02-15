package com.spring.shopping.repository.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.ShippingAddress;
import com.spring.shopping.repository.AddressRepository;
@Repository
public class AddressRepositoryHibernateImpl implements AddressRepository {

	@Autowired
	 private SessionFactory sessionFactory;
	public void saveAddress(AddressForm address,Customer customer) {
		System.out.println("address insering");
		System.out.println("customer"+customer.getCustomerId());
		System.out.println("addres info"+address.getAddress1());
		Session session = sessionFactory.openSession();
		/*AddressForm	address1=(AddressForm) session.createQuery("from AddressForm a where a.customerId=:customerId").setParameter("customerId", customer.getCustomerId()).uniqueResult();*/
			Transaction tx = session.beginTransaction();
			System.out.println("updating or saving");
			/*address1.setFullName(address.getFullName());
			address1.setAddress1(address.getAddress1());
			address1.setAddress2(address.getAddress2());
			address1.setCity(address.getCity());
			address1.setState(address.getState());
			address1.setZipCode(address.getZipCode());*/
			session.save(address);
			tx.commit();
	}

	public AddressForm readAddressById(Long addressId) {
		
		Session session = sessionFactory.openSession();
		
		AddressForm shippingAddress  = (AddressForm) session.createQuery("from AddressForm a where a.addressId=:addressId").setParameter("addressId", addressId).uniqueResult();
		
		System.out.println("chekcing customer size"+shippingAddress.getFullName()+"city"+shippingAddress.getCity());
		return shippingAddress;
	}

	@SuppressWarnings("rawtypes")
	public AddressForm getCustomerAddress(Long customerId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		System.out.println("chekicng customerid "+customerId);
		@SuppressWarnings("deprecation")
		Query query = (Query) session.createQuery("from AddressForm a where a.customerId=:customerId ORDER BY addressId DESC");
		query.setParameter("customerId", customerId);
		query.setMaxResults(1);
		AddressForm addressForm  =(AddressForm) query.uniqueResult();
		//System.out.println("chekcing customer size"+addressForm.getFullName()+"city"+addressForm.getCity());
		return addressForm;
	}

	@Override
	public void saveShippingAddress(AddressForm address, Customer customer) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		//AddressForm	address1=(AddressForm) session.createQuery("from shippingAddress a where a.customerId=:customerId").setParameter("customerId", customer.getCustomerId()).uniqueResult();
			Transaction tx = session.beginTransaction();
			System.out.println("updating or saving");
			
			session.saveOrUpdate(address);
			tx.commit();
	}

	@Override
	public AddressForm getAddressByCustomerId(Long customerId) {
		// TODO Auto-generated method stub
Session session = sessionFactory.openSession();   //select f from FeatureList f where f.version = (select max(ff.version) from FeatureList ff where ff.name = f.name);
		
@SuppressWarnings({ "rawtypes", "deprecation" })
Query query = (Query) session.createQuery("from AddressForm a where a.customerId=:customerId ORDER BY addressId DESC");
query.setParameter("customerId", customerId);
query.setMaxResults(1);
AddressForm addressForm  =(AddressForm) query.uniqueResult();
		//System.out.println("chekcing customer size"+shippingAddress.getFullName()+"city"+shippingAddress.getCity());
		return addressForm;
	}

	
}
