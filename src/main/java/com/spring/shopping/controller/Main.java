/*
 * Copyright 2002-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.spring.shopping.controller;

import com.easypost.model.Tracker;
import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.*;
import com.spring.shopping.model.Customer;
import com.spring.shopping.service.*;
import com.spring.shopping.util.SessionUtils;
import com.spring.shopping.util.Utility;
import com.squareup.connect.*;
import com.squareup.connect.api.*;
import com.squareup.connect.auth.OAuth;
import com.squareup.connect.models.*;
import com.squareup.connect.models.Money;
import com.squareup.connect.models.Money.CurrencyEnum;
import com.squareup.connect.models.RetrieveTransactionResponse;
import com.srishtibiz.common.SendingEmail;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class Main {
    // The environment variable containing a Square Personal Access Token.
    // This must be set in order for the application to start.
    private static final String SQUARE_ACCESS_TOKEN_ENV_VAR = "sandbox-sq0atb-xiEWESkJAmm52sMlCs2b2A";

    private String squareupindex = "template/squareupindex";
    private String paytmindex = "paytm/placeorder";
    //private String paytmindex = "paytm/TxnTest";
    private String squareupcharge = "template/charge";
    @Autowired
	private OrderService orderService;
    @Autowired
   	private AddressService addressService;
    @Autowired
	private CartDetailsService cartDetailsService;
    // The environment variable containing a Square application ID.
    // This must be set in order for the application to start.
    private static final String SQUARE_APP_ID_ENV_VAR = "sandbox-sq0idp-tVvPe-svMrqgtzNNRvmStg";

    private final ApiClient squareClient = Configuration.getDefaultApiClient();
    private final Location squareLocation;
    private final String squareAppId;

    public Main() throws ApiException {
    	System.out.println("chekcing main method");
        squareAppId = "sandbox-sq0idp-tVvPe-svMrqgtzNNRvmStg";

        // Configure OAuth2 access token for authorization: oauth2
        OAuth oauth2 = (OAuth) squareClient.getAuthentication("oauth2");
        oauth2.setAccessToken("sandbox-sq0atb-xiEWESkJAmm52sMlCs2b2A");

        squareLocation = lookupCardProcessingLocation();
    }

   

    @RequestMapping(value ="/squareupindex", method = RequestMethod.POST)
    String index(Map<String, Object> model,
    		@RequestParam(value = "productId", required = true) Long[] productId,
			@RequestParam(value = "name", required = true) String[] name,
			@RequestParam(value = "quantity", required = true) int[] quantity,
			@RequestParam(value = "price", required = true) Double[] price,
			@RequestParam(value = "manufacturer", required = true) String[] manufacturer,
    		@RequestParam(value = "total", required = true) Double total,
    		@RequestParam(value = "paymenttype", required = true) String paymenttype,
    		Model model1,
    		HttpServletRequest request) throws ApiException {
        model.put("locationId", squareLocation.getId());
        model.put("locationName", squareLocation.getName());
        model.put("addId", "sandbox-sq0idp-tVvPe-svMrqgtzNNRvmStg");
        AddressForm shippingAddress=new AddressForm();
        HttpSession sess=request.getSession();
        Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
        System.out.println("chekicng in square up method");
        ArrayList<CartProducts> CartProductsList =new ArrayList<CartProducts>();
     
         for (int i = 0; i < productId.length; i++) {
        	 CartProducts p=new CartProducts();
        	 p.setProductId(productId[i]);
        	 p.setName(name[i]);
        	 p.setQuantity(quantity[i]);
        	 p.setPrice(price[i]);
        	 p.setCustomerId(customer.getCustomerId());
        	 CartProductsList.add(p);
		}
         sess.setAttribute("orderdetails", CartProductsList);
         sess.setAttribute("ordertotal", total);
         sess.setAttribute("productId", productId);
         sess.setAttribute("name", name);
         sess.setAttribute("quantity", quantity);
         sess.setAttribute("price", price);
         
         sess.setAttribute("orderpaymenttype", paymenttype);
        Long customerId=0L;
        if (customer!=null) {
        	 customerId=customer.getCustomerId();
		}
        System.out.println("customerId in square up index after cheincg dhana"+customerId);
        shippingAddress=addressService.getAddressByCustomerId(customerId);
        System.out.println("chekcing shiiping addres in main method"+shippingAddress.getFullName());
        model1.addAttribute("shippingAddress", shippingAddress);
        model1.addAttribute("productId", productId);
		model1.addAttribute("name", name);
		model1.addAttribute("quantity", quantity);
		model1.addAttribute("price", price);
		model1.addAttribute("manufacturer", manufacturer);
        model1.addAttribute("total", total);
        model1.addAttribute("paymenttype", paymenttype);
        System.out.println("");
        /*if ("paytm".equals(paymenttype)) {
        	 return paytmindex;
		}else{
			 return squareupindex;
		}*/
        return paytmindex;
       
    }

    @RequestMapping(value = "/charge", method = RequestMethod.POST)
    String charge(@ModelAttribute NonceForm form, Map<String, Object> model,
    		@RequestParam(value = "productId", required = true) Long[] productId,
			@RequestParam(value = "name", required = true) String[] name,
			@RequestParam(value = "quantity", required = true) int[] quantity,
			@RequestParam(value = "price", required = true) Double[] price,
			@RequestParam(value = "manufacturer", required = true) String[] manufacturer,
    		@RequestParam(value = "total", required = true) Double total,
    		HttpServletRequest request,
    		Model model1) throws ApiException {
        // To learn more about splitting transactions with additional recipients,
        // see the Transactions API documentation on our [developer site]
        // (https://docs.connect.squareup.com/payments/transactions/overview#mpt-overview).
    
        ChargeRequest chargeRequest = new ChargeRequest()
            .idempotencyKey(UUID.randomUUID().toString())
            .amountMoney(new Money().amount(1_00L).currency(CurrencyEnum.USD))
            .cardNonce(form.getNonce())
            .note("From a Square sample Java app");

        TransactionsApi transactionsApi = new TransactionsApi();
        transactionsApi.setApiClient(squareClient);

        ChargeResponse response = transactionsApi.charge(squareLocation.getId(), chargeRequest);
System.out.println("response.getTransaction().getId()"+response.getTransaction().getId());


    RetrieveTransactionResponse result = transactionsApi.retrieveTransaction(response.getTransaction().getLocationId(), response.getTransaction().getId());
   
    JSONObject jsonObj = new JSONObject(result);   
 
   JSONObject jsonObj1 = jsonObj.getJSONObject("transaction");
  
   JSONArray array=jsonObj1.getJSONArray("tenders");
   JSONObject cardDetails=null;
   for(int i=0;i<array.length();i++)
   {
    cardDetails=array.getJSONObject(i).getJSONObject("cardDetails");
  
   // Do whatever you want to do with username
   }
   JSONObject card=cardDetails.getJSONObject("card");
   
  
  String last4 =card.getString("last4");
   
   System.out.println("last4diits  info "+last4);
   
    
//transactionsApi.retrieveTransaction(response.getTransaction().getLocationId(), response.getTransaction().getId()).getTransaction().getTenders();
//System.out.println(transactionsApi.retrieveTransaction(last4response.getTransaction().getLocationId(), response.getTransaction().getId()));


Customer customer = SessionUtils.getSessionVariables(request, "customer");
List<Product> productsList = null;
Long customerId=customer.getCustomerId();
productsList = new ArrayList<Product>();

productsList=cartDetailsService.fetchProductsList(customerId);


List<CartProducts> CartProductsList =new ArrayList<CartProducts>();

BigDecimal total1= new BigDecimal(total, MathContext.DECIMAL64);

System.out.println("productsList"+productsList.size());
System.out.println("ccccccccc"+customer.getPhoneNumber());
System.out.println("name lentgt"+name.length);
HttpSession sess=request.getSession();
Long addressId=(Long)sess.getAttribute("addressId");
System.out.println("chekicng address id inof whie inseruring  "+addressId);
Tracker t=new Tracker();
t=orderService.createTracking();
for (int i = 0; i < manufacturer.length; i++) {
	CartProducts cart=new CartProducts();
	cart.setCustomerId(customerId);
	cart.setName(name[i]);
	cart.setProductId(productId[i]);
	cart.setQuantity(quantity[i]);
	cart.setPrice(price[i]);
	cart.setAddressId(addressId);
	cart.setOrdersId(response.getTransaction().getId());
	cart.setCategoryId(productsList.get(i).getCategoryId());
	cart.setSubCategoryId(productsList.get(i).getSubCategoryId());
	cart.setOrderTotal(total1);
	cart.setCardNumberLast4(last4);
	cart.setTrackingCode(t.getTrackingCode());
	cart.setFormUrl(t.getFormUrl());
	CartProductsList.add(cart);
	System.out.println("manufacturer"+manufacturer[i]);	
}

System.out.println("CartProductsList size"+CartProductsList.size()+"CartProductsList"+CartProductsList.get(0).getProductId());
Orders order=orderService.placeOrder(CartProductsList,customer);



String createdDate=Utility.converDtFormatEcart(order.getCreatedDate(), "dd MMM yyyy");
System.out.println("createdDate after order page"+createdDate);
if (response.getTransaction().getId()!=null) {
	cartDetailsService.clearCart(customerId);
	SendingEmail SendingEmail=new SendingEmail();
	 String html =
             "<html><head><body><b>Dear Sir/Madam,"
                     + "<br><br>"
                     + " Your Ekart order Successfully Placed.Please find the Transaction Id is "+response.getTransaction().getId()+" for tracking.<br>"
                     + "</body></html>";
    String subject="Ekart Order";
	SendingEmail.Email(subject, subject, subject, customer.getEmailAddress(), subject, subject, subject, html);
	cartDetailsService.sendSmsOrder(customer,CartProductsList);
	
}

int cartSize=cartDetailsService.cartSize(request);
model1.addAttribute("cartSize", cartSize);
AddressForm address=addressService.getAddressById(addressId);
model1.addAttribute("shippingAddress", address);

        model1.addAttribute("productId", productId);
        model1.addAttribute("name", name);
        model1.addAttribute("quantity", quantity);
        model1.addAttribute("price", price);
        model1.addAttribute("manufacturer", manufacturer);
        model1.addAttribute("total", total);
        model1.addAttribute("order", order);
        model1.addAttribute("createdDate",createdDate);
        model1.addAttribute("transactionId", response.getTransaction().getId());
        //return "template/squareupcharge";
        return "template/ordercompletion";
    }

    private Location lookupCardProcessingLocation() throws ApiException {
        LocationsApi locationsApi = new LocationsApi();
        locationsApi.setApiClient(squareClient);

        return locationsApi.listLocations().getLocations().stream().findFirst().get();
        /*return locationsApi.listLocations().getLocations().stream()
            .filter(l -> l.getCapabilities().contains(CapabilitiesEnum.PROCESSING))
            .findFirst()
            .orElseThrow(() -> new IllegalStateException(
                "At least one location must support card processing"));*/
    }
    
    
    @RequestMapping(value ="/squareuppayment", method = RequestMethod.POST)
    String squareuppayment(Map<String, Object> model,
    		@RequestParam(value = "productId", required = true) Long[] productId,
			@RequestParam(value = "name", required = true) String[] name,
			@RequestParam(value = "quantity", required = true) int[] quantity,
			@RequestParam(value = "price", required = true) Double[] price,
			@RequestParam(value = "manufacturer", required = true) String[] manufacturer,
    		@RequestParam(value = "total", required = true) Double total,
    		@RequestParam(value = "paymenttype", required = true) String paymenttype,
    		Model model1,
    		HttpServletRequest request) throws ApiException {
        model.put("locationId", squareLocation.getId());
        model.put("locationName", squareLocation.getName());
        model.put("addId", "sandbox-sq0idp-tVvPe-svMrqgtzNNRvmStg");
        AddressForm shippingAddress=new AddressForm();
        Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
        System.out.println("chekicng in square up method");
        Long customerId=0L;
        if (customer!=null) {
        	 customerId=customer.getCustomerId();
		}
        System.out.println("customerId in square up index after cheincg dhana"+customerId);
        shippingAddress=addressService.getAddressByCustomerId(customerId);
        System.out.println("chekcing shiiping addres in main method"+shippingAddress.getFullName());
        model1.addAttribute("shippingAddress", shippingAddress);
        model1.addAttribute("productId", productId);
		model1.addAttribute("name", name);
		model1.addAttribute("quantity", quantity);
		model1.addAttribute("price", price);
		model1.addAttribute("manufacturer", manufacturer);
        model1.addAttribute("total", total);
        model1.addAttribute("paymenttype", paymenttype);
        System.out.println("");
        /*if ("paytm".equals(paymenttype)) {
        	 return paytmindex;
		}else{
			 return squareupindex;
		}*/
        return squareupindex;
       
    }
    
    
    
    
}
