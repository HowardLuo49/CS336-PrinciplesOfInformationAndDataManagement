<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection c = db.getConnection();
	Statement s = c.createStatement();

	try {
		String entity = request.getParameter("search");
		
		String str = "SELECT * FROM AccountCustomerRepAdminStaff WHERE email LIKE '%" + entity + "%' AND isCustomerRep=false AND isAdminStaff=false";
		ResultSet result = s.executeQuery(str);
		
		%>
		<table border = "1">
		<tr>
		<th>
		Email
		</th>
		</tr>
		<%
		while (result.next()) {
			
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("email"));
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form action='userAuctions.jsp' method='post'><button name = 'email' type ='submit' value='" + result.getString("email") + "'>View Auctions this User has participated in </button></form>");
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		c.close();
	}
	catch (Exception e) {}
	
	%>
</body>
</html>