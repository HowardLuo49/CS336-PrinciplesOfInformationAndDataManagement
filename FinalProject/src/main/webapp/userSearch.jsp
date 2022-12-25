<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
</head>

<body>
	<h3>List Auctions By Users</h3>
	<form action = 'userSearchAttempt.jsp' method ='post'>
		<input type="text" name="search">
		<button type="submit">Search</button>
	</form>
</body>
</html>