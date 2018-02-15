<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Arrays.*" %> 
<%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select a Payment Method</title>
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
.button:hover {
    background-color: #d68f33;
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
<form action="squareupindex" method="post">
<c:forEach var = "i" begin="0" end="${fn:length(name)-1}" varStatus="loop">
		<input name="productId" type="hidden" class="form-control" value="${productId[i]}" />
		<input name="name" type="hidden" class="form-control" value="${name[i]}" />
		<input name="price" type="hidden" class="form-control" value="${price[i]}" />
		<input name="quantity" type="hidden" class="form-control" value="${quantity[i]}" />
		<input name="manufacturer" type="hidden" class="form-control" value="${manufacturer[i]}" />
		<input name="total" type="hidden" class="form-control" value="${total}" />
		</c:forEach>
		
			<input id="ORDER_ID" type="hidden" tabindex="1" maxlength="20" size="20" name="ORDER_ID"  autocomplete="off" value="ORDS_<%= randomInt %>">
						<input id="CUST_ID" type="hidden" tabindex="2" maxlength="30" size="12"  name="CUST_ID" autocomplete="off" value="CUST001">
						
						<input id="INDUSTRY_TYPE_ID" type="hidden" tabindex="4" maxlength="12"  size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
						
						<input id="CHANNEL_ID" type="hidden" tabindex="4" maxlength="12"  size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
						
						<input title="TXN_AMOUNT" type="hidden" tabindex="10" type="text" name="TXN_AMOUNT" value="1">
<img style="width: 140px; height: 41px; position: relative; right: -15px;"
                                         alt="Srishi I2I"
                                         src="https://s3.amazonaws.com/srishtibiz/ecart.jpg">&emsp;<!-- (Delivery & Payment) -->
                                         
                                           <br> <br>
                                             
                                        <h2><b>Select a payment method</b></h2>
                                   
                                       
                                   
                           <hr>
                                       
                       
             
             
             <div class="col-md-6">
            
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					
						<div class="form-group">
							<h4><b>Another payment method</b></h4><hr>
						</div>
						
						
						<div style="white-space:nowrap;">
  
  <input type="radio" id="one" name="paymenttype" value="paytm" required/>&nbsp;&nbsp;
  <label for="one"><b><font size="3">Paytm</font></b></label>
  <div class="a-row" style="">
         &emsp; <img src="https://s3.amazonaws.com/srishtibiz/paytm2.jpg" alt="Paytm Logo">
          <span class="vcc-info-prompt js-hide" style="display: none;">We’ll save this card for your convenience, you can remove it by visiting Your Account section.</span>
        </div>
</div>
<br>
	<div style="white-space:nowrap;">
  
  <input type="radio" id="one" name="paymenttype" value="squareup" required/>&nbsp;&nbsp;
  <label for="one"><b><font size="3">Square Up</font></b></label>
  <div class="a-row" style="">
         &emsp; <img src="https://s3.amazonaws.com/srishtibiz/squareup.jpg" alt="square card Logo" >
          <span class="vcc-info-prompt js-hide" style="display: none;">We’ll save this card for your convenience, you can remove it by visiting Your Account section.</span>
        </div>
</div>
						
						
						
						
					<br>
						
						
						
						<!-- <p class="form-group"><a href="#" class="btn  btn-block button2">Create an account</a></p>-->
						<p class="form-group">By signing in you are agreeing to our <a href="#">Terms of Use</a> and our <a href="#">Privacy Policy</a>.</p> 
					
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
					<div class="form-group" style="padding-top: 12px;">
							<button id="signinSubmit" type="submit" class="btn btn-block button">Continue</button>
							You can review this order before it's final.
						</div>
				 </div>
				  </div>
				   </div>		
              
              </div>
         
                                     
    </form>                                   
</div>




</body>
</html>