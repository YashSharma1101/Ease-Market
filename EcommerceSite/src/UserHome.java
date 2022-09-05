

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/UserHome")
public class UserHome extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("uid");
		//String unm=(String) session.getAttribute("uid");
		out.println("<center> <h1> welcome "+email+" </h1> </center>");
		out.println("</br></br>"
				+ "<style> "
				+ "a{text-decoration:none; color:cyan; background-color:black; font-size:16px; }"
				+ " h1{font-size:30px;}"
				+ "</style>"
				+ "<title>UserHome</title>"
				+ " <center>"
				+ " <a href=Logout>Logout</a> <br>"
				+ " <a href=DeleteAccount.html>Delete Your Account</a> "
				+ "</br> <a href='ChangePassword.html'>Change Password</a> </br></br> "
				+ "</center>");
	}
}







