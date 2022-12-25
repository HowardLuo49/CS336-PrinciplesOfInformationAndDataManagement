<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Answer Question Result Page</title>
</head>

<body>

    <%
    	String email = (String)session.getAttribute("email");
   		 try {
   			String qemailString = request.getParameter("qemail");
            String qAnswer = request.getParameter("answerQuestion");
			String questioner_email = qemailString.substring(0,qemailString.indexOf("|"));
			String question = qemailString.substring(qemailString.indexOf("|")+1);
            ApplicationDB db=new ApplicationDB(); 
			Connection connection=db.getConnection(); 
			Statement statement=connection.createStatement(); 
			int r1 = statement.executeUpdate("update Questions set answerer_email='"+email+"',response='"+qAnswer+"' where questioner_email='"+questioner_email+"' and question='"+question+"';");
			response.sendRedirect("answerQuestionConfirmation.jsp");
        } catch (Exception e) {
            out.print(e);
        }

    %>

</body>

</html>