package com.spring.shopping.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shopping.model.Category;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.SubCategory;
import com.spring.shopping.repository.AdminManageProductRepository;
@Repository
public class AdminManageProductRepositoryHibernateImpl  implements AdminManageProductRepository{

	@Autowired
	 private SessionFactory sessionFactory;
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		List<Category> CategoryList =  session.createQuery("from Category").list();
		
		System.out.println("chekcing CategoryList last man size"+CategoryList.size());
		return CategoryList;
		
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<String> fetchSubCategories(String CategoryName) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		System.out.println("chekcing fetchSubCategories json hobenrtae ");
		/*List<Product> productList =  session.createQuery("From Product p WHERE p.productId IN(select o.productId from OrderItem o where o.orderId = :orderId)").setParameter("orderId", order.getOrderId()).list();
		*/
		
		/*query = session.createQuery("select e.name, a.city from Employee e "
				+ "INNER JOIN e.address a");*/
		//Query q = em.createNativeQuery("select e.name from employee_master e where e.id = ?");
		List<String> SubCategoryList = session.createNativeQuery("SELECT s.name FROM SubCategory s WHERE s.category_Id IN(SELECT c.category_Id from Category c WHERE c.name='"+CategoryName+"')").list();
		//List<String> SubCategoryList = session.createQuery("SELECT subCategoryName from SubCategory s where s.categoryId IN(SELECT c.categoryId from Category c WHERE c.name=:CategoryName)").setParameter("name", CategoryName).list();
		
		System.out.println("chekcing SubCategoryList last men size"+SubCategoryList.size());
		return SubCategoryList;
		
	}

	@Transactional
	public Long insertNewProduct(String categoryName, String subCategoryName, Product p,String type) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Category category=null;
		SubCategory subCategory=null;
		if("categorytype".equals(type)){
			Transaction tx = session.beginTransaction();
			 category=new Category();
			category.setCategoryName(categoryName);
			session.save(category);
			tx.commit();
		}else{
			 category=(Category) session.createQuery("from Category c where c.categoryName=:categoryName").setParameter("categoryName",categoryName).uniqueResult();
			
		}
		if("categorytype".equals(type) || "SubCategorytype".equals(type)){
		Transaction tx1 = session.beginTransaction();
		 subCategory=new SubCategory();
		subCategory.setCategoryId(category.getcategoryId());
		subCategory.setSubCategoryName(subCategoryName);
		session.save(subCategory);
		tx1.commit();
		}else{
			subCategory=(SubCategory) session.createQuery("from SubCategory s where s.subCategoryName=:subCategoryName").setParameter("subCategoryName",subCategoryName).uniqueResult();
			
		}
	System.out.println("chekcing catgeory id dhana"+category.getcategoryId()+"subcate"+subCategory.getSubCategoryId());
	Transaction tx2 = session.beginTransaction();
		Product product=new Product();
		product.setName(p.getName());
		product.setPrice(p.getPrice());
		product.setDescription(p.getDescription());
		product.setAvailable(p.getAvailable());
		product.setFeatured(1);
		product.setSubCategoryId(subCategory.getSubCategoryId());
		product.setCategoryId(category.getcategoryId());
		product.setManufacturer(subCategory.getSubCategoryName());
		session.save(product);
		tx2.commit();
		
		Long productId=product.getProductId();
		return productId;
	}

	@Override
	public Long insertNewCategory(String categoryName) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Category category=new Category();
		category.setCategoryName(categoryName);
		session.save(category);
			tx.commit();
			Long categoryId=category.getcategoryId();
		return categoryId;
	}
	
	

}
