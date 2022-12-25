<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="data.datamanagement.*,java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>
	<b> Search the list of items by various criteria </b>
	
	<br>
	<br>
	
	<b> Category is required </b>
	
	<br>
	<br>
	
	<form method="post" action="filterSearchAttempt.jsp">
		<label for="category">*Category</label> <select name="category"id="category" required>
			<option value="" disabled selected hidden="true">Select</option>
			<option value="Ford"><%= Categories.category1 %></option>
			<option value="Honda"><%= Categories.category2 %></option>
			<option value="Toyota"><%= Categories.category3 %></option>
		</select>
			
		<br>
		
		<table>
			<tr>
				<td>Status:</td>
				<td><input type="text" name="status"></td>
			</tr>
			<tr>
				<td>Color:</td>
				<td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td>Price less than:</td>
				<td><input type="text" name="price"></td>
			</tr>
		</table>
		
		<br>
		
		<input type="submit" value="Search">
	</form>
</body>
</html>