package com.spring.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shopping.model.Category;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.SubCategory;
import com.spring.shopping.repository.CategoryConfigRepository;

@Service

public class CategoryConfigServiceImpl implements CategoryConfigService {
	@Autowired
	private CategoryConfigRepository categoryConfigRepository;

	/**
	 * Method to Get All Categories
	 * 
	 * @returns Categories List
	 */
	@Transactional
	public List<Category> getAllCategories() {
		List<Category> categoryList = categoryConfigRepository
				.readAllCategories();
		return categoryList;
	}

	/**
	 * Method to Get All SubCategories
	 * 
	 * @returns SubCategories List
	 */
	@Transactional
	public List<SubCategory> getAllSubCategories() {
		// Code to Retrieve All SubCategories
		// in the Application
		return null;
	}

	/**
	 * Method to Get a Category by a given Product ID
	 * 
	 * @returns Category
	 */
	@Transactional
	public Long getCategoryByProductId(Product product) {
		Long categoryId = categoryConfigRepository
				.readCategoryByProductId(product);
		return categoryId;
	}

	/**
	 * Method to Get a Category by a given SubCategory ID
	 * 
	 * @returns Category
	 */
	@Transactional
	public Category getCategoryBySubCategoryId() {
		// Code to Retrieve Category By SubCategory ID
		// in the Application
		return null;
	}

	/**
	 * Method to Get a Category by a given SubCategory Name
	 * 
	 * @returns Category
	 */
	@Transactional
	public Category getCategoryBySubCategoryName() {
		// TODO
		// Code to Retrieve Category By SubCategory Name
		// in the Application
		return null;
	}

	/**
	 * Method to Get a SubCategory by a given Category ID
	 * 
	 * @returns SubCategory
	 */
	@Transactional
	public SubCategory getSubCategoryByCategoryId() {
		// Code to Retrieve SubCategory By Category ID
		// in the Application
		return null;
	}

	/**
	 * Method to Get a SubCategory by a given Category Name
	 * 
	 * @returns Category
	 */
	@Transactional
	public SubCategory getSubCategoryByCategoryName() {
		// Code to Retrieve SubCategory By Category Name
		// in the Application
		return null;
	}

	/**
	 * Method to Get a SubCategory by a given Product Id
	 * 
	 * @returns SubCategory
	 */
	@Transactional
	public Long getSubCategoryByProductId(Product product) {
		Long subCategoryId = categoryConfigRepository
				.readSubCategoryByProductId(product);
		return subCategoryId;
	}

	/**
	 * Method to Get a SubCategory by a given Product Id
	 * 
	 * @returns Map of Category and List<SubCategory>
	 */
	@Transactional
	public List<SubCategory> getAllSubCategoriesByCategoryId(Long categoryId) {
		List<SubCategory> subCatList = categoryConfigRepository
				.readAllSubCategoriesByCategoryId(categoryId);
		return subCatList;
	}
	@Transactional
	public Map<Category, List<SubCategory>> getCategoriesMap() {

		List<Category> categoriesList = getAllCategories();
		Map<Category, List<SubCategory>> categoryMap = new HashMap<Category, List<SubCategory>>();
		System.out.println("soize of categoriesList "+categoriesList.size()+"categoryMap"+categoryMap.size());
		for (Category category : categoriesList) {
			System.out.println("in loop   chekicng category");
			List<SubCategory> subCategoryList = getAllSubCategoriesByCategoryId(category
					.getcategoryId());
			categoryMap.put(category, subCategoryList);
		}

		return categoryMap;
	}

	/**
	 * Method to Get List of Products by a given Category
	 * 
	 * @returns Map of List<Product>
	 */
	@Transactional
	public List<Product> getProductsByCategory(String categoryName) {

		List<Product> productsList = categoryConfigRepository
				.getProductsByCategory(categoryName);
		return productsList;
	}

	@Transactional
	public List<Product> getProductsBySubCategory(Long subCategoryId) {
		List<Product> prodListBySubCat = categoryConfigRepository.getProductsBySubCategory(subCategoryId);
		return prodListBySubCat;
	}

	@Override
	public List<Product> getProductsByNameContent(String searchcontent) {
		// TODO Auto-generated method stub
		List<Product> searchprodListByNameContent = categoryConfigRepository.getProductsByNameContent(searchcontent);
		return searchprodListByNameContent;
	}

}
