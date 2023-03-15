package project;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addNewProductser
 */
@WebServlet("/addNewProductser")
public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			response.sendRedirect("admin/addNewProduct.jsp?msg=done");
			
		}
		catch(Exception e)
		{
			response.sendRedirect("admin/addNewProduct.jsp?msg=notdone");
		}
		
		// TODO Auto-generated method stub
	}

}
