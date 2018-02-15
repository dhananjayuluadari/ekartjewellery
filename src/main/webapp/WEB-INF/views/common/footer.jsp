<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resources/resource/bootstrap/css/bootstrap.min.css"/>">
<script src="<c:url value="/resources/resource/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/resource/css/overall.css"/>">
<style type="text/css">
	.foot{
	margin-bottom:0px;
	}
	</style>
</head>
<body>
<div class="foot">
	<footer class="footer-distributed">
	<!--<div class="footer-right">
		<a href="<c:url value="/index1"/>"><span
			class="glyphicon glyphicon-home"></span></a>
		<security:authorize access="hasRole('ROLE_USER')">
			<a href="<spring:url value="/cart/getCartById" />"><span class="glyphicon glyphicon-shopping-cart"></a>
		</security:authorize>
		<a href="<c:url value="/login"/>"><span
			class="glyphicon glyphicon-user"></a> <a href="#"><span
			class="glyphicon glyphicon-envelope"></a>
	</div> -->
	<div class="footer-left">

		<p class="footer-links">
			<a href="<c:url value="/index1"/>">Ecart</a> 
		</p>

		<p>2018</p>
	</div>
	</footer>
    </div>
</body>
</html>