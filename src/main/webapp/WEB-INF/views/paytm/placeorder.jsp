<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>  
 <%@page import="com.spring.shopping.model.*" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
	Customer customer =(Customer)session.getAttribute("customer");
	
	Long customerId=customer.getCustomerId();
 %>
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Place Order</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.3.2/css/simple-line-icons.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
     <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/layouts/layout3/css/layout.min.css" rel="stylesheet" type="text/css" />
 <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/layouts/layout3/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/layouts/layout3/css/custom.min.css" rel="stylesheet" type="text/css" />             
   
<style type="text/css">
form { margin: 0px 10px; }

h2 {
  margin-top: 2px;
  margin-bottom: 2px;
}

.container { max-width: 360px; }

.divider {
  text-align: center;
  margin-top: 20px;
  margin-bottom: 5px;
}

.divider hr {
  margin: 7px 0px;
  width: 35%;
}

.left { float: left; }

.right { float: right; }
.button {
    background-color: #f2c55e; /* Green */
   color:black;  
    width: 100%;
}
.button2 {
      font-size: 11px;
    color: #fff;
    z-index: 5;
    padding:3px;    
    margin: 0;
    height: 23px;
    -webkit-transition: all 0.2s ease-in-out;
    -moz-transition: all 0.2s ease-in-out;
    -o-transition: all 0.2s ease-in-out;
    -ms-transition: all 0.2s ease-in-out;
    transition: all 0.2s ease-in-out;
      background-color: #cecdcb; /* Green */
    border: none;
   color:black;  
    width: 10%;
    box-shadow: none;
}


div.address{
    padding: 100px;
     padding-top: 10px;
}
body{margin:40px;}

/* .stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 50%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
} */
</style>
</head>
<body>
<c:choose>
<c:when test="${paymenttype=='squareup'}">

<form method="post" action="squareuppayment">
<c:forEach var = "i" begin="0" end="${fn:length(name)-1}" varStatus="loop">
		<input name="productId" type="hidden" class="form-control" value="${productId[i]}" />
		<input name="name" type="hidden" class="form-control" value="${name[i]}" />
		<input name="price" type="hidden" class="form-control" value="${price[i]}" />
		<input name="quantity" type="hidden" class="form-control" value="${quantity[i]}" />
		<input name="manufacturer" type="hidden" class="form-control" value="${manufacturer[i]}" />
		<input name="total" type="hidden" class="form-control" value="${total}" />
		
		</c:forEach>
		<input name="paymenttype" type="hidden" class="form-control" value="${paymenttype}" />
</c:when>
<c:otherwise>
<form method="post" action="paytmhome">

</c:otherwise>
</c:choose>

<div class="address">

<img style="width: 140px; height: 41px; position: relative; right: -15px;"
                                         alt="Srishi I2I"
                                         src="https://s3.amazonaws.com/srishtibiz/ecart.jpg">
                                         
                                     <!--     <div class="stepwizard">
    <div class="stepwizard-row">
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">1</button>
            <p>Cart</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-primary btn-circle">2</button>
            <p>Shipping</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle" disabled="disabled">3</button>
            <p>Payment</p>
        </div> 
    </div>
</div> -->&emsp;<!-- (Delivery & Payment) -->
                                         
                                           <br> <br>
                                             
                                        <h3><b>Review your order</b></h3>
                                   
                                      <small> By clicking on the 'Place Your Order and Pay' button, you agree to ecart's privacy notice and conditions of use.</small>
                                   
                           <hr>
                                       
                       
             
             
             <div class="col-md-6">
            
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					<form method="POST" action="#" role="form">
					                                                           <div class="col-md-6">
						                                                      <div class="portlet-body">
                                                                                    <div class="row static-info">
                                                                                        <div class="col-md-12"> <label class="control-label"><b>Shipping address </b></label>
                                                                                             <br>${shippingAddress.fullName}
                                                                                              <br> ${shippingAddress.address1}
                                                                                            <br> ${shippingAddress.address2}
                                                                                            <br> ${shippingAddress.city}, ${shippingAddress.state} ${shippingAddress.zipCode}
                                                                                            <br> India<br>Phone: ${shippingAddress.phoneNumber}
                                                                                            
                                                                                             
                                                                                             </div>
                                                                                    </div>
                                                                                </div>  </div> 
                                                                                 <div class="col-md-6">
                                                                                <div class="portlet-body">
                                                                                    <div class="row static-info">
                                                                                        <div class="col-md-12"> <label class="control-label"><b>Payment method</b></label>
                                                                                             <br>${paymenttype}
                                                                                           
                                                                                             
                                                                                             </div>
                                                                                    </div>
                                                                                </div>  </div> 
                                                                                
                                                                                
                                                                              <div class="portlet-body">
                                                                              <div class="row static-info">&nbsp;
                                                                               </div>  
                                                                              </div>  
						
						
						
					<br>
						
						
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
             <div class="col-md-1">
             </div>
              <div class="col-md-3">
              
              <div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					
							<button id="signinSubmit" type="submit" class="btn btn-block button">Place your order</button>
							<br>
						                                              <div class="portlet-body">
                                                                                    <div class="row static-info">
                                                                                       <div class="col-md-12"> <label class="control-label"><b>Order Summary</b></label>
                                                                                             <br>
                                                                                             <span style="float: left; width: 50%; text-align: left;">Items:</span>
                                                                                            <span style="float: left; width: 50%; text-align: right;">${String.format('%.2f', total)}</span>
                                                                                              <br>
                                                                                             <span style="float: left; width: 50%; text-align: left;">Delivery:</span>
                                                                                             <span style="float: left; width: 50%; text-align: right;">0.00</span>
                                                                                              <br>
                                                                                             <span style="float: left; width: 50%; text-align: left;">Total:</span>
                                                                                             <span style="float: left; width: 50%; text-align: right;">${String.format('%.2f', total)}</span>
                                                                                             <br><hr>
                                                                                             <span style="float: left; width: 50%; color:red; font-size: 120%; font-weight: bold;text-align: left;">Order Total:</span>
                                                                                             <span style="float: left; width: 50%; color:red; font-size: 120%;font-weight: bold;text-align: right;">${String.format('%.2f', total)}</span>
                                                                                             	  
                                                                                             </div>
                                                                                    </div>
                                                                                </div>
						
						
						
						
				 </div>
				  </div>
				   </div>		
              
              </div>
      
      
      
      
      
       <div class="col-md-6">
            
		<div class="row">
			<div class="panel panel-primary">
				   &emsp;<!-- <span style="color:red;font-size: 120%; font-weight: bold;">Estimated delivery:  6 Feb 2018 - 8 Feb 2018</span>   -->
                                                                             
                                                                             
                <br>
						
	 
           
                <c:forEach var = "i" begin="0" end="${fn:length(name)-1}" varStatus="loop">
					<div class="row">
						<div class="col-xs-3"><img class="img-responsive" src="https://s3.amazonaws.com/srishtibiz/${productId[i]}.jpg">
						</div>
						<div class="col-xs-4">
						
														
							<h4><strong><a href="product?productId=${productId[i]}"><c:out
																	value="${name[i]}" /></a></h4><h5>by <c:out value="${manufacturer[i]} " /></h5>
																	<h4><small>Rs&nbsp;${String.format('%.2f', price[i])}</small></h4>
							
							
														
														<span>Quantity: </span><span class="text-success"><strong>${quantity[i]}
																</strong></span><br>
																
																<span><a href="remove?productId=${productId[i]}">Delete</a> </span>
						</div>
						
					</div>
					<hr>
						</c:forEach>
           
			
			
			
		
		
		
		
		
		</div>
		
		   
       
      
    
		
		
		
		
		
		
		
		
	</div>
	
      
                             
                                       
</div>




   <div class="col-md-1">
             </div>
<div class="col-md-3">
              
              <div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					
							<button id="signinSubmit" type="submit" class="btn btn-block button">Place your order</button>
							<br>
						                                             
						
						
						
						
				 </div>
				  </div>
				   </div>		
              
              </div>
      

<input id="ORDER_ID" type="hidden" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="ORDS_<%= randomInt %>">
	<input id="CUST_ID" type="hidden" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST00<%=customerId%>">
	<input id="INDUSTRY_TYPE_ID" type="hidden" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
	<input id="CHANNEL_ID" type="hidden" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
	<input title="TXN_AMOUNT" type="hidden" tabindex="10" type="text" name="TXN_AMOUNT" value="${total}">


</form>



</body>
</html>