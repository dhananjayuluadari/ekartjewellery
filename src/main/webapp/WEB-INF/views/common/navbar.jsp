<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String role=(String)session.getAttribute("role");
System.out.println("role chekicng in new template header dhana "+role);
%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/resource/images/favicon1.png"/>" />
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.3.2/css/simple-line-icons.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        
                 
   
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/resource/css/overall.css"/>">
	<style type="text/css">
	
	*.icon-blue {color: #0088cc}
*.icon-grey {color: grey}


i {
    width:50px;
    text-align:center;
    vertical-align:middle;
}

.fa {
    position: relative;
}

.badge {
    font-size: .25em;
    
    display: block;
    position: absolute;
    top: -.75em;
    right: -.75em;
    width: 2em;
    height: 2em;
    line-height: 2em;
    border-radius: 50%;
    text-align: center;
    
    /* color: #fff;
    background: rgba(0,0,0,0.5); */
}
	</style>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
    font-family: Arial;
}

* {
    box-sizing: border-box;
}

form.example input[type=text] {
    padding: 8px;
    font-size: 17px;
     max-height:37px;
    border: 1px solid grey;
    float: left;
    width: 90%;
    background: white;
}
.searchbutton{

float: left;
    width: 8%;
    padding: 8px;
    max-height:37px;
    background: #FFC200;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;

}
/* form.example button {
    float: left;
    width: 8%;
    padding: 8px;
    background: #FFC200;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
} */

form.example button:hover {
    background: #FFC200;
}

form.example::after {
    content: "";
    clear: both;
    display: table;
}
</style>


</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">

		<div class="nav navbar">
		<a class="navbar-brand" href="#">
  <%-- <img src="<c:url value="/resources/resource/images/shopieasy-logo.png"/>" style="display: inline-block;"> --%>
  <!-- <span style="display: inline-block;">My Company</span> -->
</a>
		<%-- <img src="<c:url value="/resource/images/shopieasy-logo.png"/>" alt="Headshot photo" class="left" /> --%>
		<%-- <img class="navbar-brand" style="width:200px;height:80px"
				src="<c:url value="/resources/resource/images/shopieasy-logo.png"/>"></img>  
			 --%>
				<div class="col-xs-7 col-xs-offset-2">
				
				<form class="example" action="searchforproducts" method="POST">
  <input type="text" placeholder="Search.." name="searchcontent" >
  <button type="submit" class="searchbutton"><i class="fa fa-search"></i></button>
</form>

	
				
				
				
          
                
                
               <!--  <input type="hidden" name="search_param" value="all" id="search_param">          
                <input type="text" class="form-control" name="x" placeholder="Search term...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span> -->
           
          
        </div>
		</div>
		
		

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			 <a class="navbar-brand" href="<c:url value="/index1" />">Ecart</a> 
		</div>
		
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
			
				<li><a href=" <c:url value="/home" />">Home</a></li>
				<c:forEach var="categories" items="${categoryMap}">
					<c:set var="category" value="${categories.key}" />
					<c:url var="url" value="cateogry">
						<c:param name="category" value="${category.categoryName}" />
					</c:url>

					<li class="dropdown"><a href="${url}" class="dropdown-toggle"
						data-toggle="dropdown" role="button"><c:out
								value="${category.categoryName}" /><span
								class="caret"></span></a>
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
				
				<li><a href=" <c:url value="/aboutus" />">Customer Service</a></li>
				
				<%-- <security:authorize access="hasRole('ROLE_USER')">
				<li><a href=" <c:url value="/contactus" />">Contact Us</a></li>
				</security:authorize>
				
				<!-- 			Only admin can view this link -->
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href=" <c:url value="/admin/product/addProduct" />">Add
							Product</a></li>
				</security:authorize> --%>
			</ul>

  
			<ul class="nav navbar-nav navbar-right">

				<c:if test="${!empty customer.userName}">
				<li class="dropdown"><a href="cart1" class="dropdown-toggle"
							data-toggle="dropdown">Hello, ${customer.userName} <br>Your Orders<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="account">Your Account</a></li>
								
								<li><a href="orderHistory">Your Orders</a></li>
								<li><a href="wishlist">Your Wishlist</a></li>
								<%if("ADMIN".equals(role)){ %>
								<li><a href="manageProduct?type=NA">Add Products</a></li>
								<li><a href="viewProductsinfo">view Products</a></li>
								<%} %>
								<li><a href="logout">Sign Out</a></li>
							</ul></li>
				<%-- 	<li><a href="<c:url value="/index1" />"><span
							class="glyphicon glyphicon-shopping-user"></span>Hello, ${customer.userName}</a></li> --%>

					<!-- <security:authorize access="hasRole('ROLE_USER')"> -->
					
                      
						<li><a href="<c:url value="/cart1" />">
						<i class="fa fa-shopping-cart fa-2x icon-grey"><span class="badge" style="color:red;background:white; font-weight:bold">${cartSize}</span></i>&emsp;Cart</a></li>
														
								
					<!-- </security:authorize> -->
					<li><a href="<c:url value="/logout" />"><span
							class="glyphicon glyphicon-log-out"></span>Sign Out</a></li>
				</c:if>
			</ul>


			<ul class="nav navbar-nav navbar-right">

				<c:if test="${customer.userName==null}">
					<li><a href="<c:url value="/cart1" />"><span
							class="glyphicon glyphicon-shopping-cart"></span>My Cart</a></li>
					<li><a href="<c:url value="/signup" />"><span
							class="glyphicon glyphicon-log-user"></span> SignUp</a></li>
					<li><a href="<c:url value="/login" />"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</nav>
	 <script src="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>

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

</body>
</html>