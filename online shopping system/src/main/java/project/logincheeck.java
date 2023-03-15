package project;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class logincheeck
 */
@WebServlet("/logincheeck")
public class logincheeck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		if("admin@gmail.com".equals(email) && "admin".equals(password))
		{
			HttpSession session=request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("admin/adminHome.jsp");
			
		}
		else {
			int z=0;
			try
			{
				Connection con=connector.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'" );
				while(rs.next())
				{
					z=1;
					HttpSession session=request.getSession();
					session.setAttribute("email", email);
					response.sendRedirect("home.jsp");
				}
				if(z==0)
				{
					response.sendRedirect("login.jsp?msg=notexist");
				}
			}
			catch(Exception e)
			{
				System.out.print(e);
				response.sendRedirect("logn.jsp?msg=invalid");
			}
		}
		
		
				// TODO Auto-generated method stub
	}

}

