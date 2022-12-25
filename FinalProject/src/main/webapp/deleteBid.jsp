<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h3> List of all bids</h3>
	<form action="deleteBidAttempt.jsp">
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet result = null;
		
		String str = "select * from BidOnPlaces;";
		result = s.executeQuery(str);
		
		out.print("<table border=\"1\">");
		out.print("<tr>");
		out.print("<th>");
		out.print("Bid_ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Amount");
		out.print("</th>");
		out.print("<th>");
		out.print("Auction_ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Email");
		out.print("</th>");
		out.print("<th>");
		out.print("Upper_Limit");
		out.print("</th>");
		out.print("</tr>");
		int i=0;
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print("<input type='radio' name='bidID' value='"+result.getInt("bid_ID")+"' required>"+result.getInt("bid_ID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("amount"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("auction_ID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("email"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("upper_limit"));
			out.print("</td>");
			out.print("</tr>");
			i=1;
		}
		out.print("</table>");		
		c.close();
		String bID = request.getParameter("bidID");
        if(i == 0) {
            return;
        }
	} catch (Exception e) {
	}
	%>
	<br>
  		<div class=SubmitButton>
				<button type="submit">Delete Bid</button>
			</div>
  	</form>

</body>
</html>