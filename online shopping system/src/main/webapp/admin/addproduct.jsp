<%@page import="project.connector"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");

try
{
	Connection con=connector.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, category);
	ps.setString(4, price);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
	
}
catch(Exception e)
{
	response.sendRedirect("addNewProduct.jsp?msg=notdone");
}

%>