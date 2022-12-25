<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Edit Account Information Result Page</title>
</head>

<body>

    <%
   		 try {
   			String email = request.getParameter("email");
   			session.setAttribute("editAccountEmail", email);
   			
            ApplicationDB db=new ApplicationDB(); 
			Connection connection=db.getConnection(); 
			Statement statement=connection.createStatement();
			ResultSet result = null;
			String str = "select * from AccountCustomerRepAdminStaff where email= '"+email+"';";
			result = statement.executeQuery(str);
			while(result.next()){
			out.print("<div class='login'>");
			out.print("Edit Account Information");
			out.print("<form action='editAccountInfoAttemptFinal.jsp'>");
			out.print("<div class='Email'>");
			out.print("<label>Email</label>");
			out.print("<input id='uemail' type='text' name='uemail' value='"+result.getString("email")+"' required/><br/>");
			out.print("</div>");
			out.print("<div class='Password'>");
			out.print("<label>Password</label>");
			out.print("<input id='password' type='text' name='password' value='"+result.getString("password")+"' required/><br/>");
			out.print("</div>");
			out.print("<div class='Name'>");
			out.print("<label>Name </label>");
			out.print("<input id='name' type='text' name='name' value='"+result.getString("name")+"' /><br/>");
			out.print("</div>");
			out.print("<div class='Address'>");
			out.print("<label>Address </label>");
			out.print("<input id='address' type='text' name='address' value='"+result.getString("address")+"' /><br/>");
			out.print("</div>");
			out.print("<div class='EditInfoButton'>");
			out.print("<button type='submit'>Submit</button>");
			out.print("</div>");
			out.print("</form>");
			out.print("</div>");
			}
        } catch (Exception e) {
            out.print(e);
        }

    %>

</body>

</html>