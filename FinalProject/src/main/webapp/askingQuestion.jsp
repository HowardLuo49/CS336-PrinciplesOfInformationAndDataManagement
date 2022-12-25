<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Ask Question Result Page</title>
</head>

<body>

    <%
    	String email = (String)session.getAttribute("email");
   		 try {
            String question = request.getParameter("askQuestion");

            ApplicationDB db=new ApplicationDB(); 
			Connection connection=db.getConnection(); 
			Statement statement=connection.createStatement(); 

			int r1 = statement.executeUpdate("insert into Questions values('" + email + "', null, '" + question + "', null);");
			response.sendRedirect("askQuestionConfirmation.jsp");
        } catch (Exception e) {
            out.print(e);
        }

    %>

</body>

</html>