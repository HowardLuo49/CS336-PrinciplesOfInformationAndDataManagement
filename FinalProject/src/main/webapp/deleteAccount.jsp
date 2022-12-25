<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" import ="java.util.*" import ="java.util.Date" import="java.sql.*" import="java.text.SimpleDateFormat" %>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%
	try {
		ApplicationDB db=new ApplicationDB(); 
		Connection connection=db.getConnection(); 
		Statement statement=connection.createStatement(); 
		statement.executeUpdate("DELETE from AccountCustomerRepAdminStaff where email='" + (String)session.getAttribute("email") + "'");
		
		response.sendRedirect("deleteAccountConfirmation.jsp");
	}
	catch (Exception e) {
		out.print(e);
	}
%>

</body>
</html>