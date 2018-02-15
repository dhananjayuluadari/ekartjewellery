<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ShopIeasy</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/resource/images/favicon1.png"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/resource/bootstrap/css/bootstrap.min.css"/>">
<script src="<c:url value="/resources/resource/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<style type="text/css">

 a.btn {
     -webkit-transform: scale(0.8);
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
 }
 .verticalLine {
 
  border-left: 0.1px solid #cecdcb;
  
   
}
.button {
    background-color: #f2c55e; /* Green */
   color:black;  
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
 <div class="container">
		<h3><b>Shopping Cart</b></h3>
		<section id="main">
			<div class="row">
				<div class="col-sm-8 col-md-8">

					<table class="table table-hover">
					<c:choose>
							<c:when test="${productsList.size() > 0}">
						<thead>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
								
							</tr>
						</thead>
						</c:when>
						</c:choose>
						<tbody>
							<c:choose>
							<c:when test="${productsList.size() == 0}">
								<%System.out.println("chekicng if loop"); %>
									<tr>
										<c:url var="home" value="home" />
										<div style="text-align: center">
											<h4>Your Shopping Cart is Empty</h4>
											<a href="${home}" class="btn button">Continue Shopping</a>
										</div>
									</tr>
									<br><br><br><br><br><br><br><br><br><br><br><br><br>
								</c:when>
								<c:when test="${productsList.size() > 0}">
								<%System.out.println("chekicng else loop"); %>
									
										<%-- <ul>
			                           <c:forEach var="products" items="${productsList}">
			                           
				                        <li>${products[1]}</li>
			                                     </c:forEach>
		                                 </ul> --%>
                                       <c:forEach var="products" items="${productsList}" varStatus="loop">
										<tr>
											<td class="col-sm-8 col-md-6">
												<div class="media">
													<a class="pull-left" href="#"> <img
														class="media-object"
														src="https://s3.amazonaws.com/srishtibiz/${products[0]}.jpg"
														style="width: 72px; height: 72px;">
													</a>
													<div class="media-body">
														<c:url var="product" value="product">
															<c:param name="productId"
																value="${products[0]}" />
														</c:url>
														<h5 class="media-heading">
															<a href="${product}"> <c:out
																	value="${products[1]}" /></a>
														</h5>
														<h6 class="media-heading">
															by
															<c:out value="${products[3]} " />
															<%-- <c:out value="${products.product.manufacturer}   " /> --%>
														</h6>
														<span>Status: </span><span class="text-success"><strong>In
																Stock</strong></span>
																<br><br><c:if test="${not empty customer}">
																<c:url var="remove" value="remove">
													<c:param name="productId" value="${products[0]}" />
												</c:url> <a href="${remove}"><small>Delete</small></a>
												&nbsp;&nbsp;
												<span class="verticalLine">
													<c:url var="moveToWishList" value="/moveToWishList">
														<c:param name="productId"
															value="${products[0]}" />
													</c:url>
													&nbsp;&nbsp;&nbsp;
													<a href="${moveToWishList}"><small>Move to Wish List</small></a>
													</span>
												</c:if>
															<!-- <a href=""></a>	<span>Delete </span><span class="text-success"><strong>Move to Wishlist</strong></span> -->
													</div>
												</div>
											</td>
											<form action="updateQuantity" method="POST">
												<td class="col-sm-1 col-md-1" style="text-align: center">
												 <select name="quantity" id="quantity${loop.index}">
												 <option value="<c:out value="${products[5]}"/>"><c:out value="${products[5]}"/></option>
                                      <option value="1">1</option>
                                     <option value="2">2</option>
                                      <option value="3">3</option>
                                      <option value="4">4</option>
                                    </select>
													<%-- <input type="text" name="quantity" id="quantity${loop.index}"
													value="<c:out value="${products[5]}"/>" size="2"
													maxlength="2" max="10" min="1" /> --%> <input type="hidden"
													name="productid" value="${products[0]}" />
													
												</td>
											</form> 
											
											
											<td class="col-sm-1 col-md-1 text-center"><strong>Rs.<c:out
														value="${String.format('%.2f', products[2])}" /></strong></td>
											 <td class="col-sm-1 col-md-1 text-center"><strong>Rs.<c:out
														value="${String.format('%.2f', products[2] * products[5])}" /></strong></td> 
										
										</tr>
									</c:forEach>
									<tr>
										<td></td>
										<td>&nbsp;</td>
										<td class="text-right"><h5>Subtotal</h5></td>
										<td class="text-center"><h5>
												<strong>Rs.<c:out value="${String.format('%.2f', productsList.stream().map(products -> products[2]*products[5]).sum())}" /></strong>
											</h5></td>
									</tr>
									<tr>
										<td></td>
										<td>&emsp;</td>
										<td class="text-right"><h5>Total</h5></td>
										<td class="text-center"><h5>
												<strong>Rs.<c:out value="${String.format('%.2f', productsList.stream().map(products -> products[2]*products[5]).sum())}" /></strong>
											</h5></td>
											
									</tr>
									<tr>
										<td></td>
										
										<td><c:url var="emptycart" value="clear" /> <a
											href="${emptycart}" type="button" class="btn  button2">  <!-- btn-default -->
												Clear Cart <span class="glyphicon glyphicon-shopping-cart"></span>
										</a></td>
										<td><c:url var="home" value="home" /> <a href="${home}"
											type="button" class="btn button"> <span
												class="glyphicon glyphicon-shopping-cart"></span> Continue
												Shopping
										</a></td>
										<td><c:url var="checkout" value="checkout" /> <a
											href="${checkout}" type="button" class="btn button">
												Proceed to Checkout 
										</a></td>
									</tr>
									
								</c:when>
								
								
							</c:choose>
						</tbody>
					</table>
					<div>
						<c:if test="${not empty param.addWishList}">
							<p class="text-info">Cannot Move Product to Wishlist</p>
						</c:if>
					</div>
				</div>
				<!-- <div class="col-sm-4 col-md-4">
				Shopping cart
				</div> -->
			</div>
		</section>
		
	</div>
<br><br>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script>
	$(document).ready(
			function() {
				var size=${productsList.size()};
				
				for (i = 0; i < size; i++) {
				    // do something with `substr[i]`
				
				$("#quantity"+i).change(function() {
					/* alert($(this).val());
					alert("aaaa"); */
					if($(this).val()!=""){
						 this.form.submit();
						}
				    
				});
				}
			});
</script>

<script>
	$(document).ready(
			function() {
				$(".dropdown").hover(
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideDown("fast");
							$(this).toggleClass('open');
						},
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideUp("fast");
							$(this).toggleClass('open');
						});
			});
</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>