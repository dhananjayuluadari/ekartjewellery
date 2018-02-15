package com.spring.shopping.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ProductSpecifications;
import com.spring.shopping.model.ProductViews;
import com.spring.shopping.repository.ProductConfigRepository;
@Repository
public class ProductConfigRepositoryHibernateImpl implements
		ProductConfigRepository {

	@Autowired
	 private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Product> readFeaturedProducts() {
		// TODO Auto-generated method stub
		int number = 1;
		
		Session session = sessionFactory.openSession();
		List<Product> productsList =  session.createQuery("from Product where Featured= :number").setParameter("number", number).list();
		
		System.out.println("chekcing productsList size"+productsList.size());
		return productsList;
		
	}

	
	public Product readProductById(Long productId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Product product =  (Product) session.createQuery("from Product p where p.productId=:productId").setParameter("productId", productId).uniqueResult();
		
		System.out.println("chekcing product size"+productId);
		return product;
		
		
	}


	@Override
	public List<Product> readAllProducts() {
		// TODO Auto-generated method stub

		
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Product> productsList =  session.createQuery("from Product").list();
		System.out.println("chekicng hibenrta");
		System.out.println("chekcing productsList size in view products hql"+productsList.size());
		return productsList;
	}


	@Override
	public Object readAllProductInfoById(Long productId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		                                                                                         
		Object product = session.createNativeQuery("SELECT p.Product_Id,p.name AS productname,p.description,p.price,p.Manufacturer,c.name AS categoryname,s.name as subcategoryname,p.available,p.category_id,p.featured,p.subcategory_id,p.offerprice,p.discountpercent,p.discountamount FROM ekart.product p JOIN ekart.category c  ON p.category_id = c.category_id JOIN ekart.subcategory s ON p.subcategory_id = s.subcategory_id AND p.Product_Id="+productId).uniqueResult();
		
		System.out.println("chekcing product size"+productId);
		return product;
	}


	@Override
	public void editProductInformation(Product p) {
		// TODO Auto-generated method stub
Session session = sessionFactory.openSession();
		
		Transaction tx = session.beginTransaction();
		System.out.println(" editProductInformation saving hibenrate");
		session.saveOrUpdate(p);
		tx.commit();
	}


	@Override
	public void insertOrUpdateProductViews(Long productId, Long customerId) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		ProductViews productViews = new ProductViews();
		 productViews =  (ProductViews) session.createQuery("from ProductViews p where p.productId=:productId AND p.customerId=:customerId").setParameter("productId", productId).setParameter("customerId", customerId).uniqueResult();
		System.out.println("insertOrUpdateProductViews hibenrta mpl"+productId+" customerId"+customerId);
		if(productViews!=null){
			int views=productViews.getViews();
			productViews.setProductId(productId);
			productViews.setCustomerId(customerId);
			productViews.setViews(views+1);
			session.saveOrUpdate(productViews);
		}else{
			productViews = new ProductViews();
			productViews.setProductId(productId);
			productViews.setCustomerId(customerId);
			productViews.setViews(1);
			session.save(productViews);
		}
		tx.commit();
	
	}


	@Override
	public List<ProductSpecifications> getProductSpecificationsById(Long productId) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<ProductSpecifications> ProductSpecifications =  session.createQuery("from ProductSpecifications p where p.productId=:productId").setParameter("productId", productId).list();
		System.out.println("chekicng hibenrta");
		System.out.println("chekcing ProductSpecifications size in view products hql"+ProductSpecifications.size());
		return ProductSpecifications;
		
	}

}
