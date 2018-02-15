<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%@page import="java.util.*" %>
<%@ page isELIgnored="false"%>
 <%@page import="java.text.*" %>
<%DecimalFormat df2 = new DecimalFormat("#.##");%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resources/resource/bootstrap/css/bootstrap.min.css"/>">
<script src="<c:url value="/resources/resource/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.w3-sidenav a, .w3-sidenav h4 {
	font-weight: bold
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script>
$(document).ready(function(){

 	/* var a=${featProd};
	alert(a); */
	var idCount = 1;
	var e=1;
	$('input.check').each(function() {
		 $(this).attr('id','check'+e);
		 e++;
	});
	
	$('div.rating').each(function() {
	   $(this).attr('id','rating'+idCount);
	  
	   $(".stars").css("width", "65px").css("height", "13px").css("background", "url(https://s3.amazonaws.com/srishtibiz/stars1.png) 0 0 repeat-x").css("position", "relative");
	   $(".stars #rating"+ idCount).css("height", "13px").css("background", "url(https://s3.amazonaws.com/srishtibiz/stars1.png) 0 -13px repeat-x");
       var b=idCount+"%";
       var f = $("#check"+idCount).val();
       var g=f+"%";
       $("#rating"+idCount).css("width", g);
	   idCount++;
	});
         
    
});
</script> 
<style>
/* .stars{
    width: 130px;
    height: 26px;
    background: url(http://sandbox.bumbu.ru/ui/external/stars.png) 0 0 repeat-x;
    position: relative;
}

.stars .rating{
    height: 26px;
    background: url(http://sandbox.bumbu.ru/ui/external/stars.png) 0 -26px repeat-x;
}
 
.stars i{
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    height: 6px;
    width: 10px;
    cursor: pointer;
}
.stars:hover i{
    display: block;
}
.stars i:hover{
    background: url(http://sandbox.bumbu.ru/ui/external/stars.png) 0 -52px repeat-x;
}

.stars i + i{width: 24px;}
.stars i + i + i{width: 18px;}
.stars i + i + i + i{width: 12px;}
.stars i + i + i + i + i{width: 6px;}*/

div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: right;
    width: 300px;
    height: 300px;
    
}

div.newcenter {
    margin: auto;
  /*   border: 1px solid #ccc; */
    float: left;
    width: 330px;
    height: 330px;
    text-align:center;
    
  
    
}
div.imagediv{
margin-left:45px;
    float: center;
    
    text-align:left;
    margin-top:2%;
}
div.newtext {
    margin-left:15px;
    float: left;
    width: 300px;
    height: 300px;
    text-align:left;
    margin-top:5%;
   
}

img{
display:block;
margin-left:auto;
margin-right:auto;
width:50%;
margin-top:5%;
}
.checked {
    color: orange;
}
</style>
</head>
<body>
	<hr>
	
	
	&emsp;
	<div id="products" class="row list-group">
					<c:forEach var="featProds"  items="${featProd}">
						<c:url var="url" value="product">
							<c:param name="productId" value="${featProds.productId}" />
						</c:url>
						
						<%-- <div class="gallery">
  <a target="_blank" href="img_fjords.jpg">
    <img src="https://s3.amazonaws.com/srishtibiz/${featProds.productId}.jpg" alt="Trolltunga Norway" width="300" height="100">
  </a>
  <div class="desc">Add a description of the image here</div>
</div> --%>

		              <%int count=1;
		              int star=20;
		              %>
						 <div class="item  col-xs-2 col-lg-3">
							<div class="newcenter">
							<div class="imagediv">
								<img align="left" class="group list-group-image" style="max-height: 500px"
									src="https://s3.amazonaws.com/srishtibiz/${featProds.productId}.jpg" alt="" />
									</div>
								<div class="newtext">
								<div class="caption">
									<h5 class="group inner list-group-item-heading">
										<a href="${url}">&nbsp;<c:out value="${featProds.name}" /></a>
 
									</h5>
									<p class="group inner list-group-item-text">&nbsp;
									
										<c:out value="${featProds.manufacturer}" />
									</p>
									<%-- <p class="group inner list-group-item-text"> ${featProds.description}<!-- Product
										description... Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat. --></p> --%>
										<!-- <span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<span class="fa fa-star"></span>  -->

<div class="stars">
  <div class="rating"   <%-- class="rating" style="width:<%=star%>%" --%>></div>
  <i></i>
  <i></i>
  <i></i>
  <i></i>
  <i></i>
</div>
&nbsp;${reviewcount[featProds.productId]}
<input type="hidden" name="check" class="check" value="${Math.round(avgcount[featProds.productId])}">
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<h5  class="group inner list-group-item-heading">
											<span style="color:red;"><i class="fa fa-rupee" style="font-size:15px"><c:out value="${String.format('%.2f', featProds.price)}" /></i></span>&nbsp;
											   <!-- <c:if test="${not empty featProds.offerPrice}">
											<i class="fa fa-rupee" style="font-size:15px"><strike><c:out value="${featProds.offerPrice}" /></strike></i>
											 </c:if>
											</h5>
											<c:choose>
                                                  <c:when test="${empty featProds.offerPrice}">
                                                           No Offers 
                                                              </c:when>
                                                             <c:otherwise>
                                                                  <h6>You Save:<c:out value="${featProds.discountAmount}" />&nbsp;(<c:out value="${Math.round(featProds.discountPercent)}" />%)</h6>
												
                                                             </c:otherwise>
                                            </c:choose>
											-->
                                        
 											
										</div>
										<c:url var="add" value="/addNewProduct">
											<c:param name="productId" value="${featProds.productId}" />
										</c:url>
										<%-- <div class="col-xs-12 col-md-3">
										
											<a class="btn btn-warning btn-xs"  href="${add}">&emsp;&emsp;Add to cart</a>
										</div> --%>
									</div>
								</div>
							</div>
						</div>
						
						</div>
						
						 <%count++; %>
					</c:forEach>
				</div>
				<br><br>
</body>
</html>