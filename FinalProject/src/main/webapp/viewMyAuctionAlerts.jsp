<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction Alerts</title>
</head>
<body>
	<%
	
		String email = (String) session.getAttribute("email");
	
	%>
	
	<h1>Auction Status For: <%= email %></h1>
	
	<%
	
		out.println(AuctionAlerts.getAuctionAlerts(email));
	
	%>
	
	
	<h1>Auctions Won For: <%= email %></h1>
	
	<%
		out.println(AlertWinner.alertWinner(email));
	%>
	
</body>
</html>