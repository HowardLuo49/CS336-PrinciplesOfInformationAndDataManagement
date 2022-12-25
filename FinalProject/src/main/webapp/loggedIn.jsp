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
		Welcome, <%=email%>!
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
		<a class="link" href="allAuctions.jsp">
			<button style="name=allAuctions; padding:15px">View All Auctions</button></a>
		<a class="link" href="allItems.jsp">
			<button style="name=allItems; padding:15px">View All Items</button></a>
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
		<a class="link" href="filterSearch.jsp">
			<button style="name=SearchByFilters; padding:15px">Search Auctions By Filters</button></a>
		<a class="link" href="keywordSearch.jsp">
			<button style="name=searchByKeyword; padding:15px">Search Items By Keyword</button></a>
		<a class="link" href="userSearch.jsp">
			<button style="name=userSearch; padding:15px">Search Auctions By User</button></a>
	</div>

	<br>
	<br>
	<br>

	<div id="buttons" style="text-align:center">
		<a class="link" href="createItem.jsp">
			<button style="name=CreateItem; padding:15px">Create Item</button></a>
		<a class="link" href="viewMyAuctions.jsp">
			<button style="name=viewMyAuctions; padding:15px">View My Auctions</button></a>
		<a class="link" href="createAlert.jsp">
			<button style="name=createAlert; padding:15px">Create New Alert</button></a>
		<a class="link" href="viewMyAlerts.jsp">
			<button style="name=viewMyAlerts; padding:15px">View My Alerts</button></a>
		<a class="link" href="viewMyAuctionAlerts.jsp">
			<button style="name=viewMyAuctionAlerts; padding:15px">View Auction Alerts</button></a>
	</div>

	<br>
	<br>
	<br>

	<div id="buttons" style="text-align:center">
		<a class="link" href="askQuestion.jsp">
			<button style="name=askQuestion; padding:15px">Ask a Question</button></a>
		<a class="link" href="questionSearch.jsp">
			<button style="name=viewReplies; padding:15px">Search Questions by Keyword</button></a>
		<a class="link" href="viewReplies.jsp">
			<button style="name=viewReplies; padding:15px">View Questions</button></a>
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
		<a class="link" href="login.jsp">
			<button style="name=LogOut; padding:15px">Log Out</button></a>
	</div>
	
	<br>
	<br>
	<br>
	
	<div id="buttons" style="text-align:center">
		<a class="link" href="deleteAccount.jsp">
			<button style="name=deleteAccount; padding:15px">Delete Account</button></a>
	</div>
	
</body>
</html>