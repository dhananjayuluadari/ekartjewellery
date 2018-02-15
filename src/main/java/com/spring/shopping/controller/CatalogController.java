package com.spring.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.Category;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.SubCategory;
import com.spring.shopping.model.Tag;
import com.spring.shopping.service.CartDetailsService;
import com.spring.shopping.service.CartService;
import com.spring.shopping.service.CategoryConfigService;
import com.spring.shopping.service.CustomerService;
import com.spring.shopping.service.ProductConfigService;
import com.spring.shopping.service.ReviewService;
import com.spring.shopping.util.SessionUtils;

/**
 * @author Dhana Handles requests for the application home page.
 */
@Controller
@Configuration

public class CatalogController {

	@Autowired
	private CategoryConfigService categoryConfigurationService;
	@Autowired
	private ProductConfigService productConfigurationService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ServletContext context;
	@Autowired
	private CartDetailsService cartDetailsService;
//	@Autowired
//	private CartService cartService;

	private String accountsTemplatePage = "template/accountInformation";

	private String homePage = "common/index1";
  // private String homePage = "home";

	private String categoryPage = "category";

	private String accountsPage = "account";

	private static final Logger logger = LoggerFactory
			.getLogger(CatalogController.class);

	/**
	 * Catalog Controller method which retrieves the information required in the
	 * application home page(Categories,SubCategories,Featured Items)
	 * 
	 * @author Dhana
	 * 
	 * @param Model
	 * @return Home Page View
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String returnHomePage(Model model, HttpServletRequest request) {
		Map<Category, List<SubCategory>> categoryMap = new HashMap<Category, List<SubCategory>>();
		HttpSession sess=request.getSession();
		logger.info("Processing information for home page");
		if (categoryMap.isEmpty()) {
			categoryMap = categoryConfigurationService.getCategoriesMap();
		}
		if (context.getAttribute("categoryMap") == null) {
			context.setAttribute("categoryMap", categoryMap);
		}
		List<Product> featProdList = new ArrayList<Product>();
		if (featProdList.isEmpty()) {
			System.out.println("empty bayya");
			featProdList=productConfigurationService.getFeaturedProducts();
			model.addAttribute("featProd",featProdList);
		}
		HashMap<Long, Integer> reviewcount = new HashMap<Long, Integer>();
		System.out.println("featProdList size in catalog size"+featProdList.size());
		reviewcount=reviewService.getReviewsCount(featProdList);
		
		System.out.println("dahnaaaaaaaaaaaaaaa"+reviewcount);
		System.out.println("get valyess"+reviewcount.get(6));
		
		HashMap<Long, Double> avgcount = new HashMap<Long, Double>();
		avgcount=reviewService.getAverageRatingCountProducts(featProdList);
	System.out.println("avgcount in home page"+avgcount);
		List<Product> names = productConfigurationService.getProductNames();
		List<Tag> data = new ArrayList<Tag>();
		for (int i = 0; i < names.size(); i++) {
			data.add(new Tag(i+1, names.get(i).getName()));
			
		}
		
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("avgcount", avgcount);
		sess.setAttribute("data", data);
		
		System.out.println("last msg");
		return getHomePage();
	}

	
	
	@RequestMapping(value = "/cateogry", method = RequestMethod.GET)
	public String fetchProductsByCategory(Model model,
			@RequestParam("category") String categoryName,
			HttpServletRequest request) {
		List<Product> categoryProducts = categoryConfigurationService
				.getProductsByCategory(categoryName);
		model.addAttribute("catProds", categoryProducts);
		return getCategoryPage();
	}

	@RequestMapping(value = "/subcateogry", method = RequestMethod.GET)
	public String fetchProductsBySubCategory(Model model,
			@RequestParam("subCategoryId") Long subCategoryId,
			HttpServletRequest request) {
		HttpSession sess=request.getSession();
		List<Product> subCategoryProducts = categoryConfigurationService
				.getProductsBySubCategory(subCategoryId);
		model.addAttribute("featProd",subCategoryProducts);
		//model.addAttribute("subCatProds", subCategoryProducts);
		HashMap<Long, Integer> reviewcount = new HashMap<Long, Integer>();
		System.out.println("featProdList size in catalog size"+subCategoryProducts.size());
		reviewcount=reviewService.getReviewsCount(subCategoryProducts);
		
		System.out.println("dahnaaaaaaaaaaaaaaa"+reviewcount);
		System.out.println("get valyess"+reviewcount.get(6));
		
		HashMap<Long, Double> avgcount = new HashMap<Long, Double>();
		avgcount=reviewService.getAverageRatingCountProducts(subCategoryProducts);
	System.out.println("avgcount in home page"+avgcount);
		List<Product> names = productConfigurationService.getProductNames();
		List<Tag> data = new ArrayList<Tag>();
		for (int i = 0; i < names.size(); i++) {
			data.add(new Tag(i+1, names.get(i).getName()));
			
		}
		
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("avgcount", avgcount);
		sess.setAttribute("data", data);
		
		System.out.println("last msg");
		return getHomePage();
	}

	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String getAccountsPage(Model model, HttpServletRequest request) {
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		System.out.println("chekicng account page"+customer.getCustomerId());
		customer=customerService.getCustomerById(customer.getCustomerId());
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		model.addAttribute("customer", customer);
	//	model.addAttribute("page", accountsTemplatePage);
	   return getAccountPage();
		
	}

	public String getAccountPage() {
		return accountsPage;
	}

	public String getCategoryPage() {
		return categoryPage;
	}

	public String getHomePage() {
		System.out.println("ssssssssssssss");
		return homePage;
	}
	
	@RequestMapping(value = "/searchforproducts", method = RequestMethod.POST)
	public String fetchProductsByNameContent(Model model,
			@RequestParam("searchcontent") String searchcontent,
			HttpServletRequest request) {
		HttpSession sess=request.getSession();
		System.out.println("searchforproducts jsp"+searchcontent);
		List<Product> searchProducts = categoryConfigurationService
				.getProductsByNameContent(searchcontent);
		model.addAttribute("featProd",searchProducts);
		/*List<Product> subCategoryProducts = categoryConfigurationService
				.getProductsBySubCategory(subCategoryId);
		model.addAttribute("subCatProds", subCategoryProducts);*/
		
		HashMap<Long, Integer> reviewcount = new HashMap<Long, Integer>();
		System.out.println("featProdList size in catalog size"+searchProducts.size());
		reviewcount=reviewService.getReviewsCount(searchProducts);
		
		System.out.println("dahnaaaaaaaaaaaaaaa"+reviewcount);
		System.out.println("get valyess"+reviewcount.get(6));
		
		HashMap<Long, Double> avgcount = new HashMap<Long, Double>();
		avgcount=reviewService.getAverageRatingCountProducts(searchProducts);
	System.out.println("avgcount in home page"+avgcount);
		List<Product> names = productConfigurationService.getProductNames();
		List<Tag> data = new ArrayList<Tag>();
		for (int i = 0; i < names.size(); i++) {
			data.add(new Tag(i+1, names.get(i).getName()));
			
		}
		
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("avgcount", avgcount);
		sess.setAttribute("data", data);
		return homePage;
	}
	
	
}
