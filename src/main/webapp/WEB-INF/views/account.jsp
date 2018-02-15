<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ecart Your Account Information</title>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<style>
a.btn {
     -webkit-transform: scale(0.8);
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
 }
 .button {
    background-color: #f2c55e; /* Green */
   color:black;  
}
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
	<jsp:include page="/WEB-INF/views/common/navbar.jsp"></jsp:include>
 <br><br>
		
<body>
<form:form  class="form-horizontal" commandName="accountinformationForm" action="updateaccountinformation" method="post">
	<div class="container">
	
		
		<div class="row">
			
			<div class="col-sm-6 ">
				<div id="accountForm" class="col-md-8">
		<h1>Account Information</h1>
		
		<c:set var="customer" value="${customer}" />
			<div class="form-group">
				<div class="col-sm-9">
					<label for="userName">User Name:</label> <input type="text"
						class="form-control" name="userName" placeholder="User Name" value="${customer.userName}" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
					<label for="firstName">First Name:</label> <input type="text"
						class="form-control" name="firstName" placeholder="First Name" value="${customer.firstName}" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
					<label for="lastName">Last Name:</label> <input type="text"
						class="form-control" name="lastName" placeholder="Last Name" value="${customer.lastName}"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
					<label for="phoneNumber">Mobile Number:</label> <input type="text"
						class="form-control" name="phoneNumber"
						placeholder="Mobile Number" value="${customer.phoneNumber}" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
					<label for="lastName">Email Address:</label> <input type="text"
						class="form-control" name="emailAddress" placeholder="Email Address" value="${customer.emailAddress}"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
				<button  type="submit" class="btn button">
												Save
										</button>
					
				</div>
			</div>
			
		
	</div>
			</div>
		</div>
		
		 
	</div>
	</form:form>
    <br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		
</body>
</html>