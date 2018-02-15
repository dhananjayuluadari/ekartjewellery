<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Arrays.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<style>
.glyphicon {
	margin-right: 5px;
}

.thumbnail {
	margin-bottom: 20px;
	padding: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
}

.item.list-group-item {
	float: none;
	width: 100%;
	background-color: #fff;
	margin-bottom: 10px;
}

.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
	{
	background: #428bca;
}

.item.list-group-item .list-group-image {
	margin-right: 10px;
}

.item.list-group-item .thumbnail {
	margin-bottom: 0px;
}

.item.list-group-item .caption {
	padding: 9px 9px 0px 9px;
}

.item.list-group-item:nth-of-type(odd) {
	background: #eeeeee;
}

.item.list-group-item:before,.item.list-group-item:after {
	display: table;
	content: " ";
}

.item.list-group-item img {
	float: left;
}

.item.list-group-item:after {
	clear: both;
}

.list-group-item-text {
	margin: 0 0 11px;
}

footer {
	background-color: lightgray;
	border: solid 1px black;
	font-family: 'Times New Roman', serif;
	padding: 10px;
}

footer {
	padding: 10px;
	border-radius: 3px;
}

body {
	font-family: Segoe UI;
	font-size: 14px;
	background-color: white;
}

html,body {
	padding: 0;
	margin: 0;
}

#main {
	border: solid 1px #ccc;
	border-radius: 5px;
	color: #202020;
	margin: 20px 0;
	padding: 5px;
}

#featProds {
	padding: 2px;
	width: 300px;
}

.container {
	width: 989px;
	margin: auto;
	background-color: white;
	padding: 5px;
}

#well {
	margin-top: 20px;
	text-align: justify;
}

@import
	url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css)
	;

.fa-fw {
	width: 2em;
}
#accountForm{

}
</style>
	<%@include file="header.jsp"%>
		
<body>
	<div class="container">
	
		<section id="main">
		<div class="row">
			<div class="col-sm-2">
				<nav class="nav-sidebar nav-pills nav-stacked">
				<ul class="nav tabs">
					<li class="active"><a href="account" data-toggle="tab"><i
							class="fa fa-home fa-fw"></i>My Account</a></a></li>
					<li class=""><a href="orderHistory" data-toggle="tab"><i
							class="fa fa-list-alt fa-fw"></i>My Orders</a></li>
					<li class=""><a href="wishlist" data-toggle="tab"><i
							class="fa fa-file-o fa-fw"></i>Wishlist</a></li>
					<li class=""><a href="change-password" data-toggle="tab"><i
							class="fa fa-bar-chart-o fa-fw"></i>Change Password</a></li>
					<li class=""><a href="addressDetails" data-toggle="tab"><i
							class="fa fa-table fa-fw"></i>Addresses</a></li>
					<li class=""><a href="reviews" data-toggle="tab"><i
							class="fa fa-tasks fa-fw"></i>Reviews & Ratings</a></li>
					<li class=""><a href="updateEmail" data-toggle="tab"><i
							class="fa fa-calendar fa-fw"></i>Update Email</a></li>
				</ul>
				</nav>
			</div>
			<div class="col-sm-8 well">
				<div class="col-md-12">
		<div class="row">
			<div class="table-responsive">
				<h4>Products Ordered Successfully</h4>
				<h1>Order Information</h1>
			
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<!--<th>Product Id</th>
						 <th>Orders Id</th> -->
						<th>Product Name</th>
						<th>Manufacturer</th>
						<th>Quantity</th>
						<th>Price</th>
						
					</thead>
					<tbody>
					<%System.out.println("Dhannaaa"); %>
					
					<%System.out.println("Dhannaaa 222222222222222"); %>
					
				<c:forEach var = "i" begin="0" end="${fn:length(name)-1}" varStatus="loop">
						
						<%System.out.println("Dhannaaa 2333333333333"); %>
							<tr>
										
								<%-- <td><c:out value="${productId[i]}" /></td> --%>
								<td><c:out value="${name[i]}" /></td>
								<td><c:out value="${manufacturer[i]}" /></td>
								<td><c:out value="${quantity[i]}" /></td>
								<td><c:out value="${price[i]}" /></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table table-bordered table-hover table-condensed">
				<thead>
						<th>Transaction id</th>
						<th>Total</th>
					</thead>
					<tbody>
					<c:forEach var = "i" begin="0" end="0" varStatus="loop">
					<td><c:out value="${transactionId}" /></td>
					<td><c:out value="Rs.${total}" /></td>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
			</div>
		</div>
		</section>
		<footer> <%@include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>