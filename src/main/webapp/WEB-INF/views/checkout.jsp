<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    width: 20%;
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
</style>
</head>
<body>
<div class="address">

<img style="width: 140px; height: 41px; position: relative; right: -15px;"
                                         alt="Srishi I2I"
                                         src="https://s3.amazonaws.com/srishtibiz/ecart.jpg">&emsp;<!-- (Delivery & Payment) -->
                                         
                                           <br>
                                             
                                         &emsp;<h3><b>Select a delivery address</b></h3><br>
                                     <small> Is the address you'd like to use displayed below? If so, click the corresponding "Deliver to this address" button. Or you can enter a new delivery address.</small>
                                  <hr width="100%">
                                       
                              <c:if test="${not empty address}">       
                              <div>
                              
                              
                               <div class="portlet-body">
                               
                              <form:form commandName="addressForm" id="addressForm" action="shippingaddress" method="POST" role="form">
                               
                               <c:set var="address" value="${address}" />
                               <c:forEach var="products" items="${productsList}">
		<input name="productId" type="hidden" class="form-control" value="${products[0]}" />
		<input name="name" type="hidden" class="form-control" value="${products[1]}" />
		<input name="price" type="hidden" class="form-control" value="${products[2]}" />
		<input name="quantity" type="hidden" class="form-control" value="${products[5]}" />
		<input name="manufacturer" type="hidden" class="form-control" value="${products[3]}" />
		
		
		
		</c:forEach>
		<input type="hidden" name="addressId" value="${address.addressId}">
		<input type="hidden" name="fullName" value="${address.fullName}">
		<input type="hidden" name="phoneNumber" value="${address.phoneNumber}" >
		<input type="hidden" name="zipCode" value="${address.zipCode}" >
		<input type="hidden" name="address1" value="${address.address1}">
		<input type="hidden" name="address2" value="${address.address2}">
		<input type="hidden" name="city" value="${address.city}">
		<input type="hidden" name="state" value="${address.state}">
		<input type="hidden" name="landmark" value="${address.landmark}">
			<input name="total" type="hidden" class="form-control" value="${productsList.stream().map(products -> products[2]*products[5]).sum()}" />
                                                                                    <div class="row static-info">
                                                                                        <div class="col-md-12 value"> <label class="control-label"><b>${address.fullName}</b></label>
                                                                                        <c:set var="address" value="${address}" />
                                                                                        <br> ${address.address1}
                                                                                            <br> ${address.address2}
                                                                                            <br> ${address.city}, ${address.state} ${address.zipCode}
                                                                                            <!-- <br> #26, 3rd Main, 15th Cross
                                                                                            <br> Hoysala Nagar
                                                                                            <br> BENGALURU, KARNATAKA 560016 -->
                                                                                            <br> India<br>
                                                                                             <br><button id="signinSubmit" type="submit" class="btn  button">Deliver to this address</button> 
                                                                                             <br><br><button id="signinSubmit" type="button" class="btn  button2">Edit</button>
                                                                                             <button id="signinSubmit" type="button" class="btn  button2">Delete</button> 
                                                                                             
                                                                                             </div>
                                                                                    </div>
                                                                                      </form:form>
                                                                                </div> 
                                                                                
                                                                              
                             

                              </div>         
                           </c:if>  
                           
                           <br><hr>
                                       
                       
                    
		<div class="row">
			
				<div class="panel-body">
				<form:form commandName="addressForm" id="addressForm" action="shippingaddress" method="POST" role="form">
				
				<c:set var="address" value="${address}" />
	
		<c:forEach var="products" items="${productsList}">
		<input name="productId" type="hidden" class="form-control" value="${products[0]}" />
		<input name="name" type="hidden" class="form-control" value="${products[1]}" />
		<input name="price" type="hidden" class="form-control" value="${products[2]}" />
		<input name="quantity" type="hidden" class="form-control" value="${products[5]}" />
		<input name="manufacturer" type="hidden" class="form-control" value="${products[3]}" />
		
		
		
		
		</c:forEach>
		<input name="total" type="hidden" class="form-control" value="${productsList.stream().map(products -> products[2]*products[5]).sum()}" />
					
						<div class="form-group">
							<h4><b>Add a new address</b></h4>
							<small>Be sure to click "Deliver to this address" when you've finished.</small>
						</div>
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Full Name</strong>
							<input type="hidden" name="addressId">
							<input id="signinEmail" type="text" name="fullName" maxlength="50" class="form-control" placeholder="Full Name" required>
							</div>
						</div>
						</div>
						
					 
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Mobile number</strong>
							<input  id="signinEmail"  type="text"  name="phoneNumber" class="form-control" placeholder="Mobile number" required>
							</div>
						</div>
						</div>
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Pincode:</strong>
							<input id="signinEmail" name="zipCode" type="text" maxlength="50" class="form-control" placeholder="Pincode" required>
							</div>
						</div>
						</div>
						 
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Flat / House No. / Floor / Building:</strong>
							<input id="signinEmail" name="address1" type="text" maxlength="50" class="form-control" placeholder="" required>
							</div>
						</div>
						</div>
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Colony / Street / Locality:</strong>
							<input id="signinEmail" name="address2" type="text" maxlength="50" class="form-control" placeholder="" required>
							</div>
						</div>
						</div> 
						
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Landmark:</strong><small>(optional)</small>
							<input id="signinEmail" type="text"  name="landmark" class="form-control" placeholder="E.g. Near AIIMS Flyover, Behind Regal Cinema, etc. " required>
							</div>
						</div>
						</div> 
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Town/City:</strong>
							<input id="signinEmail" name="city" type="text" maxlength="50" class="form-control" placeholder="Mobile number" required>
							</div>
						</div>
						</div>
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>State:</strong>
							<input name="State" type="text" maxlength="50" class="form-control" placeholder="State" required>
							</div>
						</div>
						</div>
						
						
						<!-- <div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Additional Address Details:</strong><br>
							<small>Preferences are used to plan your delivery. However, shipments can sometimes arrive early or later than planned.</small>
							
							</div>
						</div>
						</div>
						
						<div class="form-group">
						<div class="row">
						<div class="col-md-5">
							<strong>Address Type:</strong>
							<select name="AddressType" class="form-control" >
<option value="OTH"> Select an Address Type </option>
<option value="RES"> Home (7 AM - 9PM delivery) </option>
<option value="COM"> Office/Commercial (10 AM - 5 PM delivery) </option>
</select>
							</div>
						</div>
						</div> -->
						
						
						
						<div class="form-group">
						
						<div class="row">
						<div class="col-md-10">
						<!-- <input type="submit"  class="btn button form-control pull-right" value="Deliver to this address" > -->
						<button id="signinSubmit" type="submit" class="btn button form-control" >Deliver to this address</button> 
						
						</div></div>
						</div>
						
						
					</form:form>
				</div>
			
		</div>

                   
                   
                   
                   
                   
                   
                       
                                       
                                       
                                       
</div>




</body>
</html>