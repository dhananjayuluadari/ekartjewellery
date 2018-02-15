<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String role=(String)session.getAttribute("role");
System.out.println("role chekicng in header dhana "+role);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.navbar-header {
	padding: 2px;
}
</style>
<script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/js/main.css" />" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.3.2/css/simple-line-icons.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div>
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-slide-dropdown">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<c:url var="home" value="home" />
			<div id="logo">
				<a href="${home}"><img src="resources/logo.png" /></a>
			</div>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-slide-dropdown">
			<ul class="nav navbar-nav">
				<c:forEach var="categories" items="${categoryMap}">
					<c:set var="category" value="${categories.key}" />
					<c:url var="url" value="cateogry">
						<c:param name="category" value="${category.categoryName}" />
					</c:url>

					<li class="dropdown"><a href="${url}" class="dropdown-toggle"
						data-toggle="dropdown" role="button"><c:out
								value="${category.categoryName}" /></a>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="subCategory" items="${categories.value}">
								<li class="divider"></li>
								<c:url var="subCaturl" value="subcateogry">
									<c:param name="subCategoryId"
										value="${subCategory.subCategoryId}" />
								</c:url>
								<li><a tabindex="-1" href="${subCaturl}"><c:out
											value="${subCategory.subCategoryName}" /></a></li>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
			<form class="navbar-form navbar-left"  action="searchProductsbyname" role="search">
				<div class="form-group">
					<input type="text" class="form-control"  id="w-input-search" placeholder="Search">
				</div>
				<button type="submit" id="w-button-search" class="btn btn-default">Submit</button>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><span id="cartIcon"><i class="fa fa-shopping-cart fa-lg"></i>&nbsp;<c:set var="cartItems"
							value="${cartSize}" /> <span
						class="headerCartItemsCount"> <c:choose>
								<c:when test="${empty cartSize}">0
							</c:when>
								<c:otherwise>CART&nbsp;<span class="badge ng-binding"><c:out value="${cartSize}" /></span>
									
								</c:otherwise>
							</c:choose>
					</span> <span class="headerCartItemsCountWord"><c:out
								value="${cartSize==1?'item':'items'}" /></span></span> <b class="caret"></b></span></a>
					<ul class="dropdown-menu">
						<c:url var="cart1" value="/cart1" />
						<li><a tabindex="-1" href="${cart1}">View Cart</a></li>
					</ul></li>
				<c:choose>
					<c:when test="${not empty customer}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Welcome, ${customer.userName} <span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="account">Account</a></li>
								<li><a href="cart1">Cart</a></li>
								<li><a href="orderHistory">Orders</a></li>
								<li><a href="wishlist">Wishlist</a></li>
								<%if("ADMIN".equals(role)){ %>
								<li><a href="manageProduct?type=NA">Add Products</a></li>
								<%} %>
								<li><a href="logout">Logout</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<a href="login">Sign In/Register</a>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<script>
	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getTags',
			paramName: "tagName",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.tagName, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});
		
		
	});
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
	
	<!-- /.container-fluid --> </nav>
</body>
</html>


<!-- 
	<div class="navbar navbar-default">
		<div class="navbar-header">
			<button class="btn btn-success navbar-toggle">
				<span class="glyphicon glyphicon-chevron-down"></span>
			</button>
			<c:url var="home" value="home" />
			<div id="logo">
				<a href="${home}"><img src="resources/logo.png" /></a>
			</div>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<c:forEach var="categories" items="${categoryMap}">
					<c:set var="category" value="${categories.key}" />
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button"><c:out
								value="${category.categoryName}" /></a></li>
					<ul class="dropdown-menu">
						<c:forEach var="subCategory" items="${subCategoryList}">
							<li><a tabindex="-1"><c:out
										value="${subCategory.subCategoryName}" /></a></li>
						</c:forEach>
					</ul>
				</c:forEach>
			</ul>
		</div>
	</div>
 -->