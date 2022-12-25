<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Categories</title>
</head>
<body>
	<h1>Change Categories For BuyMe</h1>
	<form action="changeCategoriesAttempt.jsp">
		<div class="category1">
			<label>Category 1:</label> <input id="cat1" type="text" name="cat1" required /> <br />
			<label>Subcategory 1:</label> <input id="cat1sub1" type="text" name="cat1sub1" required /> <br />
			<label>Subcategory 2:</label> <input id="cat1sub2" type="text" name="cat1sub2" required /> <br />
			<label>Subcategory 3:</label> <input id="cat1sub3" type="text" name="cat1sub3" required /> <br />
		</div>
		<div class="category2">
			<label>Category 2:</label> <input id="cat2" type="text" name="cat2" required /> <br />
			<label>Subcategory 1:</label> <input id="cat2sub1" type="text" name="cat2sub1" required /> <br />
			<label>Subcategory 2:</label> <input id="cat2sub2" type="text" name="cat2sub2" required /> <br />
			<label>Subcategory 3:</label> <input id="cat2sub3" type="text" name="cat2sub3" required /> <br />
		</div>
		<div class="category3">
			<label>Category 3:</label> <input id="cat3" type="text" name="cat3" required /> <br />
			<label>Subcategory 1:</label> <input id="cat3sub1" type="text" name="cat3sub1" required /> <br />
			<label>Subcategory 2:</label> <input id="cat3sub2" type="text" name="cat3sub2" required /> <br />
			<label>Subcategory 3:</label> <input id="cat3sub3" type="text" name="cat3sub3" required /> <br />
		</div>
		<div class="submitButton">
			<button type="submit">Change Category Names</button>
		</div>
	</form>
</body>
</html>