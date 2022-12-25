<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="data.datamanagement.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>
</head>
<body>

	<div style="text-align: center"><h1>Statistics</h1></div>

	<br>
	<br>
	<br>

	<div id="buttons" style="text-align: center">
		<a class="link" href="totalEarnings.jsp">
			<button style="padding: 15px">Total Earnings</button>
		</a> <a class="link" href="earningsPerItem.jsp">
			<button style="padding: 15px">Earnings Per Item</button>
		</a> <a class="link" href="earningsPerItemType.jsp">
			<button style="padding: 15px">Earnings Per Item Type</button>
		</a> <a class="link" href="earningsPerEndUser.jsp">
			<button style="padding: 15px">Earnings Per End User</button>
		</a>
	</div>

	<br>
	<br>
	<br>


	<div id="buttons" style="text-align: center">
		<a class="link" href="bestitems.jsp">
			<button style="padding: 15px">Best Items</button>
		</a> <a class="link" href="bestusers.jsp">
			<button style="padding: 15px">Best Buyers</button>
		</a>
	</div>

</body>
</html>