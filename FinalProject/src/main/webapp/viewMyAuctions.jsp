<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
	<h3>My list of auctions</h3>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection c = db.getConnection();
	Statement s = c.createStatement();
	ResultSet result = null;
	
	try {
		String str = "select * from AuctionCreates a join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) where a.email = ? order by (auction_id) ";
		PreparedStatement ps = c.prepareStatement(str);
		String email = (String)session.getAttribute("email");
		ps.setString(1, email);
		result = ps.executeQuery();
			
		%>
		<table border="1">
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
			out.print("<form action='bidHistory.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> Bid History </button></form>");
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>