<%@page import="project.connector" %>
<%@page import="java.sql.*"%>
<%
try{
	Connection con=connector.getCon();
	Statement st=con.createStatement();
	String q1="create table user(name varchar(50),email varchar(100)primary key,mobile bigint, securityQue varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
	String q2="create table product(id int primary key, name varchar(500), category varchar(200), price int )";
	String q3="create table cart(email varchar(50),id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobile bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transId varchar(100),status varchar(20))";
	String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
	System.out.print(q3);
	st.execute(q3);
	//st.execute(q1);
	//System.out.print(q2);
	//System.out.print(q1);
	//st.execute(q3);
	//st.execute(q1);
	System.out.print("created");
}
catch(Exception e){
	System.out.print(e);
}

 %>