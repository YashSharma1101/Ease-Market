
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import sun.awt.shell.Win32ShellFolder2.SystemIcon;*/

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/UserHome")
public class UserHome extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		/* String unm=(String)session.getAttribute("unm"); */
		String email = (String) session.getAttribute("uid");
		/*
		 * try { Class.forName("com.mysql.jdbc.Driver"); Connection
		 * con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720",
		 * "root","root"); String qr="select name from user where email=?";
		 * PreparedStatement ps=con.prepareStatement(qr); ps.setString(1,
		 * email); ResultSet rs=ps.executeQuery(); if(rs.next())
		 */ {
			String unm = (String) session.getAttribute("uid");
			out.println("<center> <head> <title>ShopZone</title> </head> </center>");
			out.println("<center> <h1> welcome " + unm + " </h1> </center>");
			out.println("<center> <h1> welcome " + email + " </h1> </center>");
			out.println("</br></br>" + "<style> "
					+ "a{text-decoration:none; color:cyan; background-color:black; font-size:16px; }"
					+ " h1{font-size:30px;}" + "</style>" + "<title>UserHome</title>" + " <center>"
					+ " <a href=Logout>Logout</a> <br>" + " <a href=DeleteAccount.html>Delete Your Account</a> "
					+ "</br> <a href='ChangePassword1.html'>Change Password</a> </br></br> " + "</center>");
		}
	}

}
