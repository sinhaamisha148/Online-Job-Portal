<%@page import="com.entities.User"%>
<%
User u1 = (User)session.getAttribute("userObj");
%>

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
<title>User : View Jobs</title>
<%@include file="all_components/myCSS.jsp"%>
</head>
<body style="background-color: #bfccd9;">
	<%-- <%@include file="all_components/navbar.jsp"%>--%>
	<%--navbar.....--%>

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


				<%-- <li class="nav-item"><a class="nav-link" href="add_jobs.jsp"><i
						class="fa fa-plus-circle"></i>Post Job</a></li>
				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
						class="fa fa-eye"></i>View Job</a></li>--%>



			</ul>
			<%
			if (u1 == null) {
			%>
			<form class="form-inline my-2 my-lg-0">
				<a href="login.jsp" class="btn btn-light mr-1"><i
					class="fa fa-sign-in-alt"></i>Login</a> <a href="signup.jsp"
					class="btn btn-light"><i class="fa fa-user-plus"></i>Signup</a>
			</form>

			<%
			} else {
			%>
			<form class="form-inline my-2 my-lg-0">
				<a href="home.jsp" class="btn btn-light mr-1" data-toggle="modal"
					data-target="#exampleModal"><i class="fa fa-user"></i><%=u1.getName()%></a>
				<a href="logoutServlet" class="btn btn-light"><i
					class="fa fa-sign-in-alt"></i>LogOut</a>
			</form>
			<%
			}
			%>


		</div>
	</nav>

	<%--end of navbar... --%>

	<%--start of profile --%>

	<!-- Button trigger modal -->
	<!--  <button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">Launch demo modal</button>-->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="text-center text-primary">
							<i class="fas fa-user-circle fa-3x"></i>
						</div>

						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th><%=u1.getName()%></th>
								</tr>

								<tr>
									<th scope="row">Qualification</th>
									<th><%=u1.getQualification()%></th>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<th><%=u1.getEmail()%></th>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
				</div>
			</div>
		</div>
	</div>

	<%--end of profile --%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<%@include file="all_components/msg.jsp"%>
<%-- 
				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
						
							<div class="form-group col-md-5-mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose....</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Bhubaneswar">Bhubaneswar</option>
									<option value="Delhi">Delhi</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Hydrabad">Hydrabad</option>
								</select>
							</div>

							<div class="form-group col-md-4-mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select class="custom-select"
									id="inlineFormCustomSelectPref" name="cat">
									<option value="ca" selected>Choose....</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<button class="btn btn-success">Submit</button>
							
						</form>
					</div>
				</div>
--%>
				<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobsForUser();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription()%>.
						</p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>

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
						</div>
						<h6>
							Publish Date:<%=j.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More </a>
						</div>

					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>