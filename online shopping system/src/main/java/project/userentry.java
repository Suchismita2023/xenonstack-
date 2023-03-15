package project;

import java.io.IOException;
import project.connector;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userentry
 */
@WebServlet("/userentry")
public class userentry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String securityQue=request.getParameter("securityQue");
		String answer=request.getParameter("answer");
		String password=request.getParameter("password");
		String address="";
		String city="";
		String state="";
		String country="";
		try{
			Connection con=connector.getCon();
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,mobile);
			ps.setString(4,securityQue);
			ps.setString(5,answer);
			ps.setString(6,password);
			ps.setString(7,address);
			ps.setString(8,city);
			ps.setString(9,state);
			ps.setString(10,country);
			ps.executeUpdate();
			response.sendRedirect("signup.jsp?msg=valid");
		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("signup.jsp?msg=invalid");
			
		}
	}

}
