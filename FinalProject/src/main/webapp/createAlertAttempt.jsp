<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Alert Attempt</title>
</head>
<body>

	<%
	
	String email = (String) session.getAttribute("email");
	String itemID = (String) request.getParameter("itemID");
	
	out.println("Creating Alert for " + email + " Item: " + itemID);
	out.println("<br>");
	
	AlertManager manager = new AlertManager();
	
	out.println(manager.createAlert(email, itemID));
	
	%>
		<div>
		<a href="loggedIn.jsp" style="text-decoration:none;">
			<button style="margin:5px;">Return to Home Page</button>
		</a>
	</div>
</body>
</html>