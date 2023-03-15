<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body bgcolor="red">
<center><h3><font color="white"><b><u>Online Shopping System</u></b></font></h3></center>
<div id='container'>
  <div class='signup'>
   	<form action="userentry" method="post">
  	<input type="text" name ="name" placeholder="Enter name" required>
  	<input type="email" name ="email" placeholder="Enter email" required>
  	<input type="number" name ="mobile" placeholder="Enter number" required>
  	<select name="securityQue" required>
  	<option value="">Select Security Question.</option>
  	<option value="What is your pet name ?">What is your pet name ?</option>
  	<option value="What is your High school name?">What is your High school name?</option>
  	<option value="What is your best friend name ?">What is your best friend name ?</option>
  	</select>
  	<input type="text" name ="answer" placeholder="answer" required>
  	<input type="password" name ="password" placeholder="Enter password" required>
  	<input type="submit" value="signup">
  	</form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>Successfully Registered</h1>
<%}%>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
  </div>
</div>

</body>
</html>