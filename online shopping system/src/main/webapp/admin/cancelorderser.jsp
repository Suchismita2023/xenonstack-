<%@page import="project.connector" %>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String orderDate=request.getParameter("orderDate");
String status="Canceled";

try
{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where id='"+id+"' and email='"+email+"' and orderDate='"+orderDate+"' and address is NOT NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}

%>