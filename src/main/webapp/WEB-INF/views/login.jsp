<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ecart Login</title>
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

.button:hover {
    background-color: #d68f33;
}

.button {
    background-color: #f2c55e; /* Green */
   color:black;  
   
}
.button2 {
    background-color: #cecdcb; /* Green */
    color:black;  
}

</style>
</head>
<body>
<center><img style="width: 140px; height: 41px; position: relative; right: -15px;"
                                         alt="Srishi I2I"
                                         src="https://s3.amazonaws.com/srishtibiz/ecart.jpg"></center>
                                         <br>
 <div class="container">
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					<form method="POST" action="login" role="form">
						<div class="form-group">
							<h2>Sign in</h2>
						</div>
						
						<c:choose>
								<c:when test="${loginStatus =='fail' ||  loginStatus =='' ||  loginStatus ==' '}">
						
						<div class="statusMessage">
						
										<span><strong>Successfully registered!! Please
												Login</strong> </span>
												</div>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
						</c:choose>
						<%-- <div class="statusMessage">
						<c:if test = "${loginStatus == 'fail'}">
									
										<span><strong>Successfully registered!! Please
												Login</strong> </span>
									</c:if>
									
								</div> --%>
						<div class="form-group">
							<strong>Email or mobile phone number</strong>
							<input id="signinEmail" name="phoneNumber" type="text" maxlength="50" class="form-control" placeholder="Email or Mobile number" required>
						</div>
						<div class="form-group">
							<strong>Password</strong>
							<span class="right"><a href="#">Forgot your password?</a></span>
							<input id="signinPassword" name="password" type="password" maxlength="25" class="form-control" placeholder="Password" required>
						</div>
						<div class="form-group" style="padding-top: 12px;">
							<button id="signinSubmit" type="submit" class="btn btn-block button">Sign in</button>
						</div>
						<div class="form-group divider">
							<hr class="left"><small>New to site?</small><hr class="right">
						</div>
						<p class="form-group"><a href="signup" class="btn  btn-block button2">Create an account</a></p>
						<p class="form-group">By signing in you are agreeing to our <a href="#">Terms of Use</a> and our <a href="#">Privacy Policy</a>.</p>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>