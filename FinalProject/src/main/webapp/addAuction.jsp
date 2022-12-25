<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" import ="java.util.*" import ="java.util.Date" import="java.sql.*" import="java.text.SimpleDateFormat" %>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	
	<%
		ApplicationDB db = new ApplicationDB();
		
		String bidIncrement = request.getParameter("bidIncrement");
		String minPrice = request.getParameter("minPrice");
		String initialPrice = request.getParameter("initialPrice");
		
		int BI = Integer.parseInt(bidIncrement);
		int MP = Integer.parseInt(minPrice);
		int IP = Integer.parseInt(initialPrice);
		
		int currentBid = 0;
		
		java.util.Date date = new java.util.Date();
		Timestamp startTime = new java.sql.Timestamp(date.getTime());
		
		String endTimeInput = request.getParameter("endTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date2 = sdf.parse(endTimeInput);
		Timestamp endTime = new java.sql.Timestamp(date2.getTime());
		
		String email = (String)session.getAttribute("email");
		
		db.insertAuction(startTime, endTime, currentBid, Integer.parseInt(bidIncrement), Integer.parseInt(minPrice), Integer.parseInt(initialPrice), email, (int)session.getAttribute("item_ID"));
		
		response.sendRedirect("addAuctionConfirmation.jsp");
	%>

</body>
</html>