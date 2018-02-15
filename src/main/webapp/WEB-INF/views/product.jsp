<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eCommerce Product Detail</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.3.2/css/simple-line-icons.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
     <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/layouts/layout3/css/layout.min.css" rel="stylesheet" type="text/css" />
 <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/layouts/layout3/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/layouts/layout3/css/custom.min.css" rel="stylesheet" type="text/css" />     
   
    <style type="text/css">
    /* Methods */
.method .header, .method .cell {
  padding: 6px 6px 6px 10px; }
.method .list-header .header {
  font-weight: normal;
  text-transform: uppercase;
  font-size: 0.8em;
  color: #999;
  background-color: #eee; }
.method [class^="row"],
.method [class*=" row"] {
  border-bottom: 1px solid #ddd; }
  .method [class^="row"]:hover,
  .method [class*=" row"]:hover {
    background-color: #f7f7f7; }
.method .cell {
  font-size: 0.85em; }
  .method .cell .mobile-isrequired {
    display: none;
    font-weight: normal;
    text-transform: uppercase;
    color: #aaa;
    font-size: 0.8em; }
  .method .cell .propertyname {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis; }
  .method .cell .type {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis; }
  .method .cell code {
    color: #428bca; }
  .method .cell a, .method .cell a:hover {
    text-decoration: none; }
  .method .cell code.custom {
    color: #8a6d3b;
    text-decoration: none; }
  .method .cell .text-muted {
    color: #ddd; }
@media (max-width: 991px) {
  .method [class^="row"],
  .method [class*=" row"] {
    padding-top: 10px;
    padding-bottom: 10px; }
  .method .cell {
    padding: 0 10px; }
    .method .cell .propertyname {
      font-weight: bold;
      font-size: 1.2em; }
      .method .cell .propertyname .lookuplink {
        font-weight: normal;
        font-size: 1.5em;
        position: absolute;
        top: 0;
        right: 10px; }
    .method .cell .type {
      padding-left: 10px;
      font-size: 1.1em; }
    .method .cell .isrequired {
      padding-left: 10px;
      display: none; }
    .method .cell .description {
      padding-left: 10px; }
    .method .cell .mobile-isrequired {
      display: inline; } }


/* Row Utilities */
[class^='row'].margin-0,
[class*=' row'].margin-0,
[class^='form-group'].margin-0,
[class*=' form-group'].margin-0 {
  margin-left: -0px;
  margin-right: -0px; }
  [class^='row'].margin-0 > [class^='col-'],
  [class^='row'].margin-0 > [class*=' col-'],
  [class*=' row'].margin-0 > [class^='col-'],
  [class*=' row'].margin-0 > [class*=' col-'],
  [class^='form-group'].margin-0 > [class^='col-'],
  [class^='form-group'].margin-0 > [class*=' col-'],
  [class*=' form-group'].margin-0 > [class^='col-'],
  [class*=' form-group'].margin-0 > [class*=' col-'] {
    padding-right: 0px;
    padding-left: 0px; }
  [class^='row'].margin-0 [class^='row'],
  [class^='row'].margin-0 [class*=' row'],
  [class^='row'].margin-0 [class^='form-group'],
  [class^='row'].margin-0 [class*=' form-group'],
  [class*=' row'].margin-0 [class^='row'],
  [class*=' row'].margin-0 [class*=' row'],
  [class*=' row'].margin-0 [class^='form-group'],
  [class*=' row'].margin-0 [class*=' form-group'],
  [class^='form-group'].margin-0 [class^='row'],
  [class^='form-group'].margin-0 [class*=' row'],
  [class^='form-group'].margin-0 [class^='form-group'],
  [class^='form-group'].margin-0 [class*=' form-group'],
  [class*=' form-group'].margin-0 [class^='row'],
  [class*=' form-group'].margin-0 [class*=' row'],
  [class*=' form-group'].margin-0 [class^='form-group'],
  [class*=' form-group'].margin-0 [class*=' form-group'] {
    margin-left: 0;
    margin-right: 0; }
    
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
   min-width: 160px;
width: 160px;
display:inline-block;
padding:5px 10px;
}
    body {
  font-family: 'open sans';
  overflow-x: hidden; }

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

/*# sourceMappingURL=style.css.map */
    </style>
    <style type="text/css">
    body {
  padding-top: 70px;
}
.btn-grey{
    background-color:#D8D8D8;
	color:#FFF;
}
.rating-block{
	background-color:#FAFAFA;
	border:1px solid #EFEFEF;
	padding:15px 15px 20px 15px;
	border-radius:3px;
}
.bold{
	font-weight:700;
}
.padding-bottom-7{
	padding-bottom:7px;
}

.review-block{
	background-color:#FAFAFA;
	border:1px solid #EFEFEF;
	padding:15px;
	border-radius:3px;
	margin-bottom:15px;
}
.review-block-name{
	font-size:12px;
	margin:10px 0;
}
.review-block-date{
	font-size:12px;
}
.review-block-rate{
	font-size:13px;
	margin-bottom:15px;
}
.review-block-title{
	font-size:15px;
	font-weight:700;
	margin-bottom:10px;
}
.review-block-description{
	font-size:13px;
}
.button2 {
    background-color: #cecdcb; /* Green */
    color:black;  
}
    </style>
    <style type="text/css">
    .side {
    float: left;
    width: 5%;
    margin-top:10px;
}

.middle {
    margin-top:10px;
    float: left;
    width: 50%;
}

/* Place text to the right */
.right {
    text-align: right;
}
    .bar-container {
    width: 100%;
    background-color: #f1f1f1;
    text-align: center;
    color: white;
}
    /* Individual bars */
.bar-5 {width: ${Math.round((ratingcount5/fn:length(reviewsList))*100)}%; height: 18px; background-color: orange;}
.bar-4 {width: ${Math.round((ratingcount4/fn:length(reviewsList))*100)}%; height: 18px; background-color: orange;}
.bar-3 {width: ${Math.round((ratingcount3/fn:length(reviewsList))*100)}%; height: 18px; background-color: orange;}
.bar-2 {width: ${Math.round((ratingcount2/fn:length(reviewsList))*100)}%; height: 18px; background-color: orange;}
.bar-1 {width: ${Math.round((ratingcount1/fn:length(reviewsList))*100)}%; height: 18px; background-color: orange;}

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    .side, .middle {
        width: 100%;
    }
    .right {
        display: none;
    }
}
    </style>
    
    <script src="resources/zoom/js/vendor/modernizr.js"></script>
    <script src="resources/zoom/js/vendor/jquery.js"></script>
  <!-- xzoom plugin here -->
  <script type="text/javascript" src="resources/zoom/dist/xzoom.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/zoom/css/xzoom.css" media="all" /> 
  <script src="resources/zoom/js/foundation.min.js"></script>
    <script src="resources/zoom/js/setup.js"></script>
     <link type="text/css" rel="stylesheet" media="all" href="resources/zoom/magnific-popup/css/magnific-popup.css" />
      <script type="text/javascript" src="resources/zoom/magnific-popup/js/magnific-popup.js"></script>  
      
        <link type="text/css" rel="stylesheet" media="all" href="resources/zoom/fancybox/source/jquery.fancybox.css" /> 
 
  <script type="text/javascript" src="resources/zoom/fancybox/source/jquery.fancybox.js"></script> 
</head>
<body>
<jsp:include page="/WEB-INF/views/common/navbar.jsp"></jsp:include>
 <br><br>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-4">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1">
						  <img class="xzoom4" id="xzoom-fancy" style="width:700px; height: 500px; position: relative; " src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" xoriginal="https://s3.amazonaws.com/srishtibiz/${product.productId}Original.jpg" />
						
						  </div>
						  <div class="tab-pane" id="pic-2"><img style="width:700px; height: 500px; position: relative; " src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></div>
						  <div class="tab-pane" id="pic-3"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></div>
						  <div class="tab-pane" id="pic-4"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></div>
						  <div class="tab-pane" id="pic-5"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg" /></a></li>
						</ul>
						
					</div>
					<div class="details col-md-6">
						<h4 >${product.description}</h4>
						<div class="stars">
  <div class="rating" ></div>
  <i></i>
  <i></i>
  <i></i>
  <i></i>
  <i></i>
</div>
						
						M.R.P :	 Rs.${product.price}<br>
						
					<c:choose>
							<c:when test="${product.available > 0}"> <span>Availability: <font color="green">In Stock</font></span> </c:when>
							
							<c:otherwise>
							<font color="red"> Out of stock</font>
							</c:otherwise>
							</c:choose>
						<!--  Price:	   765.00<br>
						Sale:	   537.00  FREE Delivery on orders over 599.00.Details<br>
                       You Save:   312.00 (37%)<br> -->
						<br>
						<%-- <h4 >current price: <span>Rs.${product.price}</span></h4> --%>
					<!-- 	<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p> -->
						<p class="vote"><strong>*</strong>&nbsp;Earings Length: 8 CM, Ear rings Width: 4.6cm , Tikka Length 16 cm , Tikka Width: 4.6 cm</p>
						<p class="vote"><strong>*</strong>&nbsp;Item made with Light weight good quality zinc alloy metal, Bright gold plated and yellow golden stone .Imitation Pearl , Kundan and Diamond Stone.</p>
						<p class="vote"><strong>*</strong>&nbsp;Close up pictures taken to show details in item, So item May looks larger. Please read above descriptions for size and refer to a ruler if needed.</p>
						<p class="vote"><strong>*</strong>&nbsp;Earrings Post back wire is very thin, soft and properly loacted in center so it fits to your earlobes naturally without pain.</p>
						 <p class="vote"><strong>*</strong>&nbsp;Money-back satisfaction guarantee</p>
						<!--  <div class="row">
						 <a href="cart1" type="button" class="btn button"> <span
												class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</a>
						<a href="cart1" type="button" class="btn button">Buy Now</a>
										<a href="cart1" type="button" class="btn button">Move to WishList</a>
										</div> -->
						
						
						
					</div>
					
					
					
					<div class="col-md-2">
					 <div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					
							<c:set var="product" value="${product}" />
								<c:url var="add" value="/addNewProduct">
									<c:param name="productId" value="${product.productId}" />
								</c:url>
								<c:url var="addToWishlist" value="/addToWishlist">
									<c:param name="productId" value="${product.productId}" />
								</c:url>
						                                              <div class="portlet-body">
                                                                                    <div class="row static-info">
                                                                                      
                                                                                             <a href="${add}" type="button" class="btn btn-block button"> <span
												class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</a>
						<a href="cart1" type="button" class="btn btn-block button">Buy Now</a>
										<a href="${addToWishlist}" type="button" class="btn btn-block button2">Move to WishList</a>
                                                                                             	  
                                                                                             </div>
                                                                                    </div>
                                                                                </div>
						
						
						
						
				 </div>
				  </div>
				   </div>	
					</div>
					
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>
	
	<br><br>
	
	
	<div class="container">

    <h4>Product specifications</h4>
    
    <div class="col-md-6">
   

   
	<div class="method">
        <div class="row margin-0 list-header hidden-sm hidden-xs">
            <div class="col-md-6"><div class="header">Property</div></div>
            <div class="col-md-6"><div class="header">Description</div></div>
        </div>  <!--  ProductSpecifications -->
	
	<c:forEach items="${ProductSpecifications}" var="ProductSpecifications">
           <div class="row margin-0"> <div class="col-md-6"> <div class="cell"><div class="propertyname"><c:out value="${ProductSpecifications.property}"/></div></div></div>
            <div class="col-md-6"><div class="cell"><div class="type"><c:out value="${ProductSpecifications.description}"/></div></div></div></div> 
            
            </c:forEach>
            
             
            
          
	 </div>
        </div>
	</div>
	
	<br><br>
	<div class="container">

    <h4>Pearl Information</h4>
    
    <div class="col-md-6">
    <div class="method">
   
    <div class="row margin-0"> <div class="col-md-6"> <div class="cell"><div class="propertyname">Brand</div></div></div>
            <div class="col-md-6"><div class="cell"><div class="type">Bindhani</div></div></div></div> 
    
     </div>
    </div>
    </div>
    
    
    <br><br>
	<div class="container">

    <h4>Diamond Information</h4>
    
    <div class="col-md-6">
    <div class="method">
   
    <div class="row margin-0"> <div class="col-md-6"> <div class="cell"><div class="propertyname">Stone Colour</div></div></div>
            <div class="col-md-6"><div class="cell"><div class="type">Gold</div></div></div></div> 
            <div class="row margin-0"> <div class="col-md-6"> <div class="cell"><div class="propertyname">Stone Creation Method</div></div></div>
            <div class="col-md-6"><div class="cell"><div class="type">simulated</div></div></div></div> 
    
     </div>
    </div>
    </div>
	
	<br><br>
	
	<div class="container">

    <h2>Product description</h2>
    <p class="lead">
        Jewellery Information
    </p>
    <div class="col-md-12">
   One of the most favourite pieces of jewellery at wedding functions or formal events is the maang tikka, also known as maatha patti in some areas. Whether you are a bride to be, a bride, a bridesmaid or just anyone else, a maang tikka can surely add glamour and style to your look and also enhance your beauty.One of the greatest misconceptions about maang tikkas is that they are only a type of bridal jewellery so should only be worn by brides. That is so not true and if you are planning on attending any wedding party or a traditional occasion is coming up, then maang tikkas can surely help enhance your beauty. Nowadays, even Bollywood celebrities are going for it so why not you?.

    <hr />
    <br>
    <!-- <h3>Product details</h3>
    
    <b>Item model number:</b> SHACCE00123<br>
<b>ASIN:</b> B01MZ5AW5F<br>
<b>Date first available at ecart.in:</b> 31 December 2016<br>
<b>Average Customer Review:</b> 4.2 out of 5 stars   10 customer reviews<br>
<b>Amazon Bestsellers Rank: </b>#4,562 in Jewellery (See Top 100 in Jewellery)<br> -->

	  </div>
	</div>
	
	
	<br><br>
	
	<div class="container">
    			
		<div class="row">
			<div class="col-md-3">
				<div class="rating-block">
					<h4>Average user rating</h4>
					<h2 class="bold padding-bottom-7">4.3 <small>/ 5</small></h2>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
				</div>
			</div>
			<div class="col-md-3">
				<h4>Customer Rating </h4>
				
				
<div class="row">
  <div class="side">
    <div>5 </div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-5"></div>
    </div>
  </div>
  <div class="side right">
    <div>${Math.round((ratingcount5/fn:length(reviewsList))*100)}%</div>
  </div>
 </div> 
 <div class="row">
  <div class="side">
    <div>4 </div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-4"></div>
    </div>
  </div>
  <div class="side right">
    <div>${Math.round((ratingcount4/fn:length(reviewsList))*100)}%</div>
  </div>
  </div> 
 <div class="row">
  <div class="side">
    <div>3 </div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-3"></div>
    </div>
  </div>
  <div class="side right">
    <div>${Math.round((ratingcount3/fn:length(reviewsList))*100)}%</div>
  </div>
  </div> 
 <div class="row">
  <div class="side">
    <div>2 </div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-2"></div>
    </div>
  </div>
  <div class="side right">
    <div>${Math.round((ratingcount2/fn:length(reviewsList))*100)}%</div>
  </div>
  </div> 
 <div class="row">
  <div class="side">
    <div>1 </div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-1"></div>
    </div>
  </div>
  <div class="side right">
    <div>${Math.round((ratingcount1/fn:length(reviewsList))*100)}%</div>
  </div>
</div>
				<!-- <div class="pull-left">
					<div class="pull-left" style="width:35px; line-height:1;">
						<div style="height:9px; margin:5px 0;">5 <span class="glyphicon glyphicon-star"></span></div>
					</div>
					<div class="pull-left" style="width:180px;">
						<div class="progress" style="height:9px; margin:8px 0;">
						  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: 1000%">
							<span class="sr-only">80% Complete (danger)</span>
						  </div>
						</div>
					</div>
					<div class="pull-right" style="margin-left:10px;">1</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width:35px; line-height:1;">
						<div style="height:9px; margin:5px 0;">4 <span class="glyphicon glyphicon-star"></span></div>
					</div>
					<div class="pull-left" style="width:180px;">
						<div class="progress" style="height:9px; margin:8px 0;">
						  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width: 80%">
							<span class="sr-only">80% Complete (danger)</span>
						  </div>
						</div>
					</div>
					<div class="pull-right" style="margin-left:10px;">1</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width:35px; line-height:1;">
						<div style="height:9px; margin:5px 0;">3 <span class="glyphicon glyphicon-star"></span></div>
					</div>
					<div class="pull-left" style="width:180px;">
						<div class="progress" style="height:9px; margin:8px 0;">
						  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width: 60%">
							<span class="sr-only">80% Complete (danger)</span>
						  </div>
						</div>
					</div>
					<div class="pull-right" style="margin-left:10px;">0</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width:35px; line-height:1;">
						<div style="height:9px; margin:5px 0;">2 <span class="glyphicon glyphicon-star"></span></div>
					</div>
					<div class="pull-left" style="width:180px;">
						<div class="progress" style="height:9px; margin:8px 0;">
						  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width: 40%">
							<span class="sr-only">80% Complete (danger)</span>
						  </div>
						</div>
					</div>
					<div class="pull-right" style="margin-left:10px;">0</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width:35px; line-height:1;">
						<div style="height:9px; margin:5px 0;">1 <span class="glyphicon glyphicon-star"></span></div>
					</div>
					<div class="pull-left" style="width:180px;">
						<div class="progress" style="height:9px; margin:8px 0;">
						  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width: 20%">
							<span class="sr-only">80% Complete (danger)</span>
						  </div>
						</div>
					</div>
					<div class="pull-right" style="margin-left:10px;">0</div>
				</div> -->
			</div>			
			
			<c:url var="writereview" value="/writereview">
									<c:param name="productId" value="${product.productId}" />
								</c:url>
								
			<div class="col-md-2"><br><br><br>
			<a href="${writereview}"  target="_blank" type="button" class="btn btn-block button2">Write a Product Review</a>
			</div>
		</div>			
		
		<div class="row">
			<div class="col-sm-7">
				<hr/>
				<div class="review-block">
				
				<c:forEach var="reviewMap" items="${reviewsList}">
													<c:set var="customer" value="${reviewMap.key}" />
													<c:set var="review" value="${reviewMap.value}" />
					<div class="row">
						<div class="col-sm-3">
							<span><i class="fa fa-user"></i></span>
							<div class="review-block-name"><a href="#"><c:out value="${customer.userName}" /></a></div>
							<div class="review-block-date"><c:out value="${review.date}" /></div> 
							<!-- <div class="review-block-date">January 29, 2016<br/>1 day ago</div> -->
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							</div>
							<div class="review-block-title"><c:out value="${review.reviewTitle}" /></div>
							<div class="review-block-description">${review.reviewText}</div>
						</div>
					</div>
					<hr/>
					</c:forEach>
					
					
					
					
				</div>
			</div>
		</div>
		
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	<br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>