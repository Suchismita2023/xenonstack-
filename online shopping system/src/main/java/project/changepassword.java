package project;

import java.io.IOException;
import java.sql.*;
import project.connector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class changepassword
 */
@WebServlet("/changepassword")
public class changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String securityQue=request.getParameter("securityQue");
		String answer=request.getParameter("answer");
		String newpassword=request.getParameter("newpassword");
		int check=0;
		try
		{
			Connection con=connector.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and mobile='"+mobile+"' and securityQue='"+securityQue+"' and answer='"+answer+"'");
			while(rs.next())
			{
				check=1;
				HttpSession session=request.getSession();
				session.setAttribute("email", email);
				//st.executeUpdate("update user set password='"+newpassword+"' where email='"+email+"'");
				response.sendRedirect("setpassword.jsp");
				
			}
			if(check==0)
			{
				response.sendRedirect("forgotPassword.jsp?msg=notdone");
			}
		}
		catch(Exception e)
		{
			System.out.print(e);
			response.sendRedirect("forgotPassword.jsp?msg=notdone");
		}
		
		// TODO Auto-generated method stub
	}

}
