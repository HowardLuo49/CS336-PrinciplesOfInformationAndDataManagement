<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Alert</title>
</head>
<body>

	<%
		String email = (String) session.getAttribute("email");
	%>

	<div class="createAlert">
		Create Alert for <%= email %>
		<form action="createAlertAttempt.jsp">
			<div class="ItemID">
				<label>Item ID Requested:</label> <input id="itemID" type="text" name="itemID" required /> <br />
			</div>
			<div class="createButton">
				<button type="submit">Create Alert</button>
			</div>
		</form>
	</div>

</body>
</html>