<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
</head>

<body>
<h3> Results</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement s = con.createStatement();
		String entity = request.getParameter("search");
		
		String str = "SELECT * FROM Questions WHERE question LIKE '%" + entity +  "%'";
		ResultSet rs = s.executeQuery(str);
		
		%>
		<table border = "1">
		<tr>
		<th>
		Question
		</th>
		<th>
		Response
		</th>
		</tr>
		<%
		
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("question"));
			out.print("</td>");
			out.print("<td>");
			if(rs.getString("response")==null)
				out.print("");
			else
				out.print(rs.getString("response"));			
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		con.close();
	} catch (Exception e) {
	}
	%>
		<a href="loggedIn.jsp" style="text-decoration:none;">
			<button style="margin:5px;">Return to Home Page</button>
		</a>

</body>
</html>