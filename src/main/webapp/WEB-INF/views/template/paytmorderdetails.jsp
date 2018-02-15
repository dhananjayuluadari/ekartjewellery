<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Completion</title>
           
   
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  a.btn {
     -webkit-transform: scale(0.8);
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
      width: 100%;
 }
 .button2 {
    background-color: #cecdcb; /* Green */
    color:black;  
}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/navbar.jsp"></jsp:include>
 <br><br>
  
  
  
  
  
  
  
  
  <div class="container" style="width:70%;">
 
     <h3><font >Order Details</font></h3>
     <small> Ordered On: ${order.createdDate} &emsp;&emsp;&emsp;&emsp; Order No:&nbsp;${transactionId}</small>
                    <hr>
                    
                  <div class="col-md-12">
            
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					<form method="POST" action="#" role="form">
					                                                           <div class="col-md-5">
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
                                                                                 <div class="col-md-3">
                                                                                <div class="portlet-body">
                                                                                    <div class="row static-info">
                                                                                        <div class="col-md-12"> <label class="control-label"><b>Payment method</b></label>
                                                                                             <br>${orderpaymenttype}
                                                                                           
                                                                                             
                                                                                             </div>
                                                                                    </div>
                                                                                </div>  </div> 
                                                                                
                                                                                <div class="col-md-4">
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
                                                                                             <span style="float: left; width: 50%;  font-size: 90%; font-weight: bold;text-align: left;">Grand Total:</span>
                                                                                             <span style="float: left; width: 50%;  font-size: 90%;font-weight: bold;text-align: right;">${String.format('%.2f', total)}</span>
                                                                                             	  
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
	
	<br>
	
                                
                       
  
</div>
  
  
  
  
  
  
	

<div class="container" style="width:70%;">
 
    
                       
  <div class="panel panel-default">
  <!-- Default panel contents -->
  
  <div class="panel-heading">
  <label class="control-label"><b>Shipments</b></label>
  
  </div>
  

  <!-- Table -->
  
   <%-- <c:out value="${orderItems.orderItemId}"/>
  <c:out value="${orderItems.price}"/>
  <c:out value="${orderItems.ordersId}"/> --%>
  
  	<c:forEach var = "i" begin="0" end="${fn:length(name)-1}" varStatus="loop">
  
  <table class="table" width="90%" >
  
  <tr>
     	 <td align="center" width="15%">
     	 	<img	class="media-object" src="https://s3.amazonaws.com/srishtibiz/${productId[i]}.jpg" style="width: 72px; height: 72px;">
		</td>
      <td align="left" width="45%">
      ${name[i]} <br> <!-- Manufacture <br> --> Rs.${String.format('%.2f', price[i])}<br>Quantity: ${quantity[i]}
      </td>
      
      
      <td  align="center" width="30%">
     <%--  <a  href="${orders.formUrl}" type="button" class="btn button">Contact seller </a> <br>
	  <a  type="button" class="btn button"> Return Or Replace </a> <br> --%>
	  <a href="writereview?productId=${productId[i]}" target="_blank" type="button" class="btn button2"> Write a Product Review </a>
										
      </td>
      
  <tr>
  
   
  </table>
  
  </c:forEach> 
</div>
 
</div>
<br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>