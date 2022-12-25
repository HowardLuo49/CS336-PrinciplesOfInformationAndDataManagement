<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Changing Categories...</title>
</head>
<body>
	<%
	
	String c1, c2, c3, c1s1, c1s2, c1s3, c2s1, c2s2, c2s3, c3s1, c3s2, c3s3;
	
	c1 = request.getParameter("cat1");
	c2 = request.getParameter("cat2");
	c3 = request.getParameter("cat3");
	c1s1 = request.getParameter("cat1sub1");
	c1s2 = request.getParameter("cat1sub2");
	c1s3 = request.getParameter("cat1sub3");
	c2s1 = request.getParameter("cat2sub1");
	c2s2 = request.getParameter("cat2sub2");
	c2s3 = request.getParameter("cat2sub3");
	c3s1 = request.getParameter("cat3sub1");
	c3s2 = request.getParameter("cat3sub2");
	c3s3 = request.getParameter("cat3sub3");
	
	Categories.category1 = c1;
	Categories.category2 = c2;
	Categories.category3 = c3;
	
	Categories.cat1sub1 = c1s1;
	Categories.cat1sub2 = c1s2;
	Categories.cat1sub3 = c1s3;
	
	Categories.cat2sub1 = c2s1;
	Categories.cat2sub2 = c2s2;
	Categories.cat2sub3 = c2s3;
	
	Categories.cat3sub1 = c3s1;
	Categories.cat3sub2 = c3s2;
	Categories.cat3sub3 = c3s3;
	
	response.sendRedirect("changeCategoriesConfirmation.jsp");
	%>
</body>
</html>