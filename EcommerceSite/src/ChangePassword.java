

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
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720","root","root");
			String qr="update user set pwd=? where email=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, pwd);
			ps.setString(2, email);
			int i=ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("UserHome");
			rd.include(request, response);
			if(i>0)
			{
				out.println("<script>window.alert('Your Account Password Changed Sucessfully ');</script>");
			}
			else{
				
				out.println("<center>Please Enter Correct Email  </center>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
	}

}
