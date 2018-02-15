package com.spring.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shopping.model.Category;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.SubCategory;
import com.spring.shopping.repository.AdminManageProductRepository;

@Service
public class AdminManageProductServiceImpl  implements AdminManageProductService{
	@Autowired
	AdminManageProductRepository adminManageProductRepository;
	
	
	
	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return adminManageProductRepository.getAllCategories();
	}



	public List<String> fetchSubCategories(String CategoryName) {
		// TODO Auto-generated method stub
		return adminManageProductRepository.fetchSubCategories(CategoryName);
	}



	public Long insertNewProduct(String categoryName, String subCategoryName, Product p,String type) {
		// TODO Auto-generated method stub
		 
		return adminManageProductRepository.insertNewProduct(categoryName,subCategoryName,p,type);
	}



	@Override
	public Long insertNewCategory(String categoryName) {
		// TODO Auto-generated method stub
		return adminManageProductRepository.insertNewCategory(categoryName);
	}

}
