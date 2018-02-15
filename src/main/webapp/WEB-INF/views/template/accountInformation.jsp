
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div id="accountForm" class="col-md-8">
		<h1>Account Information</h1>
		<form:form  class="form-horizontal" commandName="accountinformationForm" action="updateaccountinformation" method="post">
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
					<input type="submit" value="Save" class="btn btn-success" />
				</div>
			</div>
			</form:form>
		
	</div>
</body>
</html>