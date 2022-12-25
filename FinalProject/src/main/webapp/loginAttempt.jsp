<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login Attempt</title>
	</head>
	<body>
		<% 
			try{ 
				String email=request.getParameter("email"); 
				String password=request.getParameter("password"); 
				ApplicationDB db=new ApplicationDB(); 
				Connection connection=db.getConnection(); 
				Statement statement=connection.createStatement(); 
				ResultSet r1;
				r1=statement.executeQuery("select * from AccountCustomerRepAdminStaff where email='" + email + "'");

				if(r1.next()) {
					ResultSet r2;
					r2 = statement.executeQuery(" select * from AccountCustomerRepAdminStaff where email='" + email + "' and password='" + password + "'");
					if(r2.next()) {
						session.setAttribute("email", email);
						ResultSet r3;
						r3 = statement.executeQuery(" select * from AccountCustomerRepAdminStaff where email='" + email + "' and password='" + password + "' and isCustomerRep=true");
						if(r3.next())
							response.sendRedirect("customerRep.jsp");
						else{
						ResultSet r4;
						r4 = statement.executeQuery(" select * from AccountCustomerRepAdminStaff where email='" + email + "' and password='" + password + "' and isAdminStaff=true");
						if(r4.next())
							response.sendRedirect("admin.jsp");
						else
							response.sendRedirect("loggedIn.jsp");
						} 
					} 
					else { out.println("Invalid password, please go back and try again");
					}
				}
				else {
					out.println("Invalid email, please go back and try again");
				}
			}
			catch (Exception e) {
				out.print(e);
			}
		%>
	</body>

</html>