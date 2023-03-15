<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<%
String msg=request.getParameter("msg");
if("notdone".equals(msg))
		{
	%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%if("dec".equals(msg))
	{
	%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<% if("removed".equals(msg))
{%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;

try
{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}



%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
            <%if(total>0){ %>
            <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
            <%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Photo</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next())
      {
      %>
          <tr>
			<%sno=sno+1; %>
           <td><%out.println(sno);%></td>
           <td><img src="images/p<%=rs.getString(1)%>.jpg" height=40px width=50px></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td><a href="incdec.jsp?id=<%=rs.getString(1)%> &quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(7) %> <a href="incdec.jsp?id=<%=rs.getString(1)%> &quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(9) %> </td>
            <td><a href="removecart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
      }
      if(sno==0){
      %>
      <tr>
           <td></td>
            <td></td>
            <td colspan="4"><marquee><h1><b>Cart is Empty</b></h1></marquee></td>
            <td></td>
            <td></td>
          </tr>
      <%
      }
      }
      catch(Exception e)
      {
      } 
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>