package com.spring.shopping.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.ShippingAddress;

public class Utility {

	public static Long generateOrderNumber(Date date, Customer customer) {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		String formattedDate = dateFormat.format(date);
		Long orderId = Long.parseLong(formattedDate)
				* (customer.getCustomerId());
		return orderId;
	}

	public static Long generateAddressNumber(AddressForm address,
			Customer customer) {
		return (long) (Long.parseLong(address.getZipCode())
				* customer.getCustomerId() * Math.random());
	}

	public static Long generateAddressNumber(ShippingAddress shippingAddress, Customer customer) {
		// TODO Auto-generated method stub
		return (long) (Long.parseLong(shippingAddress.getZipCode())
				* customer.getCustomerId() * Math.random());
	}
	
	public static String converDtFormatEcart(Date dt, String outputFormat) 
    {
          String outputDtStr ="";
          SimpleDateFormat outputFormatter = new SimpleDateFormat(outputFormat);

                try {
                      System.out.println(" input dt is "+dt);
                      System.out.println(" output format is "+outputFormat);
                      outputDtStr = outputFormatter.format(dt);
                      System.out.println(" final outputDt :" + outputDtStr);
                } catch (Exception e) {
                      System.out.println(" Exception in date format converion " + e);
                }
          System.out.println(" final outputDt  :" + outputDtStr);

          return outputDtStr;
    }

	
	
}