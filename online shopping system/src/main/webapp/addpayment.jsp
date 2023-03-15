<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobile=request.getParameter("mobile");
String paymentMethod=request.getParameter("paymentMethod");
String transId="";
transId=request.getParameter("transId");
String status="bill";

try
{
	Connection con=connector.getCon();
	PreparedStatement ps=con.prepareStatement("update user set address=?,city=?,state=?,country=?,mobile=? where email=?");
	ps.setString(1, address);
	ps.setString(2, city);
	ps.setString(3, state);
	ps.setString(4, country);
	ps.setString(5, mobile);
	ps.setString(6, email);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobile=?,orderDate=Now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transID=?,status=? where email=? and address is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,country);
	ps1.setString(5,mobile);
	ps1.setString(6,paymentMethod);
	ps1.setString(7,transId);
	ps1.setString(8,status);
	ps1.setString(9,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}

%>