<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<style>
body {
	margin-top: 150px;
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
	z-index: 10000;
}

.main-nav {
	margin-top: 5px;
	z-index: 10000;
}

.logo a, .main-nav a {
	padding: 10px 15px;
	text-transform: uppercase;
	text-align: center;
	display: block;
	z-index: 10000;
}

.main-nav a {
	color: #34495e;
	font-size: .99em;
	z-index: 10000;
}

.main-nav a:hover {
	color: #718daa;
	z-index: 10000;
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
	z-index: 10000;
	position: fixed;
	top: 0;
	width: 100%;
}

@media ( min-width : 769px) {
	.header, .main-nav {
		display: flex;
		z-index: 10000;
	}
	.header {
		flex-direction: column;
		align-items: center; . header { width : 80%;
		margin: 0 auto;
		max-width: 1150px;
		z-index: 10000;
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
		pointer-events: none;
	}
}
</style>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
			alt=""></a><b
			style="color: #f5e7c6; font-family: Trebuchet MS; font-size: 23px; text-shadow: 0 0 12px darkblue;">SHOPZONE</b>
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
		<li><a href="Logout" id="f1"> </a></li>
		<li><a href="edituserprofile.jsp" id="f1">EditProfile</a></li>
		<li><a href="Logout" id="f1">Logout</a></li>
	</ul>
</header>
</br>
<center>
	</br> </br> </br> </br> </br>
	<h1>Welcome</h1>
	<%
		String email = (String) session.getAttribute("uid");
	%>
	<%=email%></br> </br> View Cart <a href="ViewCart.jsp"> <img
		src="https://www.freeiconspng.com/thumbs/cart-icon/basket-cart-icon-27.png"
		height="30px" width="30px" />
	</a> </br>
	<center>
		<ul class="main-nav">
			<li><div class="btn-group" role="group">
	</center>
	<button id="btnGroupDrop1" type="button"
		class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
		aria-haspopup="true" aria-expanded="false">All Products</button>
	<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">


		<li><a class="dropdown-item" href="#">Man's Fashion&raquo; </a>
			<ul class="dropdown-menu dropdown-submenu">
				<li><a class="dropdown-item" href="#">Clothing&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shirt</a></li>
						<li><a class="dropdown-item" href="#">Hoodies &
								Sweatshirts</a></li>
						<li><a class="dropdown-item" href="#">Sweaters</a></li>
						<li><a class="dropdown-item" href="#">Jeans</a></li>
						<li><a class="dropdown-item" href="#">Pants</a></li>
						<li><a class="dropdown-item" href="#">Shorts</a></li>
						<li><a class="dropdown-item" href="#">Socks</a></li>
						<li><a class="dropdown-item" href="#">T-Shirts</a></li>
						<li><a class="dropdown-item" href="#">Jakets & Coats</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Shoes&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Athletic</a></li>
						<li><a class="dropdown-item" href="#">Boots</a></li>
						<li><a class="dropdown-item" href="#">Fashion Sneakers</a></li>
						<li><a class="dropdown-item" href="#">Loafers</a></li>
						<li><a class="dropdown-item" href="#">Mules</a></li>
						<li><a class="dropdown-item" href="#">Outdoor</a></li>
						<li><a class="dropdown-item" href="#">Sandals</a></li>
						<li><a class="dropdown-item" href="#">Slippers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Watches&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Wrist Watches</a></li>
						<li><a class="dropdown-item" href="#">Watch Bands</a></li>
						<li><a class="dropdown-item" href="#">Pocket Watches</a>
						<li><a class="dropdown-item" href="#">SmartWatches</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Accessories&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Belt</a></li>
						<li><a class="dropdown-item" href="#">Hats & Caps</a></li>
						<li><a class="dropdown-item" href="#">Keyrings &
								Keychains</a></li>
						<li><a class="dropdown-item" href="#">Sport Headbands</a></li>
						<li><a class="dropdown-item" href="#">Sunglasses</a></li>
						<li><a class="dropdown-item" href="#">Ties & Cummerbunds</a></li>
						<li><a class="dropdown-item" href="#">Wallet & Money
								Organizers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Boy's Fashion&raquo;
				</a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shop Clothing</a></li>
						<li><a class="dropdown-item" href="#">Shoes</a></li>
						<li><a class="dropdown-item" href="#">Watches</a></li>
						<li><a class="dropdown-item" href="#">Accessories</a></li>
						<li><a class="dropdown-item" href="#">Uniforms</a></li>
					</ul></li>
			</ul></li>


		<li><a class="dropdown-item" href="#">ElectronicGadgets&raquo;
		</a>
			<ul class="dropdown-menu dropdown-submenu">
				<li><a class="dropdown-item" href="#">Laptops&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Dell</a></li>
						<li><a class="dropdown-item" href="#">HP</a></li>
						<li><a class="dropdown-item" href="#">Asus</a></li>
						<li><a class="dropdown-item" href="#">Acer</a></li>
						<li><a class="dropdown-item" href="#">Lenevo</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Tablets&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Apple</a></li>
						<li><a class="dropdown-item" href="#">Realme</a></li>
						<li><a class="dropdown-item" href="#">Lenevo</a></li>
						<li><a class="dropdown-item" href="#">Samsung</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="MobileFilter.html">Mobile&raquo;
				</a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Xaomi</a></li>
						<li><a class="dropdown-item" href="#">Samsung</a></li>
						<li><a class="dropdown-item" href="#">Apple</a>
						<li><a class="dropdown-item" href="#">Realme</a></li>
						<li><a class="dropdown-item" href="#">Oppo</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Earphones &
						Headphones&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Boat</a></li>
						<li><a class="dropdown-item" href="#">Bose</a></li>
						<li><a class="dropdown-item" href="#">Sony</a></li>
						<li><a class="dropdown-item" href="#">SoundCore</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Watches&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">TicWatch</a></li>
						<li><a class="dropdown-item" href="#">Realme</a></li>
						<li><a class="dropdown-item" href="#">AmazFit</a></li>
						<li><a class="dropdown-item" href="#">Fossil</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Telivision&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">LG</a></li>
						<li><a class="dropdown-item" href="#">Sony</a></li>
						<li><a class="dropdown-item" href="#">Realme</a></li>
						<li><a class="dropdown-item" href="#">Redmi</a></li>
					</ul></li>
			</ul></li>


		<li><a class="dropdown-item" href="#">Women's Fashion&raquo;
		</a>
			<ul class="dropdown-menu dropdown-submenu">
				<li><a class="dropdown-item" href="#">Clothing&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shirt</a></li>
						<li><a class="dropdown-item" href="#">Hoodies &
								Sweatshirts</a></li>
						<li><a class="dropdown-item" href="#">Sweaters</a></li>
						<li><a class="dropdown-item" href="#">Jeans</a></li>
						<li><a class="dropdown-item" href="#">Pants</a></li>
						<li><a class="dropdown-item" href="#">Shorts</a></li>
						<li><a class="dropdown-item" href="#">Socks</a></li>
						<li><a class="dropdown-item" href="#">T-Shirts</a></li>
						<li><a class="dropdown-item" href="#">Jakets & Coats</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Shoes&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Athletic</a></li>
						<li><a class="dropdown-item" href="#">Boots</a></li>
						<li><a class="dropdown-item" href="#">Fashion Sneakers</a></li>
						<li><a class="dropdown-item" href="#">Loafers</a></li>
						<li><a class="dropdown-item" href="#">Mules</a></li>
						<li><a class="dropdown-item" href="#">Outdoor</a></li>
						<li><a class="dropdown-item" href="#">Sandals</a></li>
						<li><a class="dropdown-item" href="#">Slippers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Watches&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Wrist Watches</a></li>
						<li><a class="dropdown-item" href="#">Watch Bands</a></li>
						<li><a class="dropdown-item" href="#">Pocket Watches</a>
						<li><a class="dropdown-item" href="#">SmartWatches</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Accessories&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Belt</a></li>
						<li><a class="dropdown-item" href="#">Hats & Caps</a></li>
						<li><a class="dropdown-item" href="#">Keyrings &
								Keychains</a></li>
						<li><a class="dropdown-item" href="#">Sport Headbands</a></li>
						<li><a class="dropdown-item" href="#">Sunglasses</a></li>
						<li><a class="dropdown-item" href="#">Ties & Cummerbunds</a></li>
						<li><a class="dropdown-item" href="#">Wallet & Money
								Organizers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Boy's Fashion&raquo;
				</a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shop Clothing</a></li>
						<li><a class="dropdown-item" href="#">Shoes</a></li>
						<li><a class="dropdown-item" href="#">Watches</a></li>
						<li><a class="dropdown-item" href="#">Accessories</a></li>
						<li><a class="dropdown-item" href="#">Uniforms</a></li>
					</ul></li>
			</ul></li>

		<li><a class="dropdown-item" href="#">Art & Crafts&raquo; </a>
			<ul class="dropdown-menu dropdown-submenu">
				<li><a class="dropdown-item" href="#">Painting &
						Drawing&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shirt</a></li>
						<li><a class="dropdown-item" href="#">Hoodies &
								Sweatshirts</a></li>
						<li><a class="dropdown-item" href="#">Sweaters</a></li>
						<li><a class="dropdown-item" href="#">Jeans</a></li>
						<li><a class="dropdown-item" href="#">Pants</a></li>
						<li><a class="dropdown-item" href="#">Shorts</a></li>
						<li><a class="dropdown-item" href="#">Socks</a></li>
						<li><a class="dropdown-item" href="#">T-Shirts</a></li>
						<li><a class="dropdown-item" href="#">Jakets & Coats</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Art Supplies&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Athletic</a></li>
						<li><a class="dropdown-item" href="#">Boots</a></li>
						<li><a class="dropdown-item" href="#">Fashion Sneakers</a></li>
						<li><a class="dropdown-item" href="#">Loafers</a></li>
						<li><a class="dropdown-item" href="#">Mules</a></li>
						<li><a class="dropdown-item" href="#">Outdoor</a></li>
						<li><a class="dropdown-item" href="#">Sandals</a></li>
						<li><a class="dropdown-item" href="#">Slippers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Crafting &raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Wrist Watches</a></li>
						<li><a class="dropdown-item" href="#">Watch Bands</a></li>
						<li><a class="dropdown-item" href="#">Pocket Watches</a>
							&raquo;
						<li><a class="dropdown-item" href="#">SmartWatches</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Printmaking &
						Decorating&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Belt</a></li>
						<li><a class="dropdown-item" href="#">Hats & Caps</a></li>
						<li><a class="dropdown-item" href="#">Keyrings &
								Keychains</a></li>
						<li><a class="dropdown-item" href="#">Sport Headbands</a></li>
						<li><a class="dropdown-item" href="#">Sunglasses</a></li>
						<li><a class="dropdown-item" href="#">Ties & Cummerbunds</a></li>
						<li><a class="dropdown-item" href="#">Wallet & Money
								Organizers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Gift Wrapping
						Suppliess&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shop Clothing</a></li>
						<li><a class="dropdown-item" href="#">Shoes</a></li>
						<li><a class="dropdown-item" href="#">Watches</a></li>
						<li><a class="dropdown-item" href="#">Accessories</a></li>
						<li><a class="dropdown-item" href="#">Uniforms</a></li>
					</ul></li>
			</ul></li>

		<li><a class="dropdown-item" href="#">Computers&raquo;</a>
			<ul class="dropdown-menu dropdown-submenu">
				<li><a class="dropdown-item" href="#">Computer
						Accessories&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shirt</a></li>
						<li><a class="dropdown-item" href="#">Hoodies &
								Sweatshirts</a></li>
						<li><a class="dropdown-item" href="#">Sweaters</a></li>
						<li><a class="dropdown-item" href="#">Jeans</a></li>
						<li><a class="dropdown-item" href="#">Pants</a></li>
						<li><a class="dropdown-item" href="#">Shorts</a></li>
						<li><a class="dropdown-item" href="#">Socks</a></li>
						<li><a class="dropdown-item" href="#">T-Shirts</a></li>
						<li><a class="dropdown-item" href="#">Jakets & Coats</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Data Storage&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Athletic</a></li>
						<li><a class="dropdown-item" href="#">Boots</a></li>
						<li><a class="dropdown-item" href="#">Fashion Sneakers</a></li>
						<li><a class="dropdown-item" href="#">Loafers</a></li>
						<li><a class="dropdown-item" href="#">Mules</a></li>
						<li><a class="dropdown-item" href="#">Outdoor</a></li>
						<li><a class="dropdown-item" href="#">Sandals</a></li>
						<li><a class="dropdown-item" href="#">Slippers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Laptop
						Accessories&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Wrist Watches</a></li>
						<li><a class="dropdown-item" href="#">Watch Bands</a></li>
						<li><a class="dropdown-item" href="#">Pocket Watches</a>
						<li><a class="dropdown-item" href="#">SmartWatches</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Tablet
						Accessories&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Belt</a></li>
						<li><a class="dropdown-item" href="#">Hats & Caps</a></li>
						<li><a class="dropdown-item" href="#">Keyrings &
								Keychains</a></li>
						<li><a class="dropdown-item" href="#">Sport Headbands</a></li>
						<li><a class="dropdown-item" href="#">Sunglasses</a></li>
						<li><a class="dropdown-item" href="#">Ties & Cummerbunds</a></li>
						<li><a class="dropdown-item" href="#">Wallet & Money
								Organizers</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Printers &
						Scanners&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shop Clothing</a></li>
						<li><a class="dropdown-item" href="#">Shoes</a></li>
						<li><a class="dropdown-item" href="#">Watches</a></li>
						<li><a class="dropdown-item" href="#">Accessories</a></li>
						<li><a class="dropdown-item" href="#">Uniforms</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">External
						Components&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shop Clothing</a></li>
						<li><a class="dropdown-item" href="#">Shoes</a></li>
						<li><a class="dropdown-item" href="#">Watches</a></li>
						<li><a class="dropdown-item" href="#">Accessories</a></li>
						<li><a class="dropdown-item" href="#">Uniforms</a></li>
					</ul></li>
				<li><a class="dropdown-item" href="#">Networking
						Products&raquo; </a>
					<ul class="dropdown-menu dropdown-submenu">
						<li><a class="dropdown-item" href="#">Shop Clothing</a></li>
						<li><a class="dropdown-item" href="#">Shoes</a></li>
						<li><a class="dropdown-item" href="#">Watches</a></li>
						<li><a class="dropdown-item" href="#">Accessories</a></li>
						<li><a class="dropdown-item" href="#">Uniforms</a></li>
					</ul></li>
			</ul></li>
	</ul>
	</br>
</center>
</br>
</br>
<body>

	<div class="container-fluid">
		<div class="row">
			<%@include file="db.jsp"%>
			<%
				String qr = "select * from product";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(qr);
				if (rs.next()) {
					do {
						String pid = rs.getString("pid");
						String name = rs.getString("name");
						int price = rs.getInt("price");
						String cat = rs.getString("cat");
						String cmp = rs.getString("cmp");
			%>
			<div class="col-sm-3">
				<div class="card" style="width: 350px">
					<!-- <img class="card-img-top" src="https://i0.wp.com/www.gktoday.in/wp-content/uploads/2016/04/Product-in-Marketing.png?w=1140&ssl=1" alt="Card image" style="width:100%"> -->
					<img class="card-img-top"
						src="https://blu-performance.com/wp-content/uploads/1/2016/03/Stock-Available-Soon-Tag.png"
						alt="Card image" style="width: 100%">
					<div class="card-body">
						<center>
							<h4 class="card-title"><%=name%></h4>
							<p class="card-text">
								<br>Category :
								<%=cat%><br>Company Name:
								<%=cmp%></br> Price :<b> <%=price%></b>
							</p>
						</center>
					</div>
					<a href="Payment.jsp" class="btn btn-danger">Buy Now</a> <a
						href="AddCart?pid=<%=pid%>&name=<%=name%>&price=<%=price%>&cat=<%=cat%>&cmp=<%=cmp%>"
						class="btn btn-info">Add to Cart</a>
				</div>
			</div>
			<%
				} while (rs.next());
				} else {
					out.println("NO DATA TO SHOW");
				}
			%>
		</div>
	</div>

</body>
</html>