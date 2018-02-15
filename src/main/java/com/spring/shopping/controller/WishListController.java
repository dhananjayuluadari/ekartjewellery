package com.spring.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.service.CartData;
import com.spring.shopping.service.CartDetailsService;
import com.spring.shopping.service.CartService;
import com.spring.shopping.service.WishListService;
import com.spring.shopping.util.SessionUtils;

@Controller
public class WishListController {

	private static String wishListPage = "template/wishlist";
	@Autowired
	private WishListService wishListService;
	@Autowired
	private CartDetailsService cartDetailsService;
	@Autowired
	private CartService cartService;
	private HttpSession session;

	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String getWishListPage(HttpServletRequest request, Model model) {
		session = SessionUtils.createSession(request);
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		model = getWishListProducts(model, session);
		return wishListPage;
	//	return "account";
	}

	/**
	 * Method to Add Products to the Wishlist
	 * 
	 * @author Dhana
	 * 
	 * 
	 */
	@RequestMapping(value = "/addToWishlist", method = RequestMethod.GET)
	public String addProductToWishList(Model model,
			@RequestParam(value = "productId") Long productId,
			HttpServletRequest request) {
		boolean flag = addProduct(request, productId);
		if (flag) {
			model = getWishListProducts(model, session);
			//model.addAttribute("page", wishListPage);
			return wishListPage;
		} else {
			model.addAttribute("prodExist", false);
			return "redirect:product?productId=" + productId;
		}
	}

	/**
	 * Method to Move Products to the Wishlist From the Shopping Cart. First
	 * Adds the product to the Wishlist and then deletes the product from the
	 * Shopping Cart.
	 * 
	 * @author Dhana
	 * 
	 * 
	 */
	@RequestMapping(value = "/moveToWishList", method = RequestMethod.GET)
	public String moveToWishList(Model model,
			@RequestParam(value = "productId") Long productId,
			HttpServletRequest request) {
		boolean flag = addProduct(request, productId);
		if (flag) {
			Customer customer = SessionUtils.getSessionVariables(request,
					ControllerConstants.CUSTOMER);
			System.out.println("update method page in cart controlleer ");
			if (customer != null) {
				// Customer is anonymous, so create a shared cart and add it to
				// session
				// Creates a new cart for the anonymous customer
				Long customerId=customer.getCustomerId();
				 cartDetailsService.removeProduct(customerId, productId);
			}
			return "redirect:/cart1";
		} else {
			return "redirect:cart1?addWishList=False";
		}
	}

	/**
	 * Method to Move Products to the Shopping Cart From the WishList. First
	 * Deletes the product From the Wishlist and then Add the product from the
	 * Shopping Cart.
	 * 
	 * @author Dhana
	 * 
	 * 
	 */
	@RequestMapping(value = "/moveToCart", method = RequestMethod.GET)
	public String moveToCart(Model model, HttpServletRequest request,
			@RequestParam(value = "productId") Long productId,
			RedirectAttributes redirectAttributes) {
		Customer customer = (Customer) session.getAttribute("customer");
		wishListService.deleteProductFromWishList(productId,customer.getCustomerId());
		model.addAttribute("productId", productId);
		return "forward:/addNewProduct";
	}

	/**
	 * Method to Remove Products from the Wishlist.
	 * 
	 * @author Dhana
	 * 
	 * 
	 */
	@RequestMapping(value = "/removeFromWishList", method = RequestMethod.GET)
	public String removeProductFromWishList(Model model,
			@RequestParam(value = "productId") Long productId,
			HttpServletRequest request) {
		
		Customer customer = (Customer) session.getAttribute("customer");
		System.out.println("chekcing removeProductFromWishList "+customer.getCustomerId()+"b"+customer.getFirstName()+"c"+customer.getEmailAddress());
		wishListService.deleteProductFromWishList(productId,customer.getCustomerId());
		model = getWishListProducts(model, session);
		model.addAttribute("page", wishListPage);
		return "account";

	}

	// Method to get wishlist products to display in the page
	public Model getWishListProducts(Model model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		System.out.println("chekcing http session "+customer.getCustomerId()+"name"+customer.getFirstName());
		List<Product> wishListProductsList = new ArrayList<Product>();
		if (customer != null) {
			wishListProductsList = wishListService
					.getProductsInWishList(customer);
		}
		model.addAttribute("page", wishListPage);
		model.addAttribute("productsInWishList", wishListProductsList);
		return model;
	}

	// Method to add product to wishlist
	// seperated to accomodate in moveToWishList and addToWishlist calls
	public boolean addProduct(HttpServletRequest request, Long productId) {
		session = SessionUtils.createSession(request);
		Customer customer = SessionUtils.getSessionVariables(request,
				"customer");
		boolean flag = false;
		if (customer != null) {
			return wishListService.addProductToWishList(productId, customer);
		}
		return flag;
	}

}
