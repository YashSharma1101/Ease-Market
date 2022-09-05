

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
@WebServlet("/test")
public class test extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		String pwd2=request.getParameter("pwd2");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720","root","root");
			//String qr="select * from user where pwd=?";
			String qr1="update user set pwd2=pwd where email=?";
			//PreparedStatement ps=con.prepareStatement(qr);
			//ps.setString(1 , pwd);
			//ps.executeQuery(qr);
			PreparedStatement ps1=con.prepareStatement(qr1);
			ps1.setString(1 , email);
			//ps1.addBatch();
	        ps1.executeUpdate();
	        ResultSet rs = ps1.executeQuery(qr1);
			if(rs.next())
			{
				
/*				response.sendRedirect("ChangePasswordChecker.html");*/
				RequestDispatcher rd=request.getRequestDispatcher("UserHome");
				rd.include(request, response);
				out.println("<script>window.alert('Your Account Password Changed Sucessfully ');</script>");

			}	
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("UserHome.html");
				rd.include(request, response);
				out.println("<script>window.alert('Enter Correct Email/Password');</script>");
			}

			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
		
	}

}
