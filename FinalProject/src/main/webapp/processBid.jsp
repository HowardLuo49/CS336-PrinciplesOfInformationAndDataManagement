<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	ResultSet result = null;
	ResultSet result2 = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	PreparedStatement ps3 = null;
	
	try {
		int auction_ID = Integer.parseInt(session.getAttribute("auction_ID").toString());
		String s = "SELECT max(b.amount) FROM AuctionCreates a, BidOnPlaces b WHERE b.auction_ID=? AND b.auction_ID=a.auction_ID";
		ps = con.prepareStatement(s);
		ps.setInt(1, auction_ID);
		result = ps.executeQuery();
		result.next();
		
		String str2 = "SELECT initialPrice, bidIncrement FROM AuctionCreates WHERE auction_id=?";
		ps2 = con.prepareStatement(str2);
		ps2.setInt(1, auction_ID);
		result2 = ps2.executeQuery();
		result2.next();
		
		int initialPrice = result2.getInt("initialPrice");
		int bidIncrement = result2.getInt("bidIncrement");
		int currentBid = result.getInt("max(b.amount)");
		
		int userBid = Integer.parseInt(request.getParameter("bidAmount"));
		int maxBid = Integer.parseInt(request.getParameter("maxBid"));
		int auctionID = (int)session.getAttribute("auction_ID");
		String email = (String)session.getAttribute("email");
		
		if(userBid > maxBid) {
			out.println("Input credentials do not make sense");
			return;
		}
		if(userBid < currentBid + bidIncrement || userBid < initialPrice) {
			out.println("Your bid is too low");
			return;
		}
		
		db.insertBidOnPlaces(userBid, auctionID, email, maxBid);
		
		String updateAuctionCreates = "UPDATE AuctionCreates SET currentBID = ?, winner = ? WHERE auction_ID = ?";
		ps3 = con.prepareStatement(updateAuctionCreates);
		ps3.setInt(1, userBid);
		ps3.setString(2, email);
		ps3.setInt(3, auctionID);
		ps3.executeUpdate();
		
		response.sendRedirect("bidConfirmation.jsp");
	} catch (Exception e) {
		out.print(e);
	}
	%>


</body>
</html>