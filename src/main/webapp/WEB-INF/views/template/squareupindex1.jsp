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
    <meta charset="UTF-8">
    <meta content="ie=edge" http-equiv="x-ua-compatible">
    <title>Sample Payment Form</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <script src="https://js.squareup.com/v2/paymentform" type="text/javascript">
    </script>
    <script>
        var applicationId = 'sandbox-sq0idp-tVvPe-svMrqgtzNNRvmStg'; // <-- This is set to a real value when it's rendered by the template in Main.java
        var locationId = '	CBASEFdniRLu7_KPHLFaPa7DwqAgAQ'; // <-- This is set to a real value when it's rendered by the template in Main.java

        // Make sure the application ID is set before continuing.
        if (applicationId == '' || locationId == '') {
            alert('You need to provide a value for applicationId and locationId.');
        }

        /*
        * function: requestCardNonce
        *
        * requestCardNonce is triggered when the "Pay with credit card" button is
        * clicked
        *
        * Modifying this function is not required, but can be customized if you
        * wish to take additional action when the form button is clicked.
        */
        function requestCardNonce(event) {
            
            // Don't submit the form until SqPaymentForm returns with a nonce
            event.preventDefault();
            
            // Request a nonce from the SqPaymentForm object
            paymentForm.requestCardNonce();
            }
            
            // Create and initialize a payment form object
            var paymentForm = new SqPaymentForm({
            
            // Initialize the payment form elements
            applicationId: applicationId,
            locationId: locationId,
            
            // SqPaymentForm callback functions
            callbacks: {
            
                /*
                * callback function: methodsSupported
                * Triggered when: the page is loaded.
                */
                methodsSupported: function (methods) {
            
                var applePayBtn = document.getElementById('sq-apple-pay');
                var applePayLabel = document.getElementById('sq-apple-pay-label');
                var masterpassBtn = document.getElementById('sq-masterpass');
                var masterpassLabel = document.getElementById('sq-masterpass-label');
            
                // Only show the button if Apple Pay for Web is enabled
                // Otherwise, display the wallet not enabled message.
                if (methods.applePay === true) {
                    applePayBtn.style.display = 'inline-block';
                    applePayLabel.style.display = 'none' ;
                }
                // Only show the button if Masterpass is enabled
                // Otherwise, display the wallet not enabled message.
                if (methods.masterpass === true) {
                    masterpassBtn.style.display = 'inline-block';
                    masterpassLabel.style.display = 'none';
                }
                },
            
                /*
                * callback function: createPaymentRequest
                * Triggered when: a digital wallet payment button is clicked.
                */
                createPaymentRequest: function () {
            
                var paymentRequestJson = {
                    requestShippingAddress: true,
                    currencyCode: "USD",
                    countryCode: "US",
                    total: {
                        label: "MERCHANT NAME",
                        amount: "10.00",
                        pending: false
                    }
                };
                return paymentRequestJson ;
                },
            
                /*
                * callback function: cardNonceResponseReceived
                * Triggered when: SqPaymentForm completes a card nonce request
                */
                cardNonceResponseReceived: function(errors, nonce, cardData) {
                if (errors) {
                    // Log errors from nonce generation to the Javascript console
                    console.log("Encountered errors:");
                    errors.forEach(function(error) {
                    console.log('  ' + error.message);
                    });
            
                    return;
                }
            
               // alert('Nonce received: ' + nonce); /* FOR TESTING ONLY */
              
               
                
                // Assign the nonce value to the hidden form field
                document.getElementById('card-nonce').value = nonce;
                
                // POST the nonce form to the payment processing page
                 
                document.getElementById('nonce-form').submit();
            
                },
            
                /*
                * callback function: unsupportedBrowserDetected
                * Triggered when: the page loads and an unsupported browser is detected
                */
                unsupportedBrowserDetected: function() {
                /* PROVIDE FEEDBACK TO SITE VISITORS */
                },
            
                /*
                * callback function: inputEventReceived
                * Triggered when: visitors interact with SqPaymentForm iframe elements.
                */
                inputEventReceived: function(inputEvent) {
                switch (inputEvent.eventType) {
                    case 'focusClassAdded':
                    /* HANDLE AS DESIRED */
                    break;
                    case 'focusClassRemoved':
                    /* HANDLE AS DESIRED */
                    break;
                    case 'errorClassAdded':
                    /* HANDLE AS DESIRED */
                    break;
                    case 'errorClassRemoved':
                    /* HANDLE AS DESIRED */
                    break;
                    case 'cardBrandChanged':
                    /* HANDLE AS DESIRED */
                    break;
                    case 'postalCodeChanged':
                    /* HANDLE AS DESIRED */
                    break;
                }
                },
            
                /*
                * callback function: paymentFormLoaded
                * Triggered when: SqPaymentForm is fully loaded
                */
                paymentFormLoaded: function() {
                /* HANDLE AS DESIRED */
                }
            }
            });
    </script>
    <!--
      These styles can live in a separate .css file. They're just here to keep this
      example to a single file.
    -->

   
</head>

<body>
    <div id="sq-ccbox">
        <!--
            You should replace the action attribute of the form with the path of
            the URL you want to POST the nonce to (for example, "/process-card")
        -->
        <form id="nonce-form" novalidate action="charge" method="post">
            Pay with a Credit Card
           
            <table>
            <tbody>
            
            
            
            <tr>
                <td>Card Number:</td>
                <td><input name="cardnumber" id="sq-card-number" type="text" class="form-control" /></td>
            </tr>
            <tr>
                <td>CVV:</td>
                <td><input name="cvv" id="sq-cvv" type="text" class="form-control" /></td>
            </tr>
            <tr>
                <td>Expiration Date: </td>
                <td><input name="expirationdate" id="sq-expiration-date" type="text" class="form-control" /></td>
            </tr>
            <tr>
                <td>Postal Code:</td>
                <td><input name="postalcode" id="sq-postal-code" type="text" class="form-control" /></td>
            </tr>
            <!-- <tr>
                <td>Card Number:</td>
                <td><div id="sq-card-number"><input name="cardnumber" id="sq-card-number" type="text" class="form-control" /></div></td>
            </tr>
            <tr>
                <td>CVV:</td>
                <td><div id="sq-cvv"></div></td>
            </tr>
            <tr>
                <td>Expiration Date: </td>
                <td><div id="sq-expiration-date"></div></td>
            </tr>
            <tr>
                <td>Postal Code:</td>
                <td><div id="sq-postal-code"></div></td>
            </tr>
             -->
            <tr>
                <td colspan="2">
                <button id="sq-creditcard" class="button-credit-card" onclick="requestCardNonce(event)">
                    Pay with card
                </button>
                </td>
            </tr>
            
            </tbody>
            </table>
        
            <!--
            After a nonce is generated it will be assigned to this hidden input field.
            -->
            <input type="hidden" id="card-nonce" name="nonce">
        </form>
        </div>
        
        <div id="sq-walletbox">
        Pay with a Digital Wallet
        <div id="sq-apple-pay-label" class="wallet-not-enabled">Apple Pay for Web not enabled</div>
        <!-- Placholder for Apple Pay for Web button -->
        <button id="sq-apple-pay" class="button-apple-pay"></button>
        
        <div id="sq-masterpass-label" class="wallet-not-enabled">Masterpass not enabled</div>
        <!-- Placholder for Masterpass button -->
        <button id="sq-masterpass" class="button-masterpass"></button>
        </div>
</body>

</html>