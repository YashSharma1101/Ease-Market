<style>
body {
	text-align: center;
	background-image:
		url("https://prod-streaming-video-msn-com.akamaized.net/b51e0ffe-ff7a-48a1-8599-805bf90e95e9/5b67fae0-b0ee-4b37-94aa-0b2ac26385ed.mp4");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

#background-video {
	width: 100vw;
	height: 100vh;
	object-fit: cover;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: -1;
}
</style>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ShopZone</title>
</head>
<body>
	<center>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<head>

		</head>
		<body>
			<video id="background-video" autoplay loop muted
				poster="https://prod-streaming-video-msn-com.akamaized.net/b51e0ffe-ff7a-48a1-8599-805bf90e95e9/5b67fae0-b0ee-4b37-94aa-0b2ac26385ed.jpg">
			<source
				src="https://prod-streaming-video-msn-com.akamaized.net/b51e0ffe-ff7a-48a1-8599-805bf90e95e9/5b67fae0-b0ee-4b37-94aa-0b2ac26385ed.mp4"
				type="video/mp4"></video>
			<%@include file="db.jsp"%>
			<%@page errorPage="error.jsp"%>
			<%
				String email = (String) session.getAttribute("uid");
				String qr = "select * from user where email=?";
				PreparedStatement ps = con.prepareStatement(qr);
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String unm = rs.getString("unm");
					String pwd = rs.getString("pwd");
			%>
			<h1>UPDATE YOUR PROFILE</h1>
			<form action="UpdateUser.jsp">

				<input type="hidden" name="email" value="<%=email%>" /></br>
				</br> Update Name : <input type="text" name="unm" value="<%=unm%>" /></br>
				</br> Update Password<input type="password" name="pwd" value="<%=pwd%>" /></br>
				</br> <input type="submit" value="Update" />
				</t>
				</br>
				<button>
					<a href="UserHome.jsp">Home</a>
				</button>
			</form>
			<button>
				<a href="DeleteAccount?email=<%=email%>">Delete Your Account</a>
			</button>
			<a href="ViewCart.jsp">
<img src="https://www.freeiconspng.com/thumbs/cart-icon/basket-cart-icon-27.png" height="30px" width="30px" />
</a>
			<%
				} else {
					out.println("Unable to proceed");
				}
				con.close();
			%>
		
	</center>
</body>
</html>


















