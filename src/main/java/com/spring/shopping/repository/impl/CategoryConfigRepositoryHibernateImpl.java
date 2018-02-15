package com.spring.shopping.repository.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shopping.model.Category;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.SubCategory;
import com.spring.shopping.repository.CategoryConfigRepository;




@Repository
public class CategoryConfigRepositoryHibernateImpl implements
		CategoryConfigRepository {
	@Autowired
	 private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	public List<Category> readAllCategories() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();

	/*	List<SubCategory> subCategoryList = session.createQuery("from SubCategory").list();
		System.out.println("chekcing subCategoryList size"+subCategoryList.size());*/
		List<Category> CategoryList = session.createQuery("from Category").list();
		System.out.println("chekcing ctaegory size"+CategoryList.size());
		
		
		return CategoryList;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SubCategory> readAllSubCategories() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<SubCategory> subCategoryList = session.createQuery("from SubCategory").list();
		System.out.println("chekcing subctaegory size"+subCategoryList.size());
		return subCategoryList;
		
	}

	public Long readCategoryByProductId(Product product) {
		// TODO Auto-generated method stub
		return null;
	}

	public Category readCategoryBySubCategoryId(Long subCategoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Category readCategoryBySubCategoryName(String subCategoryName) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<SubCategory> readSubCategoryByCategoryId(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	public SubCategory readSubCategoryByCategoryName(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long readSubCategoryByProductId(Product Product) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<SubCategory> readAllSubCategoriesByCategoryId(Long categoryId) {
		// TODO Auto-generated method stub
	
		Session session = sessionFactory.getCurrentSession();
		List<SubCategory> subCategoryList = session.createQuery("from SubCategory where categoryId= :categoryId").setParameter("categoryId", categoryId).list();
		
		System.out.println("chekcing subctaegory id size"+subCategoryList.size());
		return subCategoryList;
		
	}

	public List<Product> getProductsByCategory(String categoryName) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Product> getProductsBySubCategory(Long subCategoryId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Product> subCatProdList = session.createQuery("from Product where subCategoryId=:subCategoryId").setParameter("subCategoryId", subCategoryId).list();
		
		System.out.println("chekcing subctaegory id size"+subCatProdList.size());
		return subCatProdList;
		
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Product> getProductsByNameContent(String description) {
		// TODO Auto-generated method stub
		System.out.println("");
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		
		String hql = "from Product p where p.description like :description";
		
		@SuppressWarnings("deprecation")
		Query query = session.createQuery(hql);
		query.setParameter("description", "%"+description + "%");
		 
		@SuppressWarnings("unchecked")
		List<Product> listProducts = query.list();
		
	        return listProducts;
	       
	}

}
