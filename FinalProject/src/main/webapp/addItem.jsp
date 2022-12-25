<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*" import ="java.util.*" import ="java.util.Date" import="java.sql.*" import="java.text.SimpleDateFormat" %>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	
	<%
		ApplicationDB db = new ApplicationDB();
		
		String email = (String)session.getAttribute("email");
		
 		
 		
 		String subcategory = request.getParameter("subcategory");
 		String category = "";
		if(subcategory.equals(Categories.cat1sub1) || 
				subcategory.equals(Categories.cat1sub2) || 
				subcategory.equals(Categories.cat1sub3)) {
			category = Categories.category1;
		}
		if(subcategory.equals(Categories.cat2sub1) || 
				subcategory.equals(Categories.cat2sub2) || 
				subcategory.equals(Categories.cat2sub3)) {
			category = Categories.category2;
		}
		if(subcategory.equals(Categories.cat3sub1) || 
				subcategory.equals(Categories.cat3sub2) || 
				subcategory.equals(Categories.cat3sub3)) {
			category = Categories.category3;
		}
		
 		String name = request.getParameter("itemName");
		String status = request.getParameter("status");
		String color = request.getParameter("color");
		String description = request.getParameter("description");
		
		db.insertItemBelongsToSelling(name, status, color, category, description, (String) session.getAttribute("email"));
		
		db.insertCategorySubCategory_1SubCategory_2SubCategory_3(category, subcategory);
		
		
		
		
		
		response.sendRedirect("addItemConfirmation.jsp");
	%>

</body>
</html>