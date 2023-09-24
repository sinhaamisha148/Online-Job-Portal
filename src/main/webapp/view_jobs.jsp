<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entities.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Jobs</title>
<%@include file="all_components/myCSS.jsp"%>
</head>
<body style="background-color: #bfccd9;">
	<%-- <%@include file="all_components/navbar.jsp"%>--%>

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
				<a href="admin.jsp" class="btn btn-light mr-1"><i
					class="fa fa-user"></i>Admin</a> <a href="logoutServlet"
					class="btn btn-light"><i class="fa fa-sign-in-alt"></i>LogOut</a>
			</form>
		</div>
	</nav>

	<%--end of navbar --%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<%@include file="all_components/msg.jsp"%>

				<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation()%>" readonly>

							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>

							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status:<%=j.getStatus()%>" readonly>

							</div>
						</div>
						<h6>
							Publish Date:<%=j.getPdate()%></h6>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="DeleteJobServlet?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>
	
</body>
</html>