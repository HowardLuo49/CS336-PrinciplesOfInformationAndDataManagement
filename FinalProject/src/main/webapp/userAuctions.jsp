<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
<p> The auctions this user has sold/bid on</p>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection c = db.getConnection();
	Statement s = c.createStatement();
	ResultSet result = null;
	
	try {
		String email = request.getParameter("email");
		String str = "select auction_ID, email from AuctionCreates where email ='" + email + "'"+ "UNION select auction_ID, email from BidOnPlaces where email = '"+email+"'";
		result = s.executeQuery(str);
		
		out.print("<table border = \"1\">");
		out.print("<tr>");
		out.print("<th>");
		out.print("Email");
		out.print("</th>");
		out.print("<th>");
		out.print("Auction ID");
		out.print("</th>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(email);
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("auction_ID"));
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