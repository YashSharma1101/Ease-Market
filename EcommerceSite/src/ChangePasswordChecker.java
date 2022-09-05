

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
 * Servlet implementation class ChangePasswordChecker
 */
@WebServlet("/ChangePasswordChecker")
public class ChangePasswordChecker extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String unm=request.getParameter("unm");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720","root","root");
			String qr="select * from user where email=? and pwd=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1 , email);
			ps.setString(2 , pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				//session.setAttribute("uid", unm);
				response.sendRedirect("ChangePasswordChecker.html");
				
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("ChangePassword.html");
				rd.include(request, response);
				out.println("<script>window.alert('Invalid Email / Password');</script>");
			}

			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
		
	}

}
