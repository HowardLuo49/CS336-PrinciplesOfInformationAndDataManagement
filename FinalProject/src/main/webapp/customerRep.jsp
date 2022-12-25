<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Site | Logged On</title>
</head>
<body>

	<%
		String email = (String)session.getAttribute("email");
	%>
	
	<div style="text-align:center; font-size:30px">
		Welcome, Customer Representative <%=email%>!
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
		<a class="link" href="answerQuestion.jsp">
			<button style="name=AnswerQuestion; padding:15px">Answer a Question</button></a>
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
			<a class="link" href="editAccountInfo.jsp">
				<button style="name=SearchByFilters; padding:15px">Edit User Account Information</button></a>
	</div>

	<br>
	<br>
	<br>

	<div id="buttons" style="text-align:center">
			<a class="link" href="deleteBid.jsp">
				<button style="name=CreateItem; padding:15px">Remove a Bid</button></a>
	</div>

	<br>
	<br>
	<br>

	<div id="buttons" style="text-align:center">
		<a class="link" href="deleteAuction.jsp">
			<button style="name=AnswerQuestion; padding:15px">Remove an Auction</button></a>
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
		<a class="link" href="login.jsp">
			<button style="name=LogOut; padding:15px">Log Out</button></a>	
	</div>
	
</body>
</html>