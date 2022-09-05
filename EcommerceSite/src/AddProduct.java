

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String pid=request.getParameter("pid");
		String name=request.getParameter("name");
		String p=request.getParameter("price");
		int price=Integer.parseInt(p);
		String cmp=request.getParameter("cmp");
		String cat=request.getParameter("cat");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720","root","root");
			String qr="insert into product values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, pid);
			ps.setString(2, name);
			ps.setInt(3, price);
			ps.setString(4, cmp);
			ps.setString(5, cat);
			int i=ps.executeUpdate();
			if(i>0)
			{
				out.println("Product Added Id No: "+pid);
			}
			else
			{
				out.println("Product Not Added");
			}
		} catch (Exception e) {
			out.println(e);
		}
				
	}

}
