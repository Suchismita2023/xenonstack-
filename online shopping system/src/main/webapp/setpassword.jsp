
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>setpassword</title>
</head>
<body bgcolor="red">
<center><h2><font color="white"><b><u>Online Shopping System</u></b></font></h2></center>
<div id='container'>
  <div class='signup'>
  <h3>Change Password</h3>
  <form action="setpasswordser" method="post">
  <input type="email" name="email" placeholder="enter your email" required>
  <input type="password" name="newpassword" placeholder="Enter the new password to set." required>
  <input type="password" name="repassword" placeholder="Re-Enter the password." required>
  <input type="submit" value="save">
  
  </form>
     
  </div>
  <div class='whysignLogin'>
  <%
  String msg=request.getParameter("msg");
  if("wrong".equals(msg))
  {
  %>
  <h1>Password dose not match!</h1>
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