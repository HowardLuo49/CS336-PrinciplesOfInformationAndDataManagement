<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h3> List of all questions</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet result = null;
		String str = "select question, response from Questions";
		result = s.executeQuery(str);
		
		out.print("<table border = \"1\">");
		out.print("<tr>");
		out.print("<th>");
		out.print("Question");
		out.print("</th>");
		out.print("<th>");
		out.print("Response");
		out.print("</th>");
		out.print("</tr>");
		int i = 0;
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");
			out.print("<td>");
			if(result.getString("response")==null)
				out.print("");
			else
				out.print(result.getString("response"));
			out.print("</td>");
			out.print("</tr>");
			i++;
		}
		out.print("</table>");		
		c.close();
	} catch (Exception e) {
	}
	%>
	<a href="loggedIn.jsp" style="text-decoration:none;">
		<button style="margin:5px;">Return to Home Page</button>
	</a>
	
</body>
</html>