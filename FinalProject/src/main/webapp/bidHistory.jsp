<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
<h2> View Bid History</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	PreparedStatement ps = null;
	try {
		int auction_ID = Integer.parseInt(request.getParameter("auction_ID"));
		String viewBid = "SELECT * FROM BidOnPlaces WHERE auction_ID = ? ORDER BY amount desc";
		ps = con.prepareStatement(viewBid);
		ps.setInt(1, auction_ID);
		result = ps.executeQuery();
		%>
			<table border = "1">
			<tr>
			<th>Auction ID</th>
			<th>Buyer</th>
			<th>Amount</th>
			</tr>
		<%
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("auction_ID"));
			out.print("</td>");
			
			if(result.getString("email")==null)
			{
				out.print("<td>");
				out.print("deleted user");
				out.print("</td>");
			}
			else
			{
				out.print("<td>");
				out.print(result.getString("email"));
				out.print("</td>");
			}
			
			out.print("<td>");
			out.print("$" + result.getInt("amount"));
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