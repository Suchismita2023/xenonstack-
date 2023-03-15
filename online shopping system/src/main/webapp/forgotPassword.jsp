<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body bgcolor="red">
<div id='container'>
  <div class='signup'>
  <form action="changepassword" method="post">
  <input type="email" name="email" placeholder="enter email" required>
  <input type="number" name="mobile" placeholder="enter mobile Number" required>
  <select name="securityQue"> 
  <option value="">Select Security Question.</option>
  <option value="pet">What is your pet name ?</option>
  <option value="school">What is your High school name?</option>
  <option value="friend">What is your best friend name ?</option>
  </select>
  <input type="text" name="answer" placeholder="answer" required>
  <input type="password" name="newpassword" placeholder="Enter password to set." required>
  <input type="submit" value="change password">
  </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  <%
  String msg=request.getParameter("msg");
  if("done".equals(msg))
  {
  %>   
<h1>Password Changed Successfully!</h1>
<%}%>
<%
if("notdone".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% } %>
  </div>
</div>
</body>
</html> 