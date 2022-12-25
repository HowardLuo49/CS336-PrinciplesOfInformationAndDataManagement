<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>

	<div style="text-align:center; font-size:30px">
		Item Information:
	</div>

	<br>
	<br>
	<br>

	<form action="addItem.jsp" method = "post">
		<div style="text-align:center; font-size:20px">
			Item Name:
			<br>
			<input type="text" name="itemName" />
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">
			Status:
			<br>
			<input type="text" name="status" />
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">
			Color:
			<br>
			<input type="text" name="color" />
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">
			Category:
			<br>
			<%
			out.print(Categories.cat1sub1+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat1sub1+"\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(Categories.cat1sub2+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat1sub2+"\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(Categories.cat1sub3+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat1sub3+"\" />");
			out.print("<br>");
			out.print(Categories.cat2sub1+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat2sub1+"\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(Categories.cat2sub2+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat2sub2+"\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(Categories.cat2sub3+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat2sub3+"\" />");
			out.print("<br>");
			out.print(Categories.cat3sub1+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat3sub1+"\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(Categories.cat3sub2+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat3sub2+"\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(Categories.cat3sub3+"<input type=\"radio\" name=\"subcategory\" value=\""+Categories.cat3sub3+"\" />");
			 %>
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">
			Item Description:
			<br>
			<textarea rows="5" cols="50" name="description"></textarea>
		</div>
		
		<div style="text-align:center; margin:5%">
			<button type = "submit">Add Item</button>
		</div>
		
	</form>
</body>
</html>