<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask a question</title>
</head>
<body>
	<form action="askingQuestion.jsp">
		<p><label for="askQuestion">Submit a question:</label></p>
		<textarea id="askQuestion" name="askQuestion" rows="4" cols="50">Enter text here</textarea>
  		<div class=SubmitQuestionButton">
				<button type="submit">Submit</button>
			</div>
  	</form>
</body>
</html>