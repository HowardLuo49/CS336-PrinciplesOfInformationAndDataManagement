<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert Won Auctions</title>
</head>
<body>
	<%
		String email = (String) session.getAttribute("email");
	%>
	<h1>Won Auctions for <%= %>></h1>
	
	<%
		out.println(AlertWinner.alertWinner(email));
	%>
</body>
</html>