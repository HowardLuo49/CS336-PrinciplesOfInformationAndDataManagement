<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
	<h2>List of all auctions</h2>
	<form action='allAuctionsAttempt.jsp'>
		<label for="sortAuctions">List Auctions By</label> <select name="sortAuctions" required>
			<option value="Sort by Auction ID" selected>Auction ID</option>
			<option value="Sort by Category">Category</option>
			<option value="Sort by status">Status</option>
			<option value="Sort by Color">Color</option>
			<option value="Sort by Price">Price</option>
			<option value="Sort by End Time">End Times</option>
		</select>
		
		<label for="orderBy">Order By</label> <select name="orderBy" required>
			<option value="ascending" selected>Ascending</option>
			<option value="descending">Descending</option>
		</select>
		<input type="submit" value="List Auctions" />
	</form>
		
	<%
	ApplicationDB db = new ApplicationDB();
	Connection c = db.getConnection();
	Statement s = c.createStatement();
	ResultSet result = null;
	
	try {
		String str = "";
		String checked = request.getParameter("sortAuctions");
		String order = request.getParameter("orderBy");
		if(order.equals("ascending"))
		{
			if (checked.equals("Sort by Auction ID")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (auction_ID);";
			} else if (checked.equals("Sort by status")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (status);";
			} else if (checked.equals("Sort by Color")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (color);";
			} else if (checked.equals("Sort by End Time")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (endTime);";
			} else if (checked.equals("Sort by Price")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (currentBid);";
			} else if (checked.equals("Sort by Category")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (category_name);";
			}
		}
		else
		{
			if (checked.equals("Sort by Auction ID")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (auction_ID) desc;";
			} else if (checked.equals("Sort by status")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (status) desc;";
			} else if (checked.equals("Sort by Color")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (color) desc;";
			} else if (checked.equals("Sort by End Time")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (endTime) desc;";
			} else if (checked.equals("Sort by Price")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (currentBid) desc;";
			} else if (checked.equals("Sort by Category")) {
				str = "select * from AuctionCreates join ItemBelongsToSelling using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) order by (category_name) desc;";
			}
		}
		
		result = s.executeQuery(str);
		
		
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
		Name
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
		<th>
		Winner
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
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("status"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("color"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getFloat("currentBid"));
			out.print("<td>");
			out.print(result.getTimestamp("endTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("winner"));
			out.print("</td>");
			
			if(!result.getString("owner").equalsIgnoreCase((String)session.getAttribute("email")))
			{
				out.print("<td>");
				out.print("<form action='placeBid.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> Place Bid </button></form>");
				out.print("</td>");
			}
			else{
				out.print("<td>");
				out.print("</td>");
			}
			
			out.print("<td>");
			out.print("<form action='bidHistory.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> Bid History </button></form>");
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form action='viewSimilarItems.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> View Similar Items </button></form>");
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