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
   			String email = request.getParameter("uemail");
   			String password = request.getParameter("password");
   			String name = request.getParameter("name");
   			String address = request.getParameter("address");
   			
   			String originalEmail = (String)session.getAttribute("editAccountEmail");
   			
            ApplicationDB db=new ApplicationDB(); 
			Connection connection=db.getConnection(); 
			Statement statement=connection.createStatement();
			if(email.equals(originalEmail)){
				String str = "update AccountCustomerRepAdminStaff set password='"+password+"',name='"+name+"',address='"+address+
						"' where email='"+email+"';";
				int r1 = statement.executeUpdate(str);
			}
			else{
				Statement s = connection.createStatement();
				ResultSet result = null;
				
				String strng = "select email from AccountCustomerRepAdminStaff where email = '"+email+"';";
				result = s.executeQuery(strng);
				if(result.next()){
					response.sendRedirect("editAccountInfo.jsp");
				}
				else{
				String str = "update AccountCustomerRepAdminStaff set email='"+email+"',password='"+password+"',name='"+name+"',address='"+address+
						"' where email='"+originalEmail+"';";
				int r2 = statement.executeUpdate(str);
				}
			}
			response.sendRedirect("editAccountInfoConfirmation.jsp");
        } catch (Exception e) {
            out.print(e);
        }

    %>

</body>

</html>