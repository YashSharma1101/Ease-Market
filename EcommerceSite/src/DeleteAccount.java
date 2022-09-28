
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720", "root", "root");
			String qr = "delete from user where email=?";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, email);
			int i = ps.executeUpdate();
			if (i > 0) {
				out.println("<script>window.alert('Your Account Deleted Sucessfully ');</script>");
				// response.sendRedirect("UserSignUp.html");
				RequestDispatcher rd = request.getRequestDispatcher("UserSignUp.html");
				rd.include(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
				rd.include(request, response);
				out.println("<script>window.alert('Account Not Deleted Check Your Email & Try Again');</script>");

			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
	}
}
