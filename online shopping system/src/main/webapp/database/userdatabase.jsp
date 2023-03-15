<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String securityQue=request.getParameter("securityQue");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
try{
	Connection con=connector.getCon();
	PreparedStatement ps=con.prepareStatement("insert into usreb values(?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,mobile);
	ps.setString(4,securityQue);
	ps.setString(5,answer);
	ps.setString(6,password);
	ps.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}
%>