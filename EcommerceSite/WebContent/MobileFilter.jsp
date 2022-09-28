<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ShopZone</title>
<link rel="shortcut icon"
	href="https://i.postimg.cc/gcKQJqW0/Sz-1-11.png" type="image/x-icon">

	<%@include file="db.jsp"%>
			<%
			PrintWriter ot =response.getWriter();
			response.setContentType("text/html");
				String cat=request.getParameter("cat");
				String cmp=request.getParameter("cmp");
				/* String cat=(String) session.getAttribute("cat");
				String cmp=(String) session.getAttribute("cmp"); */
				String qr = "select * from product where cat=? and cmp=?";
				PreparedStatement ps=con.prepareStatement(qr);
				ResultSet rs = ps.executeQuery();
				ps.setString(1, cat); 
				ps.setString(2, cmp); 
				if (rs.next()) {
					do {
						String pid = rs.getString("pid");
						String name = rs.getString("name");
						int price = rs.getInt("price");
		/* 				String cat = rs.getString("cat");
						String cmp = rs.getString("cmp"); */
			%>
			<div class="col-sm-3">
				<div class="card" style="width: 400px">
					<!-- <img class="card-img-top" src="https://i0.wp.com/www.gktoday.in/wp-content/uploads/2016/04/Product-in-Marketing.png?w=1140&ssl=1" alt="Card image" style="width:100%"> -->
					<img class="card-img-top"
						src="https://blu-performance.com/wp-content/uploads/1/2016/03/Stock-Available-Soon-Tag.png"
						alt="Card image" style="width: 100%">
					<div class="card-body">
						<h4 class="card-title"><%=name%></h4>
						<p class="card-text">
							Price :
							<%=price%><br>Category :
							<%=cat%><br>Company Name:
							<%=cmp%></p>
					</div>
					<a href="https://www.paypal.com/in/signin" class="btn btn-danger">Buy
						Now</a> <a href="" class="btn btn-info">Add to Cart</a>
				</div>
			</div>
			<%
				} while (rs.next());
				} else {
					out.println("ERROR NO PRODUCT AVAILABLE");
				}
			%>