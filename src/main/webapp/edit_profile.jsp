<%@page import="com.entities.User"%>
<%
User u2 = (User) session.getAttribute("userObj");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile Page</title>
<%@include file="all_components/myCSS.jsp"%>
</head>
<body style="background-color: #bfccd9;">
	<%-- <%@include file="all_components/navbar.jsp" %>--%>

	<%--navbar start --%>
	
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

				<%-- <li class="nav-item"><a class="nav-link" href="add_jobs.jsp"><i
						class="fa fa-plus-circle"></i>Post Job</a></li>
				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
						class="fa fa-eye"></i>View Job</a></li>--%>



			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="edit_profile.jsp" class="btn btn-light mr-1"><i
					class="fa fa-user"></i><%=u2.getName() %></a> <a href="logoutServlet"
					class="btn btn-light"><i class="fa fa-sign-in-alt"></i>LogOut</a>
			</form>
		</div>
	</nav>
	
	<%--navbar end --%>

	<div class="continer-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>

							<h5>Edit Profile</h5>
						</div>

						<form action="UpdateProfileServlet" method="post">
							<input type="hidden" name="id" value="<%=u2.getId()%>" >
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="name" value="<%=u2.getName()%>">
							</div>

							<div class="form-group">
								<label>Enter Qualification</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="qua" value="<%=u2.getQualification()%>">
							</div>

							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email" value="<%=u2.getEmail()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" required="required" class="form-control"
									id="exampleInputPassword1" aria-describedby="emailHelp"
									name="ps" value="<%=u2.getPassword()%>">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>