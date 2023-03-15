
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body bgcolor="red">
<center><h2><font color="white"><b><u>Online Shopping System</u></b></font></h2></center>
<div id='container'>
  <div class='signup'>
  <form action="logincheeck" method="post">
  <input type="email" name="email" placeholder="Enter your email id" required>
  <input type="password" name="password" placeholder="Enter your password" required>
  <input type="submit" value="login">
  
  </form>
     
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
  %>
  <h1>Incorrect Username or Password</h1>
  <%
  }
  %>
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