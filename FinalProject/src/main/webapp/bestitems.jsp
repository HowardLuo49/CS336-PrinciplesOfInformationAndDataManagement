<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Items</title>
</head>
<body>

	<h1>Best Items</h1>
	
	<%
	
		BestThings things = new BestThings();
		out.println(things.getBestItem());
	
	%>

</body>
</html>