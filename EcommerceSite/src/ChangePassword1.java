
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

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ChangePassword1")
public class ChangePassword1 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720", "root", "root");
			String qr = "select email from user where email=?";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				response.sendRedirect("ChangePassword1.html");
			} else {

				out.println("<center>Please Enter Correct Email  </center>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
	}

}
