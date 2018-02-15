package com.spring.shopping.service;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easypost.exception.EasyPostException;
import com.easypost.model.Address;
import com.easypost.model.CustomsInfo;
import com.easypost.model.CustomsItem;
import com.easypost.model.EasyPost;
import com.easypost.model.Parcel;
import com.easypost.model.Shipment;
import com.easypost.model.Tracker;
import com.spring.shopping.controller.constants.ControllerConstants;
import com.spring.shopping.model.AddressForm;
import com.spring.shopping.model.CartProducts;
import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Orders;
import com.spring.shopping.model.OrderItem;
import com.spring.shopping.model.Product;
import com.spring.shopping.repository.OrderRepository;
import com.spring.shopping.util.SessionUtils;
import com.spring.shopping.util.Utility;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepository orderRepository;
	private final String PENDING_ORDER_STATUS = "Pending";

	// private final String COMPLETED_ORDER_STATUS = "Completed";

	
	public Orders createOrder(CartService cartService,
			Customer customer, AddressForm address, HttpServletRequest request)
			throws ParseException {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(date);
		Date presentDate = dateFormat.parse(formattedDate);
		java.util.Date sqlDate = new java.util.Date(presentDate.getTime());
		Long orderId = Utility.generateOrderNumber(date, customer);
		Orders order = new Orders();
		order.setOrderId(orderId);
		order.setCreatedDate(sqlDate);
		order.setUpdatedDate(sqlDate);
		order.setEmailAddress(customer.getEmailAddress());
		order.setOrderStatus(PENDING_ORDER_STATUS);
		CartData cartData = SessionUtils.getSessionVariables(request,
				ControllerConstants.CART);
		order.setOrderTotal(new BigDecimal(cartService.getTotal(cartData)));
		order.setCustomerId(customer.getCustomerId());
		List<OrderItem> orderItemsList = new ArrayList<OrderItem>();
		for (OrderItem orderItem : cartService.getOrderItemsList(cartData)) {
			orderItemsList.add(orderItem);
		}
		orderRepository.createOrder(order, orderItemsList, address);
		return order;
	}

	
	public List<Product> getAllOrderItems(Orders order) {

		return orderRepository.readAllOrderItems(order);
	}

	
	public List<Orders> getAllOrdersForCustomer(Customer customer) {

		return orderRepository.readAllOrdersForCustomer(customer);
	}

	
	public Orders getOrderById(String orderId) {
		return orderRepository.readOrderById(orderId);
	}


	@Override
	public Orders placeOrder(List<CartProducts> CartProductsList,Customer customer) {
		// TODO Auto-generated method stub
		return orderRepository.placeOrder(CartProductsList,customer);
	}


	@Override
	public Tracker createTracking() {
		// TODO Auto-generated method stub
		EasyPost.apiKey = "30QRPglR0X1TP0uCDA0Gow";
		Tracker t=new Tracker();
        Map<String, Object> fromAddressMap = new HashMap<String, Object>();
        fromAddressMap.put("name", "Simpler Postage Inc");
        fromAddressMap.put("street1", "388 Townsend St");
        fromAddressMap.put("street2", "Apt 20");
        fromAddressMap.put("city", "San Francisco");
        fromAddressMap.put("state", "CA");
        fromAddressMap.put("zip", "94107");
        fromAddressMap.put("phone", "415-456-7890");

        Map<String, Object> toAddressMap = new HashMap<String, Object>();
        toAddressMap.put("name", "Sawyer Bateman");
        toAddressMap.put("street1", "1A Larkspur Cres");
        toAddressMap.put("street2", "");
        toAddressMap.put("city", "St. Albert");
        toAddressMap.put("state", "AB");
        toAddressMap.put("zip", "T8N2M4");
        toAddressMap.put("phone", "780-483-2746");
        toAddressMap.put("country", "CA");

        Map<String, Object> parcelMap = new HashMap<String, Object>();
        parcelMap.put("weight", 22.9);
        parcelMap.put("height", 12.1);
        parcelMap.put("width", 8);
        parcelMap.put("length", 19.8);

        Map<String, Object> customsItem1Map = new HashMap<String, Object>();
        customsItem1Map.put("description", "EasyPost T-shirts");
        customsItem1Map.put("quantity", 2);
        customsItem1Map.put("value", 23.56);
        customsItem1Map.put("weight", 18.8);
        customsItem1Map.put("origin_country", "us");
        customsItem1Map.put("hs_tariff_number", "123456");

        Map<String, Object> customsItem2Map = new HashMap<String, Object>();
        customsItem2Map.put("description", "EasyPost Stickers");
        customsItem2Map.put("quantity", 11);
        customsItem2Map.put("value", 8.98);
        customsItem2Map.put("weight", 3.2);
        customsItem2Map.put("origin_country", "us");
        customsItem2Map.put("hs_tariff_number", "654321");

        try {
            Address fromAddress = Address.create(fromAddressMap);
            Address toAddress = Address.create(toAddressMap);
            Parcel parcel = Parcel.create(parcelMap);


            try {
                Address verified = toAddress.verify();
            } catch (EasyPostException e) {
                System.out.println(e.getMessage());
            }

            // customs
            Map<String, Object> customsInfoMap = new HashMap<String, Object>();
            customsInfoMap.put("integrated_form_type", "form_2976");
            customsInfoMap.put("customs_certify", true);
            customsInfoMap.put("customs_signer", "Dr. Pepper");
            customsInfoMap.put("contents_type", "gift");
            customsInfoMap.put("eel_pfc", "NOEEI 30.37(a)");
            customsInfoMap.put("non_delivery_option", "return");
            customsInfoMap.put("restriction_type", "none");
            CustomsItem customsItem1 = CustomsItem.create(customsItem1Map);
            CustomsItem customsItem2 = CustomsItem.create(customsItem2Map);
            List<CustomsItem> customsItemsList = new ArrayList<CustomsItem>();
            customsItemsList.add(customsItem1);
            customsItemsList.add(customsItem2);
            customsInfoMap.put("customs_items", customsItemsList);
            CustomsInfo customsInfo = CustomsInfo.create(customsInfoMap);

            // create shipment
            Map<String, Object> shipmentMap = new HashMap<String, Object>();
            shipmentMap.put("to_address", toAddress);
            shipmentMap.put("from_address", fromAddress);
            shipmentMap.put("parcel", parcel);
            shipmentMap.put("customs_info", customsInfo);

            Shipment shipment = Shipment.create(shipmentMap);

            // buy postage
            List<String> buyCarriers = new ArrayList<String>();
            buyCarriers.add("USPS");
            List<String> buyServices = new ArrayList<String>();
            buyServices.add("Priority");
            // List<String> buyServiceCodes = new ArrayList<String>();
            // buyServiceCodes.add("fedex.fedex_ground");

            Map<String, Object> buyMap = new HashMap<String, Object>();
            buyMap.put("rate", shipment.lowestRate(buyCarriers, buyServices));
            buyMap.put("insurance", 249.99);

            // shipment = shipment.buy(shipment.lowestRate(buyCarriers, buyServices));
            shipment = shipment.buy(buyMap);

            System.out.println(shipment.prettyPrint());

            JSONObject jsonObj = new JSONObject(shipment);   
              
            JSONObject result = jsonObj.getJSONObject("tracker");
            
               
            String trackingCode=jsonObj.getString("trackingCode");
            System.out.println("trackingCode"+trackingCode);
            String shipmentId=result.getString("shipmentId");
            String publicUrl=result.getString("publicUrl");
            JSONObject postage_label = jsonObj.getJSONObject("postageLabel");
           
            String labelUrl=postage_label.getString("labelUrl");
           
          
           JSONArray array=jsonObj.getJSONArray("forms");
          
           JSONObject form=array.getJSONObject(0);
          
           String formUrl=form.getString("formUrl");
        
          t.setShipmentId(shipmentId);
          t.setPublicUrl(publicUrl);
          //t.setCarrier(carrier);
         // t.setEstDeliveryDate(estDeliveryDate);
          t.setTrackingCode(trackingCode);
          t.setFormUrl(publicUrl);
         
            
        } catch (EasyPostException e) {
            e.printStackTrace();
        }
		return t;
	}


	@Override
	public List<OrderItem> getAllOrderItemsCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return orderRepository.getAllOrderItemsCustomer(customer);
	}


	@Override
	public List<OrderItem> getAllOrderItemsBasedonOrders(Orders o) {
		// TODO Auto-generated method stub
		return orderRepository.getAllOrderItemsBasedonOrders(o);
	}

}