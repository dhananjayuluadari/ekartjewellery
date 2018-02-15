package com.spring.shopping.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Product;
import com.spring.shopping.repository.CartDetailsRepository;
import com.spring.shopping.util.SessionUtils;

@Service
public class CartDetailsServiceImpl implements CartDetailsService {

	@Autowired
	private CartDetailsRepository cartDetailsRepository;
	
	public void addNewProduct(Long productId, Long customerId) {
		// TODO Auto-generated method stub
		cartDetailsRepository.addNewProduct(productId, customerId);
		System.out.println("chekicng CartDetailsServiceImpl page");
	}
	public List<Product> fetchCartDetails(Long customerId) {
		// TODO Auto-generated method stub
		
		List<Product> productsList=cartDetailsRepository.fetchCartDetails(customerId);
		
		return productsList;
	}
	public void updateProductCartQuantity(Long customerId, Long productId, int quantity) {
		// TODO Auto-generated method stub
		cartDetailsRepository.updateProductCartQuantity(customerId,productId,quantity);
		System.out.println("chekicng CartDetailsServiceImpl updateProductCartQuantity page");	
	}
	
	public void removeProduct(Long customerId, Long productId) {
		// TODO Auto-generated method stub
		cartDetailsRepository.removeProduct(customerId,productId);
		
	}
	public void clearCart(Long customerId) {
		// TODO Auto-generated method stub
		cartDetailsRepository.clearCart(customerId);
	}
	@Override
	public List<Product> fetchProductsList(Long customerId) {
		// TODO Auto-generated method stub
List<Product> productsList=cartDetailsRepository.fetchProductsList(customerId);
		
		return productsList;
	}
	@Override
	public void sendSmsOrder(Customer customer, List<CartProducts> cartProductsList) {
		// TODO Auto-generated method stub
		
		
		String authkey = "190308AmdZEXxgwKdc5a46067d";
        //Multiple mobiles numbers separated by comma
		System.out.println("customer.getPhoneNumber()"+customer.getPhoneNumber());
        String mobiles =customer.getPhoneNumber();
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "102234";
        //Your message to send, Add URL encoding here.
        String message = "Products Ordered successfully on Ecart.Transaction Id is"+cartProductsList.get(0).getOrdersId();
        //define route
        String route="default";

        //Prepare Url
        URLConnection myURLConnection=null;
        URL myURL=null;
        BufferedReader reader=null;

        //encoding message
        @SuppressWarnings("deprecation")
		String encoded_message=URLEncoder.encode(message);

        //Send SMS API
        String mainUrl="http://api.msg91.com/api/sendhttp.php?";

        //Prepare parameter string
        StringBuilder sbPostData= new StringBuilder(mainUrl);
        sbPostData.append("authkey="+authkey);
        sbPostData.append("&mobiles="+mobiles);
        sbPostData.append("&message="+encoded_message);
        sbPostData.append("&route="+route);
        sbPostData.append("&sender="+senderId);

        //final string
        mainUrl = sbPostData.toString();
        try
        {
            //prepare connection
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            //reading response
            String response;
            while ((response = reader.readLine()) != null)
            //print response
            System.out.println(response);

            //finally close connection
            reader.close();
        }
        catch (IOException e)
        {
                e.printStackTrace();
        }
	}
	@Override
	public int cartSize(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Customer customer = SessionUtils.getSessionVariables(request,
				ControllerConstants.CUSTOMER);
		List<Product> productsList = null;
		int size=0;
		if (customer != null) {
			// Customer is anonymous, so create a shared cart and add it to
			// session
			// Creates a new cart for the anonymous customer
			Long customerId=customer.getCustomerId();
			productsList = new ArrayList<Product>();
			productsList=fetchCartDetails(customerId);
			
			if (productsList!=null) {
				size=productsList.size();
			}
			/*model.addAttribute("productsList", productsList);*/
			
		} 
		return size;
	}


}
