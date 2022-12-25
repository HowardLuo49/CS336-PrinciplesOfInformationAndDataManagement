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
		
		String str = "SELECT * FROM ItemBelongsToSelling join CategorySubCategory_1SubCategory_2SubCategory_3 using (item_ID, category_name) WHERE category_name LIKE '%" + entity + "%' or subcategory_name LIKE '%" + entity + "%' or status LIKE '%" + entity + "%' or color LIKE '%" + entity + "%' or name LIKE '%" + entity +  "%'";
		ResultSet rs = s.executeQuery(str);
		
		%>
		<table border = "1">
		<tr>
		<th>
		Item ID
		</th>
		<th>
		Name
		</th>
		<th>
		Category
		</th>
		<th>
		Subcategory
		</th>
		<th>
		Status
		</th>
		<th>
		Color
		</th>
		<th>
		Description
		</th>
		</tr>
		<%
		
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getInt("item_ID"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("category_name"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("subcategory_name"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("status"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("color"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("description"));
			out.print("</td>");
		}
		out.print("</table>");
		con.close();
	} catch (Exception e) {
	}
	%>

</body>
</html>