package com.spring.shopping.repository;

import java.util.List;

import com.spring.shopping.model.Category;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.SubCategory;

public interface AdminManageProductRepository {

	public List<Category> getAllCategories();

	public List<String> fetchSubCategories(String CategoryName);

	public Long insertNewProduct(String categoryName, String subCategoryName, Product p,String type);

	public Long insertNewCategory(String categoryName);
}
