<%@page import="com.spring.shopping.controller.constants.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>
<table border="1">
			<tbody>
				<tr>
					
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					
					<td><label>BANKNAME:</label></td>
					<td><%=parameters.get("BANKNAME")%></td>
				</tr>
				<tr>
					<td><label>BANKTXNID:</label></td>
					<td><%=parameters.get("BANKTXNID")%></td>
				</tr>
				<tr>
					<td><label>CURRENCY:</label></td>
					<td><%=parameters.get("CURRENCY")%></td>
				</tr>
				<tr>
					<td><label>GATEWAYNAME:</label></td>
					<td><%=parameters.get("GATEWAYNAME")%></td>
				</tr>
				<tr>
					<td><label>CURRENCY:</label></td>
					<td><%=parameters.get("CURRENCY")%></td>
				</tr>
				<tr>
					<td><label>MID:</label></td>
					<td><%=parameters.get("MID")%></td>
				</tr>
				<tr>
				<td><label>ORDERID:</label></td>
					<td><%=parameters.get("ORDERID")%></td>
				</tr>
				<tr>
					<td><label>PAYMENTMODE:</label></td>
					<td><%=parameters.get("PAYMENTMODE")%></td>
				</tr>
				<tr>
					<td><label>RESPCODE:</label></td>
					<td><%=parameters.get("RESPCODE")%></td>
				</tr>
				<tr>
					<td><label>RESPMSG:</label></td>
					<td><%=parameters.get("RESPMSG")%></td>
				</tr>
				<tr>
					<td><label>STATUS:</label></td>
					<td><%=parameters.get("STATUS")%></td>
				</tr>
				<tr>
					<td><label>TXNAMOUNT:</label></td>
					<td><%=parameters.get("TXNAMOUNT")%></td>
				</tr>
				<tr>
					<td><label>TXNDATE:</label></td>
					<td><%=parameters.get("TXNDATE")%></td>
				</tr>
				<tr>
					<td><label>TXNID:</label></td>
					<td><%=parameters.get("TXNID")%></td>
				</tr>
				
			</tbody>
		</table>
</body>
</html>