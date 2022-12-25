<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Registration Result Page</title>
</head>

<body>

    <%

        try {
            String email = request.getParameter("email");
            //String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            String name = request.getParameter("name");
            String address = request.getParameter("address");
 

            ApplicationDB db=new ApplicationDB(); 
			Connection connection=db.getConnection(); 
			Statement statement=connection.createStatement(); 
			ResultSet r1;

            // Identify if there exists a user already.
            r1 = statement.executeQuery("select * from AccountCustomerRepAdminStaff where email='" + email + "';");

            if(r1.next()) {
                out.println("Email Already in Use!");
            } else {
                
                int r2 = statement.executeUpdate("insert into AccountCustomerRepAdminStaff values('" + email + "', '" + password + "', '" + name + "', '" + address +
                		"', '1', '0');");
                response.sendRedirect("cRepRegisterConfirmation.jsp");
            }
        } catch (Exception e) {
            out.print(e);
        }

    %>

</body>

</html>