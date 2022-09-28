<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<style>
h3 {
	align: center;
}

#f2 {
	text-decoration: none;
	color: black;
	font-size: 30px;
	background-color: cyan;
	border: 2px solid white;
	border-color: yellow;
	border-radius: 10px;
	padding: 5px 10px;
	margin: 10px 20px;
}

* {
	box-sizing: border-box;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.logo {
	margin: 0;
	font-size: 1.45em;
}

.main-nav {
	margin-top: 5px;
}

.logo a, .main-nav a {
	padding: 10px 15px;
	text-transform: uppercase;
	text-align: center;
	display: block;
}

.main-nav a {
	color: #34495e;
	font-size: .99em;
}

.main-nav a:hover {
	color: #718daa;
}

.header {
	padding-top: .5em;
	padding-bottom: .5em;
	border: 1px solid #a2a2a2;
	background-color: #f4f4f4;
	-webkit-box-shadow: 0px 0px 14px 0px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 0px 0px 14px 0px rgba(0, 0, 0, 0.75);
	box-shadow: 0px 0px 14px 0px rgba(0, 0, 0, 0.75);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

/* ================================= 
  Media Queries
==================================== */
@media ( min-width : 769px) {
	.header, .main-nav {
		display: flex;
	}
	.header {
		flex-direction: column;
		align-items: center; . header { width : 80%;
		margin: 0 auto;
		max-width: 1150px;
	}
}

}
@media ( min-width : 1025px) {
	.header {
		flex-direction: row;
		justify-content: space-between;
	}
	.dropdown-menu li {
		position: relative;
	}
	.dropdown-menu .dropdown-submenu {
		display: none;
		position: absolute;
		left: 100%;
		top: -7px;
	}
	.dropdown-menu .dropdown-submenu-left {
		right: 100%;
		left: auto;
	}
	.dropdown-menu>li:hover>.dropdown-submenu {
		display: block;
	}
	.dropdown-hover:hover>.dropdown-menu {
		display: inline-block;
	}
	.dropdown-hover>.dropdown-toggle:active {
		/*Without this, clicking will make it sticky*/
		pointer-events: none;
	}
}
</style>


<!DOCTYPE html>
<html lang="en">
<head>
<title>ShopZone</title>
<link rel="shortcut icon"
	href="https://i.postimg.cc/gcKQJqW0/Sz-1-11.png" type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<header class="header">
	<div class="navbar-header">
		<a class="brand navbar-brand" href="UserAboutus.jsp"><img
			src="https://i.postimg.cc/KzggK034/Sz-1.png" style="width: 80px;"
			alt=""></a><b style="color:black; font-family: Trebuchet MS; font-size: 23px; text-shadow: 0 0 12px darkblue;">SHOPZONE</b>
		<!-- <h1 class="logo">ShopZone</h1> -->
	</div>
	<ul class="main-nav">
		<li><div class="btn-group" role="group">
				<button id="btnGroupDrop1" type="button"
					class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">More Options</button>
				<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
					<a class="dropdown-item" href="edituserprofile.jsp">Edit
						Profile</a> <a class="dropdown-item" href="ViewCart.jsp">View Cart</a>
					<a class="dropdown-item" href="ChangeUserHomePassword.html">Change
						Account Password</a> <a class="dropdown-item"
						href="DeleteAccount.html">Delete Your Account</a> <a
						class="dropdown-item" href="Logout">Logout</a> <a
						class="dropdown-item" href="UserAboutus.jsp">About us</a>
				</div></li>
		<li><a href="UserHome.jsp" id="f1">Home</a></li>
		<li><a href="edituserprofile.jsp" id="f1">Edit Profile</a></li>
		<!-- <li><a href="DeleteAccount.html" id="f1">Delete Account</a></li> -->

	</ul>
</header>
<center>
	</br>
	<h1>Your Cart</h1>
	<%
		String email = (String) session.getAttribute("uid");
	%>
	<%="Welcome " + email%></br>

</center>
<div class="container-fluid">
	<div class="row">
		<%@include file="db.jsp"%>
		<%
			int total = 0;
			String qr = "select * from cart where email=?";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				do {
					String pid = rs.getString("pid");
					String name = rs.getString("name");
					int price = rs.getInt("price");
					String cat = rs.getString("cat");
					String cmp = rs.getString("cmp");
					total = total + price;
		%>
		<div class="col-sm-3">
			<div class="card" style="width: 300px">
				<img class="card-img-top"
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpEU4luJM7bxXlmZYgSzdaxh_tPBeegc8Plg&usqp=CAU"
					style="width: 100%">
				<div class="card-body">
					<center>
						<h4 class="card-title"><%=name%></h4>
						<p class="card-text">
							Category :
							<%=cat%>
							| Company :
							<%=cmp%></br> Price :<b> <%=price%></b>
					</center>
					</p>
				</div>
				<a href="CartDelete?pid=<%=pid%>" class="btn btn-link">Remove
					From Cart</a> <a href="Payment.jsp"
					class="btn btn-info">Buy <%=name%></a>
			</div>

		</div>
		<%
			} while (rs.next());
			} else {
		%>
		<h3 align="center">Your Cart is Empty</h3>
		<%
			}
		%>

	</div>
	<h4 align="center">
		Total Amount Is
		<%=total%></h4>
	<center>
		<a href="https://www.paypal.com/in/signin"
			class="btn btn-danger form-control" style="width: 150px">Check
			Out All</a> <a href="UserHome.jsp" id="f1" class="btn btn-primary">Back
			to Home</a>

	</center>
</div>

</body>
</html>
