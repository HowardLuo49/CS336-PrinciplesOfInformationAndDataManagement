<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h3> List of all items</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet result = null;
		ResultSet result2 = null;
		PreparedStatement ps = null;
		
		String str = "select * from ItemBelongsToSelling join CategorySubCategory_1SubCategory_2SubCategory_3 using (Item_ID);";
		result = s.executeQuery(str);
		%>
		<table border="1">
		<tr>
		<th>
		Item ID
		</th>
		<th>
		Name
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
		Description
		</th>
		<th>
		Owner
		</th>
		</tr>
		<%

		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("item_ID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("name"));
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
			out.print(result.getString("description"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("owner"));
			out.print("</td>");
			
			String temp = "select * from AuctionCreates where item_ID = ?";
			ps = c.prepareStatement(temp);
			ps.setInt(1, result.getInt("item_ID"));
			result2 = ps.executeQuery();
			
			if(!result2.next() && result.getString("owner").equalsIgnoreCase((String)session.getAttribute("email")))
			{
				out.print("<td>");
				out.print("<form action='createAuction.jsp' method='post'><button name='item_ID' type='submit' value='" + result.getInt("item_ID") + "'>Create Auction</button></form>");
				out.print("</td>");
			}
			else if(!result.getString("owner").equalsIgnoreCase((String)session.getAttribute("email")))
			{
				out.print("<td>");
				out.print("<form action='createAlert.jsp' method='post'><button>Create Alert</button></form>");
				out.print("</td>");
			}
			
			out.print("</tr>");
		}
		out.print("</table>");
		c.close();
	} catch (Exception e) {
	}
	%>

</body>
</html>