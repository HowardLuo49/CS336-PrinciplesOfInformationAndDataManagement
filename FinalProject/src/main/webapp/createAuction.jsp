<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>

	<%
		session.setAttribute("item_ID", Integer.parseInt(request.getParameter("item_ID")));
	%>

	<div style="text-align:center; font-size:30px">
		Item Information:
	</div>
	<br>
	<div style="text-align:center; font-style: italic; font-size:20px">
		Please round all monetary values to the nearest whole number
	</div>
	<br>
	<br>
	<br>

	<form action="addAuction.jsp" method = "post">
		
		<div style="text-align:center; font-size:20px">
			Initial Price: $
			<br>
			<input type="text" name="initialPrice"/>
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">
			Bid Increment: $
			<br>
			<input type="text" name="bidIncrement"/>
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">
			Minimum Price: $
			<br>
			<input type="text" name="minPrice"/>
		</div>
		
		<br>
		<br>
		<br>
		
		<div style="text-align:center; font-size:20px">  
			End date of auction (format: yyyy-MM-dd hh:mm:ss)
			<br>
			<input type="text" name="endTime">
		</div> 
		
		<div style="text-align:center; margin:5%">
			<button type = "submit">Add Auction</button>
		</div>
		
	</form>
</body>
</html>