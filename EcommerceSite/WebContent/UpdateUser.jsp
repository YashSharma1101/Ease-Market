<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<%
String email=request.getParameter("email");
String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");
	String qr="update user set unm=?,pwd=? where email=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, unm);
	ps.setString(2, pwd);
	ps.setString(3, email);
	int i=ps.executeUpdate();
		%><script>window.alert('Invalid id and password')</script>
		<jsp:forward page="UserHome.jsp"></jsp:forward>
<%
	con.close();
%>
<!-- <script>window.alert('Profile Updated');</script> -->
