<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>

<body>
	<h2>Similar Items</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection c = db.getConnection();
	Statement s = c.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	
	int auction_ID = Integer.parseInt(request.getParameter("auction_ID"));
	String str = "SELECT * FROM AuctionCreates a, ItemBelongsToSelling b WHERE a.item_ID=b.item_ID and a.auction_ID=" + auction_ID;
	result = s.executeQuery(str);
	result.next();
	
	String category = result.getString("category_name");
	String status = result.getString("status");
	String color = result.getString("color");

	java.sql.Timestamp startTime = result.getTimestamp("startTime");
	java.sql.Timestamp endTime = result.getTimestamp("endTime");
	
	str = "SELECT * FROM AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) WHERE (ItemBelongsToSelling.category_name='" + category + "') and AuctionCreates.startTime >= DATE_ADD(NOW(), INTERVAL -1 MONTH)";
	Statement s1 = c.createStatement();
	result = s1.executeQuery(str);
	
	%>
	<table border = "1">
	<tr>
	<th>
	Auction ID
	</th>
	<th>
	Category
	</th>
	<th>
	Subcategory
	</th>
	<th>
	Status
	</th>
	<th>
	Color
	</th>
	<th>
	Current Bid
	</th>
	<th>
	End Time
	</th>
	<%
	
	while (result.next()) {
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getInt("auction_ID"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("category_name"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("subcategory_name"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("status"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("color"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getInt("currentBid"));
		out.print("<td>");
		out.print(result.getTimestamp("endTime"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='placeBid.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> Place Bid </button></form>");
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='bidHistory.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> Bid History </button></form>");
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='viewSimilarItems.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> View Similar Items </button></form>");
		out.print("</td>");
		
		out.print("</tr>");
	}
	out.print("</table>");
	%>

</body>
</html>