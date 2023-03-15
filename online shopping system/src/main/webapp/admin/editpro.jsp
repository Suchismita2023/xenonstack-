<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
try
{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"' where id='"+id+"'");
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=notdone");
}
%>