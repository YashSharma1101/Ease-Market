

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String pid=request.getParameter("pid");
		String name=request.getParameter("name");
		String p=request.getParameter("price");
		int price=Integer.parseInt(p);
		String cat=request.getParameter("cat");
		String cmp=request.getParameter("cmp");
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("uid");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720","root","root");
			String qr="insert into cart values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, pid);
			ps.setString(2, name);
			ps.setInt(3, price);
			ps.setString(4, cat);
			ps.setString(5, cmp);
			ps.setString(6, email);
			int i=ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("UserHome.jsp");
			rd.include(request, response);
			if(i>0)
			{
				out.println("<script>window.alert('sucessfully added to cart');</script>");
			}
			else
			{
				out.println("<script>window.alert('Product not added to cart');</script>");
			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
	}

}
