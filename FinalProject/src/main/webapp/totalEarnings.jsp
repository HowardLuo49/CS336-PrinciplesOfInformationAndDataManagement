<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Total Earnings</title>
</head>
<body>

	<%
	
		Earnings earnings = new Earnings();
		double totalEarnings = earnings.getEarningsTotal();
	
	%>
	
	<h1>Total Earnings: <%= totalEarnings %></h1>	

</body>
</html>