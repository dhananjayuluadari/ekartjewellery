<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="col-md-6">
	<c:set var="address" value="${address}" />
	<h2 id="addressTitle">Address Form</h2>
	
		<div class="form-group">
			<label for="fullName"> Full Name </label> <input id="fullName"
				name="fullName" type="text" class="form-control"
				placeholder="Full Name" value="${address.fullName}" />
		</div>
		<div class="form-group">
			<label for="address1"> Address 1 </label> <input id="address1"
				name="address1" type="text" class="form-control"
				placeholder="Address 1" value="${address.address1}" />
		</div>
		<div class="form-group">
			<label for="fullname"> Address 2 </label> <input id="address2"
				name="address2" type="text" class="form-control"
				placeholder="Address 2" value="${address.address2}" />
		</div>
		<div class="form-group">
			<label for="city"> City </label> <input id="city" name="city"
				type="text" class="form-control" placeholder="City"
				value="${address.city}" />
		</div>
		<div class="form-group">
			<label for="zipCode"> Zip Code </label> <input id="zipCode"
				name="zipCode" type="text" class="form-control"
				placeholder="Zip Code" value="${address.zipCode}" />
		</div>
		<div class="form-group">
			<label for="state"> State </label> <input id="state" name="state"
				type="text" class="form-control" placeholder="State"
				value="${address.state}" />
		</div>
		<!-- <div class="form-group">
			<input type="submit"  class="btn btn-large btn-primary"
				value="Edit Address" /> <a href="paymentMethod"
				class="btn btn-large btn-primary">Continue to Payment</a>
		</div> -->
	
</div>
<!-- <input id="copy"
				name="copy" type="checkbox" onchange="findValue()" /> -->
<div class="col-md-6">
	<c:set var="address" value="${address}" />
	<h2 id="addressTitle">Shipping Addres&nbsp;<input id="copy"
				name="copy" type="checkbox" onchange="findValue(this)" /></h2>
	${item.total}
	<form:form commandName="shippingaddress" id="shippingaddress"
		class="form-horizontal" action="shippingaddress" method="POST"   >
		<c:forEach var="products" items="${productsList}">
		<input name="productId" type="hidden" class="form-control" value="${products[0]}" />
		<input name="name" type="hidden" class="form-control" value="${products[1]}" />
		<input name="price" type="hidden" class="form-control" value="${products[2]}" />
		<input name="quantity" type="hidden" class="form-control" value="${products[5]}" />
		<input name="manufacturer" type="hidden" class="form-control" value="${products[3]}" />
		
		
		
		
		</c:forEach>
		<input name="total" type="hidden" class="form-control" value="${productsList.stream().map(products -> products[2]*products[5]).sum()}" />
		<div class="form-group">
			<label for="fullName"> Full Name </label> <input id="fullName1"
				name="fullName" type="text" class="form-control"
				placeholder="Full Name"  />
		</div>
		<div class="form-group">
			<label for="address1"> Address 1 </label> <input id="address11"
				name="address1" type="text" class="form-control"
				placeholder="Address 1"  />
		</div>
		<div class="form-group">
			<label for="fullname"> Address 2 </label> <input id="address21"
				name="address2" type="text" class="form-control"
				placeholder="Address 2"  />
		</div>
		<div class="form-group">
			<label for="city"> City </label> <input id="city1" name="city"
				type="text" class="form-control" placeholder="City"
				/>
		</div>
		<div class="form-group">
			<label for="zipCode"> Zip Code </label> <input id="zipCode1"
				name="zipCode" type="text" class="form-control"
				placeholder="Zip Code" />
		</div>
		<div class="form-group">
			<label for="state"> State </label> <input id="state1" name="state"
				type="text" class="form-control" placeholder="State"
				 />
		</div>
		<div class="form-group">
			<input type="submit"  class="btn btn-large btn-primary"
				value="Edit Address" />
				<input type="submit"  class="btn btn-large btn-primary"
				value="Continue to Payment" />
				 <!-- <a href="paymentMethod"
				class="btn btn-large btn-primary">Continue to Payment</a> -->
		</div>
	</form:form>
</div>
<script type="text/javascript">
     function findValue(check){
    	 
      var name= document.getElementById("fullName").value;
      var address1= document.getElementById("address1").value;
      var address2= document.getElementById("address2").value;
      var city= document.getElementById("city").value;
      var zipCode= document.getElementById("zipCode").value;
      var state= document.getElementById("state").value;
      if (check.checked) {
      document.getElementById("fullName1").value=name;
      document.getElementById("address11").value=address1;
      document.getElementById("address21").value=address2;
      document.getElementById("city1").value=city;
      document.getElementById("zipCode1").value=zipCode;
      document.getElementById("state1").value=state;
      }else{
    	  document.getElementById("fullName1").value="";
          document.getElementById("address11").value="";
          document.getElementById("address21").value="";
          document.getElementById("city1").value="";
          document.getElementById("zipCode1").value="";
          document.getElementById("state1").value="";
    	  
          }
      
     }

    

     </script>
     