<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try
{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and id='"+id+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
	
}
catch(Exception e)
{
	System.out.println(e);	
}
%>