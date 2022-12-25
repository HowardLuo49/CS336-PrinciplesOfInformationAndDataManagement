<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
	<h2>Filtered Results</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection c = db.getConnection();
	Statement s = c.createStatement();
	
	ResultSet result = null;
	List<Object> parameters = new ArrayList<Object>();
	
	try {
		String category = null;
		String status = null;
		String color = null;
		String price = "0";
		
		if(!request.getParameter("category").isEmpty())
		{
			category = request.getParameter("category");
			parameters.add(category);
		}
		
		if(!request.getParameter("status").isEmpty())
		{
			status = request.getParameter("status");
			parameters.add(status);
		}
		
		if(!request.getParameter("color").isEmpty())
		{
			color= request.getParameter("color");
			parameters.add(color);
		}
		
		if(!request.getParameter("price").isEmpty())
		{
			price = request.getParameter("price");
			parameters.add(Integer.parseInt(price));
		}
		
		StringBuilder query = new StringBuilder("SELECT * FROM ItemBelongsToSelling JOIN AuctionCreates using (item_ID) join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) WHERE endTime > now() and");
		if (!request.getParameter("category").isEmpty()) {
		    query.append(" category_name = ?");
		}
		if (!request.getParameter("status").isEmpty()) {
		    query.append(" AND status = ?");
		}
		if (!request.getParameter("color").isEmpty()) {
		    query.append(" AND color = ?");
		}
		if (!request.getParameter("price").isEmpty()) {
		    query.append(" AND currentBid < ?");
		}
		if(!request.getParameter("price").isEmpty())
		{
			query.append(" AND initialPrice <= " + Integer.parseInt(price));
		}
		
		String queryConversion = query.toString();
		s = c.prepareStatement(queryConversion);
		
		PreparedStatement ps = c.prepareStatement(queryConversion);
		
		for (int i = 0; i < parameters.size(); i++) {
		    ps.setObject(i+1, parameters.get(i));
		}
		
		result=ps.executeQuery();
		
		%>
		<table border = "1">
		<tr>
		<th>
		Category
		</th>
		<th>
		Status
		</th>
		<th>
		Color
		</th>
		<th>
		Price
		</th>
		<%
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("category_name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("status"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("color"));
			out.print("</td>");
			out.print("<td>");
			if(Integer.parseInt(result.getString("currentBid")) == 0) {
				out.print(result.getString("initialPrice"));
			}
			else {
				out.print(result.getString("currentBid"));
			}
			out.print("</td>");
			
			if(!result.getString("owner").equalsIgnoreCase((String)session.getAttribute("email")))
			{
				out.print("<td>");
				out.print("<form action='placeBid.jsp' method='post'><button name='auction_ID' type='submit' value='" + result.getInt("auction_ID") + "'> Place Bid </button></form>");
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
	}
	catch (Exception e) {
		out.print(e);
	}
	%>

</body>
</html>