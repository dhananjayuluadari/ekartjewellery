<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/resource/images/favicon1.png"/>" />
 <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
        <link href="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
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
a.btn:hover {
     -webkit-transform: scale(1.1);
     -moz-transform: scale(1.1);
     -o-transform: scale(1.1);
 }
 a.btn {
     -webkit-transform: scale(0.8);
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
 }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/navbar.jsp"></jsp:include>
 <br><br>
 
 <div class="container">

	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>

	<div class="row">

		<div class="col-md-offset-2 col-md-6">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Product Management</h4>

				</div>

				<div class="panel-body">
					  <form:form method="POST" action="editexistingproduct"
            enctype="multipart/form-data" >
						<div class="form-group">
							<label class="control-label col-md-4">Category</label>
							<div class="col-md-8"><input type="text" class="form-control" placeholder="Enter Category" name=categoryName id="categoryName" value="${productinfo[5]}" readonly required>
																	
								
								<input type="hidden" class="form-control" name="productId"  value="${productinfo[0]}"  required>
								<input type="hidden" class="form-control" name="manufacturer"  value="${productinfo[4]}"  required>
								<input type="hidden" class="form-control" name="categoryId"  value="${productinfo[8]}"  required>
								<input type="hidden" class="form-control" name="featured"  value="${productinfo[9]}"  required>
								<input type="hidden" class="form-control" name="subcategoryId"  value="${productinfo[10]}"  required>
							</div>
						</div><!-- <a href="manageProduct?type=categorytype"><button type="button" class="btn btn blue">
                                                                <i class="fa fa-ban-circle"></i>
                                                                <span>Add </span>
                                                            </button></a> -->
						<br><br> <br>
						<div class="form-group">
							<label class="control-label col-md-4">SubCategory</label>
							<div class="col-md-8">
								
																	<input type="text" class="form-control" placeholder="Enter SubCategory" name="subCategoryName" id="subCategoryName" value="${productinfo[6]}" readonly required>
																	
								
							</div>
						</div><!-- <a href="manageProduct?type=SubCategorytype"><button type="button" class="btn btn blue">
                                                                <i class="fa fa-ban-circle"></i>
                                                                <span>Add </span>
                                                            </button></a> -->
                        <br><br>
						<div class="form-group">
							<label class="control-label col-md-4">Product Name</label>
							<div class="col-md-8">
								 <input type="text" class="form-control" placeholder="Enter Product Name" name="name" value="${productinfo[1]}" readonly required>
								
							</div>
						</div>
                        <br><br>
						<div class="form-group">
							<label class="control-label col-md-4">Unit Price</label>
							<div class="col-md-8">
								 <input type="text" class="form-control" placeholder="Enter Product Price" name="price" id="price" value="${String.format('%.2f', productinfo[3])}" required>
								
							</div>
						</div>
						<br><br>
						<div class="form-group">
							<label class="control-label col-md-4">Offer Price</label>
							<div class="col-md-8">
								 <input type="text" class="form-control" placeholder="Enter Offer Price" name="offerPrice" id="offerPrice" value="${String.format('%.2f', productinfo[11])}" required>
								
							</div>
						</div>
						<br><br>
						<div class="form-group">
							<label class="control-label col-md-4">Discount Percent</label>
							<div class="col-md-8">
								 <input type="text" class="form-control" placeholder="Enter Discount Percent" name="discountPercent" id="discountPercent" value="${String.format('%.2f', productinfo[12])}" required>
								 <input type="text" class="form-control" placeholder="Enter Discount Amount" name="discountAmount" id="discountAmount" value="${String.format('%.2f', productinfo[13])}" required>
								
							</div>
						</div>
                        <br><br>
						<div class="form-group">
							<label class="control-label col-md-4">Quantity</label>
							<div class="col-md-8">
								 <input type="number" class="form-control" placeholder="Enter Quantity" name="available" value="${productinfo[7]}" required>
								
							</div>
						</div>
						<br><br>
						<div class="form-group">
							<label class="control-label col-md-4">Product Description</label>
							<div class="col-md-8">
							<textarea class="form-control" placeholder="Enter Product Description" name="description" rows="2" cols="6" required>${productinfo[2]}</textarea>
								
								
							</div>
						</div>
 <br><br><br>

						<!-- <div class="form-group">
							<label class="control-label col-md-4">Upload a file</label>
							<div class="col-md-8">
								 <input type="file" class="form-control"  name="files" required>
								
							</div>
						</div> -->


						<!-- <div class="form-group">
							<label class="control-label col-md-4">&nbsp;</label>
							<div class="col-md-8">
								
							
								<div class="text-right">
									<br/>			
																					
									<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myCategoryModal">Add New Category</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#responsive">Add New SubCategory</button>
								</div>							
							</div>
							
						</div> -->


					
						<div class="form-group">
							
							<div class="col-md-offset-4 col-md-4">
							
								<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
								
							</div>
						</div>						
										
					</form:form>

				</div>

			</div>

		</div>

	</div>

	<!-- Modal -->
	<%-- <div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">New Category</h4>
	      </div>
	      <div class="modal-body">
	        
	        <form:form class="form-horizontal" action="insertcategory" method="POST">
	        	
       			<div class="form-group">
					<label class="control-label col-md-4">Category Name</label>
					<div class="col-md-8 validate">
						<input type="text" name="categoryName" class="form-control" required
							placeholder="Category Name" /> 
					</div>
				</div>
       			
       			<!-- <div class="form-group">				
					<label class="control-label col-md-4">Description</label>
					<div class="col-md-8 validate">
						<input type="text" class="form-control" required
							placeholder="Category Name" /> 
					</div>
				</div>	        	        
	         -->
	        
				<div class="form-group">				
					<div class="col-md-offset-4 col-md-4">					
						<input type="submit" name="submit" value="Save" class="btn btn-primary"/>						
					</div>
				</div>	        
	        </form:form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	 --%>
	
	
	<%-- <div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                              <form:form class="form-horizontal" action="insertsubcategory" method="POST">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                        <h4 class="modal-title"><b>New SubCategory</b></h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="scroller" style="height:150px" data-always-visible="1" data-rail-visible1="1">
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">
					<label class="control-label col-md-4">Name</label>
					<div class="col-md-8">
						
																	<input type="text" class="form-control" placeholder="Enter Category" name=categoryName  required>
																	
					</div>
				</div>
       			<br>
       			<div class="form-group">
					<label class="control-label col-md-4">SubCategory Name</label>
					<div class="col-md-8 validate">
						<input type="text" class="form-control" required
							placeholder="Enter SubCategory Name" /> 
					</div>
				</div>
       			<!-- <div class="form-group">				
					<label class="control-label col-md-4">Description</label>
					<div class="col-md-8 ">
					<textarea class="form-control" rows="3" cols="6" required></textarea>
						
					</div>
				</div>	   -->      	        
	        
	        
				
                                                                                </div>
                                                                               
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" data-dismiss="modal" class="btn dark btn-outline">Close</button>
                                                                        <button type="button" class="btn green">Save changes</button>
                                                                    </div>
                                                                </div>
                                                                  </form:form>
                                                            </div>
                                                          
                                                        </div>
                                                         --%>
	
	<hr/>	
	
	<hr/>
	
	

</div>
	 <script src="https://d3lmrw8lrrb6n3.cloudfront.net/metronic_v4.7.1/theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        
	 <script>
$(document).ready(function() {

	$(document).on(
			"change",
			"#categoryName",
			function() {

				 var Category = $(this).val();
				  
					$.get('fetchSubCategories', {
						Category : Category
					}, function(jsonResponse) {

					var select = $('#subCategoryName');
					
					select.find('option').remove();
				 	  $.each(jsonResponse, function(index, value) {
					  $('<option>').val(value).text(value).appendTo(select);
				      });

      
	});
	});

	$(document).on(
			"keyup",
			"#offerPrice",
			function() {

				 var offerPrice = $(this).val();
				// alert("offerPrice"+offerPrice);
				 var price=$("#price").val();
				 if(offerPrice>price){
					 $("#offerPrice").val("");
                alert("exceeds limit");
				 } else{
				 var discountPercent=((price-offerPrice)/price)*100;
				 discountPercent=discountPercent.toFixed(2);
				 $("#discountPercent").val(discountPercent);
				
				// alert("discountPercent"+discountPercent);
				 var discountAmount=price*(discountPercent/100);
				 discountAmount=discountAmount.toFixed(2);
				 $("#discountAmount").val(discountAmount);
				// alert("discountAmount"+discountAmount);
				 }
			  
	});
	$(document).on(
			"keyup",
			"#discountPercent",
			function() {

				 var discountPercent = $(this).val();
				// alert("discountPercent"+discountPercent);
				 if(discountPercent>100){
					 $("#discountPercent").val("");
		                alert("exceeds limit");
						 } else{
				 var price=$("#price").val();
				 var discountAmount=price*(discountPercent/100);
				 discountAmount=discountAmount.toFixed(2);
				 $("#discountAmount").val(discountAmount);
				// alert("discountAmount"+discountAmount);
				 var offerPrice=price-discountAmount;
				 offerPrice=offerPrice.toFixed(2);
				 $("#offerPrice").val(offerPrice);
				// alert("offerPrice"+offerPrice);
						 }
				 
			  
	});

});


</script>  
	<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>