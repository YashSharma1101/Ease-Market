
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

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String pid = request.getParameter("pid");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720", "root", "root");
			String qr = "delete from product where pid=?";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, pid);
			int i = ps.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("ShowProduct");
			rd.include(request, response);
			if (i > 0) {
				out.println("<script>window.alert('Product" + pid + "deleted');</script>");
				/*
				 * out.println("product deleted id no"+pid);
				 */ } else {
				out.println("product not deleted");
			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
	}

}
