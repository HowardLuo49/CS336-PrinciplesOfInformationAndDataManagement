<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earnings Per Item Type</title>
</head>
<body>

	<h1>Earnings Per Item Type</h1>

	<%
		
		Earnings earnings = new Earnings();
		out.println(earnings.getEarningsItemType());
	
	%>

</body>
</html>