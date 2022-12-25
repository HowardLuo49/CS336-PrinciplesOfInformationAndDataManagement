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
		int bidID = Integer.parseInt(request.getParameter("bidID"));
		
		PreparedStatement s2 = null;
		ResultSet r2 = null;
		String str = "SELECT auction_ID from BidOnPlaces where bid_ID='" +bidID+ "'";
		s2=connection.prepareStatement(str);
		r2 = s2.executeQuery();
		r2.next();
		int auction_ID = r2.getInt("auction_ID");
		
		statement.executeUpdate("DELETE from BidOnPlaces where bid_ID='" +bidID+ "'");
		
		ResultSet result = null;
		ResultSet result2 = null;
		ResultSet result3 = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		
		
		String s4 = "SELECT * FROM AuctionCreates a, BidOnPlaces b WHERE b.auction_ID=? AND b.auction_ID=a.auction_ID";
		ps4 = connection.prepareStatement(s4);
		ps4.setInt(1, auction_ID);
		result3 = ps4.executeQuery();
		int currentBid = 0;
		String email = "No Bids yet";
		if(result3.next()){
		String s = "SELECT max(b.amount) FROM AuctionCreates a, BidOnPlaces b WHERE b.auction_ID=? AND b.auction_ID=a.auction_ID";
		ps = connection.prepareStatement(s);
		ps.setInt(1, auction_ID);
		result = ps.executeQuery();
		if(result.next()){
			currentBid = result.getInt("max(b.amount)");
			String s3 = "SELECT b.email FROM AuctionCreates a, BidOnPlaces b WHERE b.auction_ID=? AND b.auction_ID=a.auction_ID AND b.amount=?";
			ps2 = connection.prepareStatement(s3);
			ps2.setInt(1, auction_ID);
			ps2.setInt(2, currentBid);
			result2 = ps2.executeQuery();
			if(result2.next())
				email = result2.getString("b.email");
			}
		}

		

		
		
		
		
		String updateAuctionCreates = "UPDATE AuctionCreates SET currentBID = ?, winner = ? WHERE auction_ID = ?";
		ps3 = connection.prepareStatement(updateAuctionCreates);
		ps3.setInt(1, currentBid);
		ps3.setString(2, email);
		ps3.setInt(3, auction_ID);
		ps3.executeUpdate();
		
		
		response.sendRedirect("deleteBidConfirmation.jsp");
	}
	catch (Exception e) {
		out.print(e);
	}
%>

</body>
</html>