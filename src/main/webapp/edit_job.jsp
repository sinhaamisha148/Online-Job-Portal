<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entities.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java"%>
<%@ page import="java.lang.Integer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Jobs</title>
<%@include file="all_components/myCSS.jsp"%>
</head>
<body style="background-color: #bfccd9;">
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
				<a href="edit_job.jsp" class="btn btn-light mr-1"><i
					class="fa fa-user"></i>Admin</a> <a href="logoutServlet"
					class="btn btn-light"><i class="fa fa-sign-in-alt"></i>LogOut</a>
			</form>
		</div>
	</nav>

	<%--end of navbar --%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<%-- <%@include file="all_components/msg.jsp" %>--%>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDAO dao = new JobDAO(DBConnect.getConn());
						Jobs j = dao.getJobById(id);
						%>

						<h5>Edit Jobs</h5>
					</div>

					<form action="UpdateJobServlet" method="post">
						<input type="hidden" value="<%=j.getId()%>" name="id">

						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>">
						</div>

						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label><select name="Location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>">
										<%=j.getLocation()%></option>
									<option value="BANGALORE">BANGALORE</option>
									<option value="BHUBANESWAR">BHUBANESWAR</option>
									<option value="GUJURAT">GUJURAT</option>
									<option value="DELHI">DELHI</option>
									<option value="HYDRABAD">"HYDRABAD"</option>
									<option value="CHENNAI">"CHENNAI"</option>
									<option value="MUMBAI">MUMBAI</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label><select class="custom-select"
									id="inlineFormCustomSelectPref" name="category">
									<option value="<%=j.getCategory()%>">
										<%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label><select class="form-control" name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"><%=j.getDescription()%></textarea>
						</div>
						<button class="btn btn-success">Update Job</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>