<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Current Alerts</title>
</head>
<body>

	<%

		AlertManager manager = new AlertManager();
		String email = (String) session.getAttribute("email");

	%>
	
	<h1>Alerts for <%= email %></h1>
	
	<%
	
		out.println(manager.getAlerts(email));
	
	%>

</body>
</html>