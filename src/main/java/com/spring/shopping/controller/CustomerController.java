package com.spring.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.Customer;
import com.spring.shopping.service.CartData;
import com.spring.shopping.service.CartService;
import com.spring.shopping.service.CustomerService;
import com.spring.shopping.service.MailSenderService;
import com.spring.shopping.util.SessionUtils;

@Controller
public class CustomerController {

	private HttpSession session;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private MailSenderService mailSenderService;
	private StringBuffer sb = new StringBuffer();

	/**
	 * This method used to Validate the customer and login to the application
	 * 
	 * If the user wants to login after adding items into the shopping cart, by
	 * clicking on Checkout Link, the user will be redirected to checkout page
	 * else the user will be redirected to home page.
	 * 
	 * @param model
	 * @param request
	 * @return checkout/home page
	 */

     @RequestMapping(value={"/", "login"}, method = RequestMethod.GET)
	public String getLoginPage(HttpServletRequest request, Model model) {
		System.out.println("login ui page landing for new user or enter login details");
		Boolean registerFlag = (Boolean) model.asMap().get("registerFlag");
		Integer result = (Integer) model.asMap().get("result");
		if (registerFlag != null && registerFlag != false) {
			// String regStatus = (String) model.asMap().get("regStatus");
			if (result != null && result != 0) {
				return "redirect:successSignUp";
			} else {
				return "redirect:failureSignUp";
			}
		} else {
			return "login";
		}
	}
    
    
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String checkForUserLogin(
			@RequestParam(value = "phoneNumber", required = true) String phoneNumber,
			@RequestParam(value = "password", required = true) String password,
			Model model, HttpServletRequest request) {
		
		System.out.println("chekcing login get parmaters page"+phoneNumber+"password"+password);
		Customer customer = validateCustomer(phoneNumber, password);
		//System.out.println("customer role chekicng info "+customer.getRole());
		session = SessionUtils.createSession(request);
		CartService cartService = SessionUtils.getSessionVariables(request,
				"cartInfo");
	
		SessionUtils.setSessionVariables(customer, request, "customer");
		if (cartService != null && customer != null) {
			CartData cartData = SessionUtils.getSessionVariables(request, ControllerConstants.CART);
			System.out.println("chekcing custoner info"+cartData.getNumberOfItems()+"cheiicng"+cartData.getTotal());
			int numberOfItems = cartService.getNumberOfItems(cartData);
			session.setAttribute("role", customer.getRole());
			model.addAttribute("numberOfItems", numberOfItems);
			
			return "redirect:checkout";
		} else if (customer != null) {
			session.setAttribute("role", customer.getRole());
			model.addAttribute("status", "home");
			return "redirect:home";
		} else {
			model.addAttribute("loginStatus", "fail");
		}
		return "redirect:login";

	}

	private Customer validateCustomer(String phoneNumber, String password) {
		System.out.println("2222222222 In validateCustomer method"+"phoneNumber"+phoneNumber+"password"+password);
		Customer customer = customerService.validateUsers(phoneNumber, password);
		return customer;
	}

	/**
	 * This method used to Register the Customer in Application On successfully
	 * registration, a unique key will be generated and stored in the database.
	 * 
	 * An Activation email is sent to the customer's emailID and if the user
	 * clicks on the link which contains the activation key, the customer will
	 * be activated.
	 * 
	 * @param customer
	 * @param model
	 * @param request
	 * @return login
	 */

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(
			@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "phoneNumber", required = true) String phoneNumber,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "emailAddress", required = true) String email,
			@ModelAttribute("customerForm") Customer customer, Model model,
			RedirectAttributes redir, HttpServletRequest request) {
		
		System.out.println("Registering users chekicng 1111111111"+userName+"password"+password+"email"+email+"chekicng email address"+customer.getEmailAddress());
		if (validateCustomer(phoneNumber, password) == null) {
			int result = customerService.registerUser(customer);
			if (result > 0) {
				sb.append("Hello " + customer.getUserName() + "\n");
				sb.append("Thank you for registering at eShopper.Happy Shopping!!\n");
				mailSenderService.sendEmail(
						customer.getEmailAddress(), userName, sb.toString(),"Activation mail for "+userName);
			}
			redir.addFlashAttribute("result", result);
		} else {
			redir.addFlashAttribute("regStatus", "FAIL");
		}
		redir.addFlashAttribute("registerFlag", true);
		return "redirect:login";

	}

	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		session = SessionUtils.createSession(request);
		SessionUtils.removeSessionVariables("customer", request);
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping(value = "/successSignUp", method = RequestMethod.GET)
	public String signupSuccess(Model model) {
		model.addAttribute("result", 1);
		return "login";
	}

	@RequestMapping(value = "/failureSignUp", method = RequestMethod.GET)
	public String signupFailure(Model model) {
		model.addAttribute("result", 0);
		return "login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signuppage(Model model) {
		
		return "signup";
		
	}
	
	//My sample code
	
	@RequestMapping(value = "updateaccountinformation", method = RequestMethod.POST)
	public String updateAccountInformation(HttpServletRequest request,
			@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "firstName", required = true) String firstName,
			@RequestParam(value = "lastName", required = true) String lastName,
			@RequestParam(value = "phoneNumber", required = true) String phoneNumber,
			@RequestParam(value = "emailAddress", required = true) String emailAddress,
			@ModelAttribute("accountinformationForm") Customer customer,
			 Model model,
			RedirectAttributes redirectAttributes) {
		System.out.println("userName"+userName+"firstName"+firstName+"lastName"+lastName+"phoneNumber"+phoneNumber+"chekcing"+customer.getPhoneNumber());
		
		session = SessionUtils.createSession(request);
		Customer customer1 = SessionUtils.getSessionVariables(request, "customer");
		customer.setCustomerId(customer1.getCustomerId());
		System.out.println("cutomer infossssss"+customer.getFirstName()+"lastNamesssssssss"+customer.getLastName()+"customerId"+customer.getCustomerId());
		
		int result = customerService.updateaccountinformation(customer);
		redirectAttributes.addFlashAttribute("result", result);
		return "redirect:/home";
	}
	
	

}

