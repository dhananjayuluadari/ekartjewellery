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
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/navbar.jsp"></jsp:include>

 
  <br><br>
  <div class="container">
	<div class="row">
		<div class="col-xs-8">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-6">
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
							</div>
							<div class="col-xs-6">
								<a href="home"><button type="button" class="btn btn-primary btn-sm btn-block">
									<span class="glyphicon glyphicon-share-alt"></span>Continue shopping
								</button></a>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="row">
				
				
						<div class="col-md-2">&nbsp;
						</div>
						<div class="col-md-4">
							<h4 ><strong>Product</strong></h4>
						</div>
						<div class="col-md-6">
							<div class="col-md-6 text-right">
								<h4 ><strong>Price</strong></h4>
							</div>
							<div class="col-md-4">
							<h4 ><strong>Quantity</strong></h4>
								
							</div>
							
						</div>
					</div>
					<hr>
					 <c:forEach var = "i" begin="0" end="${fn:length(name)-1}" varStatus="loop">
					<div class="row">
						<div class="col-xs-2"><img class="img-responsive" src="https://s3.amazonaws.com/srishtibiz/${productId[i]}.jpg">
						</div>
						<div class="col-xs-4">
						
														
							<h4 class="product-name"><strong><a href="product?productId=${productId[i]}"><c:out
																	value="${name[i]}" /></a></strong></h4><h4><small>Product description</small></h4>
							
							<h5 class="media-heading">by <c:out value="${manufacturer[i]} " />
														</h5>
														<span>Status: </span><span class="text-success"><strong>In
																Stock</strong></span><br>
																
																<span><a href="remove?productId=${productId[i]}">Delete</a> </span>
						</div>
						<div class="col-xs-6">
							<div class="col-xs-6 text-right">
								<h6><strong>Rs&nbsp;${price[i]} <span class="text-muted">x</span></strong></h6>
							</div>
							<div class="col-xs-4">
								<input type="text" readonly class="form-control input-sm" value="${quantity[i]}">
							</div>
							<!-- <div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs">
									<span class="glyphicon glyphicon-trash"> </span>
								</button>
							</div> -->
						</div>
					</div>
					<hr>
						</c:forEach>
					
					<hr>
					<div class="row">
						<div class="text-center">
							<div class="col-xs-9">
								<h6 class="text-right">Added items?</h6>
							</div>
							<div class="col-xs-3">
								<a href="cart1"><button type="button" class="btn btn-default btn-sm btn-block">
									Update cart
								</button></a>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-9">
							<h4 class="text-right">Total <strong>Rs.<c:out value="${total}" /></strong></h4>
						</div>
						<div class="col-xs-3">
						<form method="post" action="paytmhome">
	
	<input id="ORDER_ID" type="hidden" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="ORDS_<%= randomInt %>">
	<input id="CUST_ID" type="hidden" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST00<%=customerId%>">
	<input id="INDUSTRY_TYPE_ID" type="hidden" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
	<input id="CHANNEL_ID" type="hidden" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
	<input title="TXN_AMOUNT" type="hidden" tabindex="10" type="text" name="TXN_AMOUNT" value="${total}">
		<button type="submit" class="btn btn-success btn-block">
								Continue to Payment
							</button>
		
	</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



  
	<%-- <form method="post" action="paytmhome">
	
	<input id="ORDER_ID" type="hidden" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="ORDS_<%= randomInt %>">
	<input id="CUST_ID" type="hidden" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST00<%=customerId%>">
	<input id="INDUSTRY_TYPE_ID" type="hidden" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
	<input id="CHANNEL_ID" type="hidden" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
	<input title="TXN_AMOUNT" type="hidden" tabindex="10" type="text" name="TXN_AMOUNT" value="${total}">
		
		<input value="CheckOut" type="submit"	onclick="">
	</form> --%>
	<br><br><br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>