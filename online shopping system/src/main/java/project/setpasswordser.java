package project;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class setpasswordser
 */
@WebServlet("/setpasswordser")
public class setpasswordser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String newpassword=request.getParameter("newpassword");
		String repassword=request.getParameter("repassword");
		int check=0;
		
		try
		{
			if(newpassword.equals(repassword)) {
				Connection con=connector.getCon();
				Statement st=con.createStatement();
				check=1;
				st.executeUpdate("update user set password='"+newpassword+"' where email='"+email+"'");
				response.sendRedirect("login.jsp");
			}
			else
			{
				response.sendRedirect("setpassword.jsp?msg=wrong");
			}
			
		}
		catch(Exception e)
		{
			response.sendRedirect("setpassword.jsp?msg=invalid");
		}
		// TODO Auto-generated method stub
	}

}
