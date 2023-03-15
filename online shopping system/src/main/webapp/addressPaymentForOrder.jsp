<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };  
</script> 
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
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
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i>  <%=rs.getString(4) %></td>
            <td> <%=rs.getString(7) %> </td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(9) %> </td>
            </tr>
            <%} 
            ResultSet rs2=st.executeQuery("select *from user where email='"+email+"'");
            while(rs2.next())
            {
            %>
         
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addpayment.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs2.getString(7) %>" placeholder="enter address" required >
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(8) %>" placeholder="enter city" required >
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(9) %>" placeholder="enter state" required >
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(10) %>" placeholder="enter country" required >
</div>

<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentMethod">
 <option value="cod"> Cash on Delivery(CoD)</option>
 <option value="online"> online Payment</option> </select>
</div>

<div class="right-div">
<h3>Pay online on this onine_shopping@pay.com</h3>
<input class="input-style" type="text" name="transId" placeholder="enter Transaction Id">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobile" value="<%=rs2.getString(3) %>" placeholder="enter mobile number" required >
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Procced to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
            }
}
catch(Exception e)
{
	System.out.print(e);
}
%>

      <br>
      <br>
      <br>

</body>
</html>