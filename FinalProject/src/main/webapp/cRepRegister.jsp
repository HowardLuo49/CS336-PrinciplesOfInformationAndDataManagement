<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a customer representative account</title>
</head>
<body>
	<div class="login">
		Create a customer representative account
		<form action="cRepRegistering.jsp">
			<div class="Email">
				<label>Email</label>
				<input id="email" type="text" name="email" required/> <br/>
			</div>
			<div class="Password">
				<label>Password</label>
				<input id="password" type="password" name="password" required/> <br/>
			</div>
			<div class="Name">
				<label>Name </label>
				<input id="name" type="text" name="name" /> <br/>
			</div>
			<div class="Address">
				<label>Address </label>
				<input id="address" type="text" name="address" /> <br/>
			</div>
			<div class="CreateAccount">
				<button type="submit">Create Account</button>
			</div>
		 </form>
    </div>
</body>
</html>