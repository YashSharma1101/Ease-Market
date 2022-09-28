
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet("/AdminHome")
public class AdminHome extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String unm = request.getParameter("unm");
		String pwd = request.getParameter("pwd");
		if (unm.equals("Yash") || unm.equals("admin@gmail.com")) {
			if (pwd.equals("Yash@1234") || pwd.equals("admin1234")) {
				response.sendRedirect("AdminHome.html");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.html");
				rd.include(request, response);
				out.println("<script>window.alert('Invalid Password');</script>");
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.html");
			rd.include(request, response);
			out.println("<script>window.alert('Invalid Admin Id');</script>");
		}
	}

}
