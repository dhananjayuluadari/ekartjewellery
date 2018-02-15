<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ecart WishList</title>
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
		<h3><b>WishList</b></h3>
		<section id="main">
			<div class="row">
				<div class="col-sm-8 col-md-8">

					<table class="table table-hover">
					
					
							<c:if test="${not empty productsInWishList}">
						<thead>
							<tr>
								<th>Product</th>
								<th class="text-center">Price</th>
								
								
							</tr>
						</thead>
						</c:if>
					
						<tbody>
							<c:choose>
							<c:when test="${empty productsInWishList }">
								<tr>
								<div style="text-align: center">
									<c:url var="home" value="home" />
									
										<h4>Your Wishlist is Empty</h4>
										<a href="${home}" class="btn button">Continue Shopping</a>
									</div>
								</tr>
							</c:when>
								<c:otherwise>
								<c:forEach var="product" items="${productsInWishList}">
									
									
										<tr>
											<td class="col-sm-6 col-md-6">
												<div class="media">
													<a class="pull-left" href="#"> <img
														class="media-object"
														src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg"
														style="width: 72px; height: 72px;">
													</a>
													<div class="media-body">
														<c:url var="products" value="product">
															<c:param name="productId" value="${product.productId}" />
														</c:url>
														<h5 class="media-heading">
															<a href="${products}"> <c:out value="${product.name}" /></a>
														</h5>
														<h6 class="media-heading">
															by
															<c:out value="${product.manufacturer}   " />
															<%-- <c:out value="${products.product.manufacturer}   " /> --%>
														</h6>
														<span>Status: </span><span class="text-success"><strong>In
																Stock</strong></span>
																<br><br><c:if test="${not empty customer}">
																<c:url var="remove" value="remove">
													<c:param name="productId" value="${product.productId}" />
												</c:url> <a href="${remove}"><small>Delete</small></a>
												&nbsp;&nbsp;
												<span class="verticalLine">
													<c:url var="moveToCart" value="moveToCart">
											<c:param name="productId" value="${product.productId}" />
										</c:url>
													&nbsp;&nbsp;&nbsp;
													<a href="${moveToCart}"><small>Move to Cart</small></a>
													</span>
												</c:if>
															<!-- <a href=""></a>	<span>Delete </span><span class="text-success"><strong>Move to Wishlist</strong></span> -->
													</div>
												</div>
											</td>
											
										
											
											
											<td class="col-sm-1 col-md-4 text-center"><strong>Rs.<c:out value="${String.format('%.2f', product.price)}" /></strong></td>
										
										</tr>
										
									</c:forEach>
									<tr>
										<td></td>
										
										
										<td><c:url var="home" value="home" /> <a href="${home}"
											type="button" class="btn button"> <span
												class="glyphicon glyphicon-shopping-cart"></span> Continue
												Shopping
										</a></td>
										
									</tr>
									</c:otherwise>
									
								
								
							</c:choose>
						</tbody>
					</table>
					<div>
						
					</div>
				</div>
				
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
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>