<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Users</title>
</head>
<body>

	<h1>Best Users</h1>
	
	<%
	
		BestThings things = new BestThings();
		out.println(things.getBestUser());
	
	%>

</body>
</html>