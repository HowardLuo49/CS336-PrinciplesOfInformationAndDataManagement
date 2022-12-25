<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h3> List of all auctions</h3>
	<form action="deleteAuctionAttempt.jsp">
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet result = null;
		
		String str = "select * from AuctionCreates;";
		result = s.executeQuery(str);
		
		out.print("<table border=\"1\">");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Email");
		out.print("</th>");
		out.print("<th>");
		out.print("Item ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Start Time");
		out.print("</th>");
		out.print("<th>");
		out.print("End Time");
		out.print("</th>");
		out.print("<th>");
		out.print("Current Bid");
		out.print("</th>");
		out.print("<th>");
		out.print("Bid Increment");
		out.print("</th>");
		out.print("<th>");
		out.print("Initial Price");
		out.print("</th>");
		out.print("<th>");
		out.print("Minimum Price");
		out.print("</th>");
		out.print("</tr>");
		int i=0;
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print("<input type='radio' name='auctionID' value='"+result.getInt("auction_ID")+"' required>"+result.getInt("auction_ID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("email"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("item_ID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getTimestamp("startTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getTimestamp("endTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("currentBid"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("bidIncrement"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("initialPrice"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("minPrice"));
			out.print("</td>");
			out.print("</tr>");
			i=1;
		}
		out.print("</table>");		
		c.close();
        if(i == 0) {
            return;
        }
	} catch (Exception e) {
	}
	%>
	<br>
  		<div class=SubmitButton>
				<button type="submit">Delete Auction</button>
			</div>
  	</form>

</body>
</html>