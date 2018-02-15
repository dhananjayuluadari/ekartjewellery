<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="UTF-8">
  <meta content="ie=edge" http-equiv="x-ua-compatible">
  <title>Charge Result</title>
  <meta content="width=device-width, initial-scale=1" name="viewport">
</head>

<body>
  <p>
    Charge succeeded. Transaction ID is <span th:text="${transactionId}">transactionId</span>.
  </p>
</body>

</html>
