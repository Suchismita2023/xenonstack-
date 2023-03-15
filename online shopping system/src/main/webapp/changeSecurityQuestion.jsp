<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%if("notdone".equals(msg))
	{
	%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changesecurityQueser.jsp" method="post">
<h3>Select Your New Security Question</h3>
  <select class="input-style" name="securityQue">
  <option value="What is your pet name ?">What is your pet name ?</option>
  <option value="What is your High school name?">What is your High school name?</option>
  <option value="What is your best friend name ?">What is your best friend name ?</option>
  </select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newanswer" placeholder="Enter the Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter the password" required>
<hr>
 <button class="button" value="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>