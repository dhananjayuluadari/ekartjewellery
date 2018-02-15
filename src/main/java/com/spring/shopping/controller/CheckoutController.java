package com.spring.shopping.controller;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.paytm.pg.merchant.CheckSumServiceHelper;
import com.spring.shopping.controller.constants.PaytmConstants;
import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.CartTransactionDetails;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Orders;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.ShippingAddress;
import com.spring.shopping.service.AddressService;
import com.spring.shopping.service.CartDetailsService;
import com.spring.shopping.service.CartService;
import com.spring.shopping.service.OrderService;
import com.spring.shopping.util.SessionUtils;
import com.spring.shopping.util.Utility;
import com.srishtibiz.common.SendingEmail;

@Controller
public class CheckoutController {

	
	@Autowired
	private CartService cartService;
	@Autowired
	private CartDetailsService cartDetailsService;
//	@Autowired
//	private ProductConfigService productService;
	@Autowired
	private AddressService addressService;
	@Autowired
    private OrderService orderService;
//	@Autowired
//	private PaymentService paymentService;

	private HttpSession session;
	private String paytmtransac = "paytm/TxnTest";
	private String paytmhome = "paytm/pgRedirect";
	private String paytmOrder = "template/paytmorderdetails";
	//private String paytmOrder = "paytm/pgResponse";
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkOutCart(Model model, HttpServletRequest request) {
		session = SessionUtils.createSession(request);
		System.out.println("chekcoing chekcout conteoreer");
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer != null) {

			Long customerId=customer.getCustomerId();
			List<Product> productsList = new ArrayList<Product>();
			productsList=cartDetailsService.fetchCartDetails(customerId);
			AddressForm	address=new AddressForm();
			int cartSize=0;
			address=addressService.getCustomerAddress(customerId);
			if (productsList!=null) {
				cartSize=productsList.size();
			}
			 
			model.addAttribute("cartSize", cartSize);
			model.addAttribute("address", address);
			model.addAttribute("productsList", productsList);
			return new ModelAndView("checkout");
			//return new ModelAndView("addressPage");
		} else {
			SessionUtils.setSessionVariables(cartService,request,"cartInfo");
			return new ModelAndView("login");
		}
	}

	@RequestMapping(value = "/address", method = RequestMethod.POST)
	public String validateAddressInformation(
			@ModelAttribute("addressForm") AddressForm address, Model model,
			HttpServletRequest request) {
		String fullName = request.getParameter("fullName");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String state = request.getParameter("state");

		address.setFullName(fullName);
		address.setAddress1(address1);
		address.setAddress2(address2);
		address.setCity(city);
		address.setZipCode(zipCode);
		address.setState(state);
		System.out.println("fullName"+fullName);
		session = SessionUtils.createSession(request);
		Customer customer = SessionUtils.getSessionVariables(request, "customer");
		address.setCustomerId(customer.getCustomerId());
		addressService.saveAddress(address, customer);
		SessionUtils.setSessionVariables(address, request, "address");
//		model.addAttribute("prodList", cartService.getProductsList());
		return "redirect:checkout";
	}

	@RequestMapping(value = "/paymentMethod", method = RequestMethod.GET)
	public String getPaymentMethodForm(Model model, 
			@RequestParam(value = "productId", required = true) Long[] productId,
			@RequestParam(value = "name", required = true) String[] name,
			@RequestParam(value = "quantity", required = true) int[] quantity,
			@RequestParam(value = "price", required = true) Double[] price,
			@RequestParam(value = "total", required = true) Double total,
			@RequestParam(value = "manufacturer", required = true) String[] manufacturer,HttpServletRequest request) {
		
		System.out.println("chekcing man"+Arrays.toString(name));
		model.addAttribute("productId", productId);
		model.addAttribute("name", name);
		model.addAttribute("quantity", quantity);
		model.addAttribute("price", price);
		model.addAttribute("manufacturer", manufacturer);
		model.addAttribute("total", total);
		return "paymentMethod";
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String getPaymentForm(Model model, HttpServletRequest request) {
		return "payment";
	}
	
	@RequestMapping(value = "/paytmtransac", method = RequestMethod.POST)
	public String getPaymentpaytmtransac(Model model, HttpServletRequest request) {
		return paytmtransac;
	}
	
	@RequestMapping(value = "/paytmhome", method = RequestMethod.POST)
	public String getPaymentpaytmHome(Model model, HttpServletRequest request) {
		return paytmhome;
	}
	
	@RequestMapping(value = "/paytmOrder", method = RequestMethod.POST)
	public String getPaymentpaytmOrder(Model model, HttpServletRequest request) {
		HttpSession sess=request.getSession();
		Customer customer = SessionUtils.getSessionVariables(request, "customer");
		Enumeration<String> paramNames = request.getParameterNames();
		Map<String, String[]> mapData = request.getParameterMap();
		TreeMap<String,String> parameters = new TreeMap<String,String>();
		String paytmChecksum =  "";
		while(paramNames.hasMoreElements()) {
			String paramName = (String)paramNames.nextElement();
			if(paramName.equals("CHECKSUMHASH")){
				paytmChecksum = mapData.get(paramName)[0];
			}else{
				parameters.put(paramName,mapData.get(paramName)[0]);
			}
		}
		boolean isValideChecksum = false;
		String outputHTML="";
		try{
			CartTransactionDetails cartdetails=new CartTransactionDetails();
			isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
			if(isValideChecksum && parameters.containsKey("RESPCODE")){
				if(parameters.get("RESPCODE").equals("01")){
					outputHTML = parameters.toString();
					cartdetails.setBankName(parameters.get("BANKNAME"));
					cartdetails.setBankTransactionId(parameters.get("BANKTXNID"));
					cartdetails.setCurrency(parameters.get("CURRENCY"));
					cartdetails.setGatewayName(parameters.get("GATEWAYNAME"));
					cartdetails.setMerchantid(parameters.get("MID"));
					cartdetails.setOrderid(parameters.get("ORDERID"));
					cartdetails.setPaymentmode(parameters.get("PAYMENTMODE"));
					cartdetails.setResponsecode(parameters.get("RESPCODE"));
					cartdetails.setResponsemessage(parameters.get("RESPMSG"));
					cartdetails.setStatus(parameters.get("STATUS"));
					cartdetails.setTransactionamount(parameters.get("TXNAMOUNT"));
					cartdetails.setTransactiondate(parameters.get("TXNDATE"));
					cartdetails.setTransactionid(parameters.get("TXNID"));
					System.out.println("if conditon paytm order page: "+outputHTML);
				}else{
					outputHTML="<b>Payment Failed.</b>";
					System.out.println("else conditon paytm order page: "+outputHTML);
				}
			}else{
				outputHTML="<b>Checksum mismatched.</b>";
				System.out.println("2nd else conditon paytm order page: "+outputHTML);
			}
		}catch(Exception e){
			outputHTML=e.toString();
			e.printStackTrace();
		}
		
		System.out.println("outputHTML: "+outputHTML);
		List<Product> productsList = null;
		Long customerId=customer.getCustomerId();
		productsList = new ArrayList<Product>();

		productsList=cartDetailsService.fetchProductsList(customerId);

		Long[] productId=(Long[]) sess.getAttribute("productId");
		String[] name=(String[]) sess.getAttribute("name");
		int[] quantity=(int[]) sess.getAttribute("quantity");
		Double[] price=(Double[]) sess.getAttribute("price");
		Long addressId=(Long)sess.getAttribute("addressId");
		Double total=(Double) sess.getAttribute("ordertotal");
		String orderpaymenttype=(String) sess.getAttribute("orderpaymenttype");
		BigDecimal total1= new BigDecimal(total, MathContext.DECIMAL64);
		ArrayList<CartProducts> CartProductsList =new ArrayList<CartProducts>();
		for (int i = 0; i < productId.length; i++) {
			CartProducts cart=new CartProducts();
			cart.setCustomerId(customerId);
			cart.setName(name[i]);
			cart.setProductId(productId[i]);
			cart.setQuantity(quantity[i]);
			cart.setPrice(price[i]);
			cart.setAddressId(addressId);
			cart.setOrdersId(parameters.get("ORDERID"));
			cart.setCategoryId(productsList.get(i).getCategoryId());
			cart.setSubCategoryId(productsList.get(i).getSubCategoryId());
			cart.setOrderTotal(total1);
			cart.setCardNumberLast4("");
			cart.setTrackingCode("");
			cart.setFormUrl("");
			CartProductsList.add(cart);
			
		}
		

		System.out.println("productsList"+productsList.size());
		
				
		
		System.out.println("addresid session:"+addressId);
		Orders order=new Orders();
	
		if ("01".equals(parameters.get("RESPCODE"))) {
			order=orderService.placeOrder(CartProductsList, customer);
			SendingEmail SendingEmail=new SendingEmail();
			 String html =
		             "<html><head><body><b>Dear Sir/Madam,"
		                     + "<br><br>"
		                     + " Your Ekart order Successfully Placed.Please find the Transaction Id is "+parameters.get("ORDERID")+" for tracking.<br>"
		                     + "</body></html>";
		    String subject="Ekart Order";
			SendingEmail.Email(subject, subject, subject, customer.getEmailAddress(), subject, subject, subject, html);
		cartDetailsService.sendSmsOrder(customer,CartProductsList);
        }
		if ("01".equals(parameters.get("RESPCODE"))) {
			 cartDetailsService.clearCart(customerId);
			}
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		
		AddressForm address=addressService.getAddressById(addressId);
		model.addAttribute("shippingAddress", address);
		String createdDate=null;
		if (order!=null) {
			 createdDate=Utility.converDtFormatEcart(order.getCreatedDate(), "dd MMM yyyy");	
		}

		
		
		
		        model.addAttribute("productId", productId);
		        model.addAttribute("name", name);
		        model.addAttribute("quantity", quantity);
		        model.addAttribute("price", price);
		        model.addAttribute("total", total);
		        model.addAttribute("order", order);
		        model.addAttribute("createdDate",createdDate);
		        model.addAttribute("transactionId", parameters.get("ORDERID"));
		return paytmOrder;
	}
	
	
	@RequestMapping(value = "/shippingaddress", method = RequestMethod.POST)
	public String addShippingAddress(
			@ModelAttribute("addressForm") AddressForm address,
			//@ModelAttribute("shippingaddress") ShippingAddress ShippingAddress,
			Model model,
			@RequestParam(value = "productId", required = true) Long[] productId,
			@RequestParam(value = "name", required = true) String[] name,
			@RequestParam(value = "quantity", required = true) int[] quantity,
			@RequestParam(value = "price", required = true) Double[] price,
			@RequestParam(value = "manufacturer", required = true) String[] manufacturer,
			@RequestParam(value = "total", required = true) Double total,
			HttpServletRequest request) {
		
		System.out.println("chekicng shiping details"+address.getAddress1()+"total"+total);
		
		Customer customer = SessionUtils.getSessionVariables(request, "customer");
		address.setCustomerId(customer.getCustomerId());
		addressService.saveShippingAddress(address, customer);
		HttpSession sess=request.getSession();
		System.out.println("ShippingAddress id info"+address.getAddressId());
		sess.setAttribute("addressId", address.getAddressId());
		System.out.println("chekcing man"+Arrays.toString(name));
		model.addAttribute("productId", productId);
		model.addAttribute("name", name);
		model.addAttribute("quantity", quantity);
		model.addAttribute("price", price);
		model.addAttribute("manufacturer", manufacturer);
		model.addAttribute("total", total);
		return "redirect:paymentMethod";
	
	}
	

}
