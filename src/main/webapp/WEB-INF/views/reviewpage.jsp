<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Place Order</title>
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
                  
   <style>
/* reset */
/*! normalize.css v3.0.2 | MIT License | git.io/normalize */html {
  font-family: sans-serif;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%
}

body { margin: 0 }








input { line-height: normal }

input[type="checkbox"], input[type="radio"] {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  padding: 0
}
input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button {
height:auto
}

input[type="search"] {
  -webkit-appearance: textfield;
  -moz-box-sizing: content-box;
  -webkit-box-sizing: content-box;
  box-sizing: content-box
}
input[type="search"]::-webkit-search-cancel-button, input[type="search"]::-webkit-search-decoration {
-webkit-appearance:none
}

fieldset {
  border: 1px solid #c0c0c0;
  margin: 0 2px;
  padding: 0.35em 0.625em 0.75em
}

legend {
  border: 0;
  padding: 0
}

textarea { overflow: auto }

optgroup { font-weight: bold }

table {
  border-collapse: collapse;
  border-spacing: 0
}

td, th { padding: 0 }

#star-1:checked ~ section [for='star-1'] svg, #star-2:checked ~ section [for='star-1'] svg, #star-2:checked ~ section [for='star-2'] svg, #star-3:checked ~ section [for='star-1'] svg, #star-3:checked ~ section [for='star-2'] svg, #star-3:checked ~ section [for='star-3'] svg, #star-4:checked ~ section [for='star-1'] svg, #star-4:checked ~ section [for='star-2'] svg, #star-4:checked ~ section [for='star-3'] svg, #star-4:checked ~ section [for='star-4'] svg, #star-5:checked ~ section [for='star-1'] svg, #star-5:checked ~ section [for='star-2'] svg, #star-5:checked ~ section [for='star-3'] svg, #star-5:checked ~ section [for='star-4'] svg, #star-5:checked ~ section [for='star-5'] svg {
  -webkit-transform: scale(1);
  transform: scale(1);
}

#star-1:checked ~ section [for='star-1'] svg path, #star-2:checked ~ section [for='star-1'] svg path, #star-2:checked ~ section [for='star-2'] svg path, #star-3:checked ~ section [for='star-1'] svg path, #star-3:checked ~ section [for='star-2'] svg path, #star-3:checked ~ section [for='star-3'] svg path, #star-4:checked ~ section [for='star-1'] svg path, #star-4:checked ~ section [for='star-2'] svg path, #star-4:checked ~ section [for='star-3'] svg path, #star-4:checked ~ section [for='star-4'] svg path, #star-5:checked ~ section [for='star-1'] svg path, #star-5:checked ~ section [for='star-2'] svg path, #star-5:checked ~ section [for='star-3'] svg path, #star-5:checked ~ section [for='star-4'] svg path, #star-5:checked ~ section [for='star-5'] svg path {
  fill: #FFBB00;
  stroke: #cc9600;
}


label {
  display: inline-block;
  width: 50px;
  text-align: center;
  cursor: pointer;
}

label svg {
  width: 100%;
  height: auto;
  fill: white;
  stroke: #CCC;
  -webkit-transform: scale(0.8);
  transform: scale(0.8);
  -webkit-transition: -webkit-transform 200ms ease-in-out;
  transition: -webkit-transform 200ms ease-in-out;
  transition: transform 200ms ease-in-out;
  transition: transform 200ms ease-in-out, -webkit-transform 200ms ease-in-out;
}

label svg path {
  -webkit-transition: fill 200ms ease-in-out, stroke 100ms ease-in-out;
  transition: fill 200ms ease-in-out, stroke 100ms ease-in-out;
}

label[for="star-null"] {
  display: block;
  margin: 0 auto;
  color: #999;
}



input { margin-top: 1rem; }
</style>
<style type="text/css">
form { margin: 0px 10px; }

h2 {
  margin-top: 2px;
  margin-bottom: 2px;
}

.container { max-width: 360px; }

.divider {
  text-align: center;
  margin-top: 20px;
  margin-bottom: 5px;
}

.divider hr {
  margin: 7px 0px;
  width: 35%;
}

.left { float: left; }

.right { float: right; }

button.btn {
     -webkit-transform: scale(0.8);
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
      width: 30%;
 }
.button {
    background-color: #f2c55e; /* Green */
   color:black;  
    width: 150%;
}
.button2 {
      font-size: 11px;
    color: #fff;
    z-index: 5;
    padding:3px;    
    margin: 0;
    height: 32px;
    -webkit-transition: all 0.2s ease-in-out;
    -moz-transition: all 0.2s ease-in-out;
    -o-transition: all 0.2s ease-in-out;
    -ms-transition: all 0.2s ease-in-out;
    transition: all 0.2s ease-in-out;
      background-color: #cecdcb; /* Green */
    border: none;
   color:black;  
    width: 30%;
    box-shadow: none;
}


div.address{
    padding: 100px;
     padding-top: 10px;
}
body{margin:40px;}

/* .stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 50%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
} */
</style>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/navbar.jsp"></jsp:include>
 <br><br>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript">

    $(document).ready(function(){
    	 $('#review').hide();
    	 $("#insertreview").hide();
    	  $("#reviewTitle").hide();
        $(".ratingforproduct").click(function(){
          // $("#review").slideToggle("slow");
           if ( $(this).is(':checked') ) {
        $("#review").show();
        $("#insertreview").show();
        $("#reviewTitle").show();
    } else {
        $("#review").hide();
        $("#insertreview").hide();
        $("#reviewTitle").hide();
    }
          // $('#review').toggle();
      });
    });
    </script>  
    
    <script type="text/javascript">

    $(document).ready(function(){
    	
        $("#clear").click(function(){
          // $("#review").slideToggle("slow");
          
        $("#review").hide();
        $("#insertreview").hide();
        $("#reviewTitle").hide();
        $("[name=ratingforproduct]").removeAttr("checked");
          // $('#review').toggle();
      });
    });
    </script>  
      
<div class="address">


                                    
                                           
                                             
                                        <h3><b>Your Reviews</b></h3>
                                   
                                    
                                   
                           <hr>
                                       
                       
             
             
             <div class="col-md-10">
            
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
				<form  action="reviews/product" method="POST">
					
					                                                           <div class="col-md-8">
						                                                      <div class="portlet-body">
                                                                                    <div class="row static-info">
                                                                                        <div class="col-md-12"> 
                                                                                        
                                                                                        
                                                                                        
                                                                                        <div class="row">
						<div class="col-xs-3"><img class="img-responsive" src="https://s3.amazonaws.com/srishtibiz/${product.productId}.jpg">
						</div>
						<div class="col-xs-7">
						
														
							<strong><a href="product?productId=${product.productId}">${product.name}</a></strong><!-- <h5>by <c:out value=" manufacturee" /></h5> -->  <input type="radio" hidden name="ratingforproduct" id="star-null" />
<input type="radio" name="ratingforproduct" class="ratingforproduct" id="star-1" value="1" hidden/>
<input type="radio" name="ratingforproduct"  class="ratingforproduct" id="star-2" value="2" hidden/>
<input type="radio" name="ratingforproduct"  class="ratingforproduct" id="star-3" value="3" hidden/>
<input type="radio" name="ratingforproduct"  class="ratingforproduct" id="star-4" value="4" hidden />
<input type="radio" name="ratingforproduct"  class="ratingforproduct"  id="star-5" value="5" hidden/>
<section>
  <label for="star-1"> <svg width="255" height="240" viewBox="0 0 51 48">
    <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"/>
    </svg> </label>
  <label for="star-2"> <svg width="255" height="240" viewBox="0 0 51 48">
    <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"/>
    </svg> </label>
  <label for="star-3"> <svg width="255" height="240" viewBox="0 0 51 48">
    <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"/>
    </svg> </label>
  <label for="star-4"> <svg width="255" height="240" viewBox="0 0 51 48">
    <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"/>
    </svg> </label>
  <label for="star-5"> <svg width="255" height="240" viewBox="0 0 51 48">
    <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"/>
    </svg> </label> <span><a id="clear">Clear</a> </span>
  <input type="hidden" name="productId"  value="${product.productId}"/>
</section> <textarea  id="reviewTitle" placeholder="Headline for your review" name="reviewTitle" rows="2" cols="100"></textarea><br>
													<textarea  id="review" name="reviewText" rows="3" cols="100">

</textarea>
                                                             <button id="insertreview" type="submit" class="btn btn-block button">Submit</button>
                                                                                            
  
																	<br>
																
																
						</div>
						
					</div>
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                                                                                                                     </div>
                                                                                    </div>
                                                                                </div>  </div> 
                                                                                 
                                                                                
                                                                                
                                                                           
						
						
						
					<br>
						
						
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
             
      
      
  
      


</div>
   <br><br> <br><br> <br><br><br> <br><br><br> <br><br> <br>
      



	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>




</body>
</html>