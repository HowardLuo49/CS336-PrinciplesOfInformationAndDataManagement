<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>

	<%
	
	// Load the timer. Performs autobidding for each available item on auction.
	AutoBidding.setTimer();
	
	%>

	<div class="login">
		Login Page
		<form action="loginAttempt.jsp">
			<div class="Email">
				<label>Email</label> <input id="login" type="text" name="email"
					required /> <br />
			</div>
			<div class="Password">
				<label>Password</label> <input id="password" type="password"name="password"
					required /> <br />
			</div>
			<div class="LogInButton">
				<button type="submit">Log In</button>
			</div>
		</form>
		<a class="link" href="register.jsp">Create an account</a>
	</div>
</body>
</html>