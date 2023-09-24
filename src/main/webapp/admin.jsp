<%@page import = "com.entities.User" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
User u = (User)session.getAttribute("userObj");
if(u == null){
	session.setAttribute("msg","You are not logged in !! Login First");
	response.sendRedirect("login.jsp");
	return;
}//else{
	//if(!"admin@gmail.com".equals(email) || !"admin".equals(password)){
	//	session.setAttribute("msg","You are not Admin !! Do not access this page");
	//	response.sendRedirect("login.jsp");
	//}
//}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="all_components/myCSS.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/admin.jpg");
	height: 90vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%-- <%@include file="all_components/navbar.jsp" %>--%>

	<%-- navbar---- --%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<a class="navbar-brand" href="#">Job Portal</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<%-- <c:if test="${userObj.role eq 'admin' }">
      
      	
      </c:if>--%>

				<li class="nav-item"><a class="nav-link" href="add_jobs.jsp"><i
						class="fa fa-plus-circle"></i>Post Job</a></li>
				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
						class="fa fa-eye"></i>View Job</a></li>



			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="admin.jsp" class="btn btn-light mr-1"><i class="fa fa-user"></i>Admin</a> 
				<a href="logoutServlet" class="btn btn-light"><i class="fa fa-sign-in-alt"></i>LogOut</a>
			</form>
		</div>
	</nav>
	
	<%--end of navbar --%>
	
	

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white p-4">Welcome Admin</h1>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>