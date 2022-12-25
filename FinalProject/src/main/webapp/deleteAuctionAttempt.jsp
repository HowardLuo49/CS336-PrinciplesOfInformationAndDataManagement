<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" import ="java.util.*" import ="java.util.Date" import="java.sql.*" import="java.text.SimpleDateFormat" %>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%
	try {
		ApplicationDB db=new ApplicationDB(); 
		Connection connection=db.getConnection(); 
		Statement statement=connection.createStatement();
		int auctionID = Integer.parseInt(request.getParameter("auctionID"));
		statement.executeUpdate("DELETE from AuctionCreates where auction_ID='" +auctionID+ "'");
		
		response.sendRedirect("deleteAuctionConfirmation.jsp");
	}
	catch (Exception e) {
		out.print(e);
	}
%>

</body>
</html>