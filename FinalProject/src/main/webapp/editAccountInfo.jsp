<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h3> List of all accounts</h3>
	<form action="editAccountInfoAttempt.jsp">
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet result = null;
		
		String str = "select email from AccountCustomerRepAdminStaff where isCustomerRep=0 and isAdminStaff=0;";
		result = s.executeQuery(str);
		
		out.print("<table border=\"1\">");
		out.print("<tr>");
		out.print("<th>");
		out.print("Email");
		out.print("</th>");
		out.print("</tr>");
		int i=0;
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print("<input type='radio' name='email' value='"+result.getString("email")+"' required>"+result.getString("email"));
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
  		<div class=SubmitAccountButton>
				<button type="submit">Edit Account</button>
			</div>
  	</form>

</body>
</html>