<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select a Payment Method</title>
           
   
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
 
     <h2><font >Your Orders</font></h2>
                    <hr>
               <c:forEach var="orders" items="${orderList}">                        
                       
  <div class="panel panel-default">
  <!-- Default panel contents -->
  
  <div class="panel-heading">
  
   
  <table width="90%">
  
  <tr>
      <td>ORDER PLACED <br> ${orders.createdDate}</td>
      <td>TOTAL
  <br>RS.${orders.orderTotal}</td>
      <td>SHIP TO <br>
Dhananjayulu Adari</td>
<td>ORDER # ${orders.ordersId} <br>Order Details  |Printable Order Summary</td>
  <tr>
    
  </table></div>
  

  <!-- Table -->
  <c:forEach var="orderItems" items="${orderItemsList}">
   <%-- <c:out value="${orderItems.orderItemId}"/>
  <c:out value="${orderItems.price}"/>
  <c:out value="${orderItems.ordersId}"/> --%>
  
  <c:if test="${orderItems.ordersId == orders.ordersId}"> 
  <%-- <c:if test="${'1' == '1'}"> --%>
  <table class="table" width="90%" >
  
  <tr>
     	 <td align="center" width="15%">
     	 	<img	class="media-object" src="https://s3.amazonaws.com/srishtibiz/${orderItems.productId}.jpg" style="width: 72px; height: 72px;">
		</td>
      <td align="left" width="45%">
      	 ${orderItems.productName} <br> <!-- Manufacture <br> --> Rs.${String.format('%.2f', orderItems.price)}<br>Quantity: <c:out value="${orderItems.quantity}"/>
      </td>
      
      <td  align="center" width="30%">
     <%--  <a  href="${orders.formUrl}" type="button" class="btn button">Contact seller </a> <br>
	  <a  type="button" class="btn button"> Return Or Replace </a> <br> --%>
	  <a href="writereview?productId=${orderItems.productId}" target="_blank" type="button" class="btn button2"> Write a Product Review </a>
										
      </td>
      
  <tr>
  
   
  </table>
  </c:if>
  </c:forEach>
</div>
 </c:forEach>
</div>
<br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>