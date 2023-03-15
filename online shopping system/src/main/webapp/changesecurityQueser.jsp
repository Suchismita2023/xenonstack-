<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String securityQue=request.getParameter("securityQue");
String newanswer=request.getParameter("newanswer");
String password=request.getParameter("password");
int check=0;

try
{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from user where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update user set securityQue='"+securityQue+"',answer='"+newanswer+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
		
	}
	if(check==0)
	{
		response.sendRedirect("changeSecurityQuestion.jsp?msg=notdone");
	}
}
catch(Exception e)
{
	
}

%>