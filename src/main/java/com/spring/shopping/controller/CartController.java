package com.spring.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.service.CartData;
import com.spring.shopping.service.CartDetailsService;
import com.spring.shopping.service.CartService;
import com.spring.shopping.util.SessionUtils;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private CartDetailsService cartDetailsService;
//	@Autowired
//	private ProductConfigService productService;
//	@Autowired
//	private WishListService wishListService;
//	@Autowired
//	private CartData cartData;

	private final static String cartPage = "cart";
	private final static String cartPage1 = "cart1";
	private final static String redirectView = "redirect:/cart";
	private final static String redirectView1 = "redirect:/cart1";
	

	/**
	 * Method to Add Products to the Shopping Cart First Check if the Product is
	 * available in the Wishlist, if available, remove the product from Wishlist
	 * 
	 * @author Dhana
	 * 
	 * @param ProductID
	 * @param HttpServletRequest
	 * @return Product Page View
	 */
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProducts(Model model,
			@RequestParam(value = "productId") Long productId,
			HttpServletRequest request) {
		
		System.out.println("add product method page ");
		// When a customer adds a product to the cart, we have to check
		// if he is a registered or an anonymous customer.
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		if (customer != null) {
			// Customer is anonymous, so create a shared cart and add it to
			// session
			// Creates a new cart for the anonymous customer
			CartData anonymousCartData = cartService.getShoppingCart();
			System.out.println("in  cart controller addpoduct if loop line 56");
			SessionUtils.setSessionVariables(anonymousCartData, request,
					ControllerConstants.CART);
			cartService.addProduct(anonymousCartData, productId);
		} else {

			System.out.println("in  cart controller addpoduct else loop line 56");
			CartData customerCartData = null;
			customerCartData = SessionUtils.getSessionVariables(request,
					ControllerConstants.CART);
			if (customerCartData == null) {
				customerCartData = cartService.getShoppingCart();
				SessionUtils.setSessionVariables(customerCartData, request,
						ControllerConstants.CART);
				cartService.addProduct(customerCartData, productId);
			} else {
				cartService.addProduct(customerCartData, productId);
			}
			// TODO: Extend the add to cart functionality

			// When the customer is registered, cart contents must be
			// stored in the database, and stored in the session.
		}
		return getRedirectview();

	}

	/**
	 * Method to View the Items of Shopping Cart Retrieves the items to display
	 * in the shopping cart page
	 * 
	 * @author Dhana
	 * 
	 * @param Model
	 * @param ProductID
	 * @param HttpServletRequest
	 * @return Shopping Cart View
	 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String viewCart(Model model, HttpServletRequest request) {
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		/*System.out.println("cart method 111111111c cheing"+customer.getCustomerId());*/
		//CartData cartData =cartService.getShoppingCartByCustomer(customer);
		
		return getCartpage();
	}

	/**
	 * Method to Update the shopping cart page
	 * 
	 * @author Dhana
	 * 
	 * @param Model
	 * @param ProductID
	 * @param HttpServletRequest
	 * @return Shopping Cart View
	 */

	// TODO- Implement BindingResult and FormValidations
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateCart(Model model, HttpServletRequest request) {
		Long productId = Long.parseLong(request.getParameter("productid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		CartData cartData = SessionUtils.getSessionVariables(request,
				ControllerConstants.CART);
		System.out.println("update method page in cart controlleer ");
		cartService.updateProduct(cartData, productId, quantity);
		return "redirect:/cart";
	}

	/**
	 * Method to Remove the Products from shopping cart
	 * 
	 * @author Dhana
	 * 
	 * @param Model
	 * @param ProductID
	 * @param HttpServletRequest
	 * @return Shopping Cart View
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeProduct(
			@RequestParam(value = "productId") Long productId, Model model,
			HttpServletRequest request) {
		System.out.println("remove method page in cart controlleer ");
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
		
		return redirectView1;
	}

	/**
	 * Method to Clear the Products from shopping cart
	 * 
	 * @author Dhana
	 * 
	 * @param Model
	 * @param ProductID
	 * @param HttpServletRequest
	 * @return Shopping Cart View
	 */
	@RequestMapping(value = "/clear", method = RequestMethod.GET)
	public String clearCart(Model model, HttpServletRequest request) {
		System.out.println("clear method page in cart controlleer ");
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		System.out.println("update method page in cart controlleer ");
		if (customer != null) {
			// Customer is anonymous, so create a shared cart and add it to
			// session
			// Creates a new cart for the anonymous customer
			Long customerId=customer.getCustomerId();
			 cartDetailsService.clearCart(customerId);
		}
		return redirectView1;
	}

	public static String getRedirectview() {
		return redirectView;
	}

	public static String getCartpage() {
		System.out.println("cart method 22222222222222");
		return cartPage;
	}
	
	@RequestMapping(value = "/addNewProduct", method = RequestMethod.GET)
	public String addNewProducts(Model model,
			@RequestParam(value = "productId") Long productId,
			HttpServletRequest request) {
		
		System.out.println("add new product method page ");
		// When a customer adds a product to the cart, we have to check
		// if he is a registered or an anonymous customer.
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		if (customer != null) {
			// Customer is anonymous, so create a shared cart and add it to
			// session
			// Creates a new cart for the anonymous customer
			Long customerId=customer.getCustomerId();
			cartDetailsService.addNewProduct(productId,customerId);
			/*CartData anonymousCartData = cartService.getShoppingCart();
			System.out.println("in  cart controller addpoduct if loop line 56"+customer.getCustomerId());
			SessionUtils.setSessionVariables(anonymousCartData, request,
					ControllerConstants.CART);
			cartService.addProduct(anonymousCartData, productId);*/
		} 
		return "redirect:/home";
		//return redirectView1;

	}
	
	
	
@RequestMapping(value = "/cart1", method = RequestMethod.GET)
	public String viewCartDetails(Model model, HttpServletRequest request) {
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		List<Product> productsList = null;
		int cartSize=0;
		if (customer != null) {
			// Customer is anonymous, so create a shared cart and add it to
			// session
			// Creates a new cart for the anonymous customer
			Long customerId=customer.getCustomerId();
			productsList = new ArrayList<Product>();
			productsList=cartDetailsService.fetchCartDetails(customerId);
			if (productsList!=null) {
				cartSize=productsList.size();	
			}
			System.out.println("phonenumber chekicng"+customer.getPhoneNumber());
			model.addAttribute("productsList", productsList);
			
		} 
		
		model.addAttribute("cartSize", cartSize);
		System.out.println("viewCartDetails method checkiing"+customer.getCustomerId()+"size of products "+productsList.size());
		
		return cartPage1;
	}
/**
 * Method to Update Quantity of the Products from shopping cart
 * 
 * @author Dhana
 * 
 * @param Model
 * @param HttpServletRequest
 * @return Shopping Cart View
 */
@RequestMapping(value = "/updateQuantity", method = RequestMethod.POST)
public String updateProductCartQuantity(Model model, HttpServletRequest request) {
	Long productId = Long.parseLong(request.getParameter("productid"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	Customer customer = SessionUtils.getSessionVariables(request,
			ControllerConstants.CUSTOMER);
	System.out.println("update method page in cart controlleer ");
	if (customer != null) {
		// Customer is anonymous, so create a shared cart and add it to
		// session
		// Creates a new cart for the anonymous customer
		Long customerId=customer.getCustomerId();
		 cartDetailsService.updateProductCartQuantity(customerId, productId, quantity);
	}
	
	return "redirect:/cart1";
}


}