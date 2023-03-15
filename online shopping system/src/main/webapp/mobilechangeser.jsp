<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");
int check=0;

try
{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update user set mobile='"+mobile+"' where email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("changeMobileNumber.jsp?msg=notdone");
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>