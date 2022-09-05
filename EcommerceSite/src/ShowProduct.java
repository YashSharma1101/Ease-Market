

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/ShowProduct")
public class ShowProduct extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.println("<table align=center border=1px >");
		out.println("<th>Product_Id</th>");
		out.println("<th>Name</th>");
		out.println("<th>Price</th>");
		out.println("<th>Category</th>");
		out.println("<th>Company</th>");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ad720","root","root");
			String qr="select * from product";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qr);
			if(rs.next())
			{
				do
				{
					String pid=rs.getString("pid");
					String name=rs.getString("name");
					int price=rs.getInt("price");
					String cat=rs.getString("cat");
					String cmp=rs.getString("cmp");
					out.println("<tr>");
					out.println("<form action='UpdateProduct'>");
					out.println("<td>");
					out.println(pid+"<input type=hidden name=pid value="+pid+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=name value="+name+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=number name=price value="+price+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=cat value="+cat+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=cmp value="+cmp+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=submit value=Update />");
					out.println("</td>");
					out.println("<td>");
					out.println("<a href=DeleteProduct?pid="+pid+">Delete</a>");
					out.println("</td>");
					out.println("</form>");
					out.println("</tr>");
				}while(rs.next());
			}
			else
			{
				out.println("no records found");
			}
			con.close();
			out.println("</table>");
		}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
