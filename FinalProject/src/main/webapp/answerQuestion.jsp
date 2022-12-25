<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="data.datamanagement.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h3> List of all pending questions</h3>
	<form action="answerQuestionAttempt.jsp">
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet result = null;
		
		String str = "select questioner_email, question from Questions where answerer_email is null;";
		result = s.executeQuery(str);
		
		out.print("<table border = \"1\">");
		out.print("<tr>");
		out.print("<th>");
		out.print("Questioner_Email");
		out.print("</th>");
		out.print("<th>");
		out.print("Question");
		out.print("</th>");
		out.print("</tr>");
		int i = 0;
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print("<input type='radio' name='qemail' id='qemail'"+i+" value='"+result.getString("questioner_email")+"|"+result.getString("question")+"' required>"+result.getString("questioner_email"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");
			out.print("</tr>");
			i++;
		}
		out.print("</table>");		
		c.close();
        if(i==0) {
            return;
        }
	} catch (Exception e) {
	}
	%>
	<br>
		<p><label for="answerQuestion">Create a response:</label></p>
		<textarea id="answerQuestion" name="answerQuestion" rows="4" cols="50">Enter text here</textarea>
  		<div class=SubmitQuestionButton>
				<button type="submit">Submit</button>
			</div>
  	</form>

</body>
</html>