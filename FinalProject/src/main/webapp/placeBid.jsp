<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>

<%
	int auction_ID = Integer.parseInt(request.getParameter("auction_ID"));
	session.setAttribute("auction_ID", auction_ID);
%>

<h2> Input bid credentials</h2>
	<div style="font-style: italic; font-size:15px">
		Please round all monetary values to the nearest whole number
	</div>
	<br>
	<div>
		<form action="processBid.jsp" method="POST">	
		<table>
			<tr>
			<td>Bid Amount: </td><td><input type="number" name="bidAmount" required></td>
			</tr>
			<tr>
			<td>Max Bid You Are Willing To Go To: </td><td><input type="number" name="maxBid" required></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Submit Bid">
		</form>
	</div>
</body>
</html>