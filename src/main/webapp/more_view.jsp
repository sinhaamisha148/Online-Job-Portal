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
<title>User : view Jobs</title>
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
				<a href="more_view.jsp" class="btn btn-light mr-1"><i
					class="fa fa-user"></i>User</a> <a href="logoutServlet"
					class="btn btn-light"><i class="fa fa-sign-in-alt"></i>LogOut</a>
			</form>
		</div>
	</nav>
	
	<%--navbar end --%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				//String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msgg = "";

				JobDAO dao = new JobDAO(DBConnect.getConn());

				List<Jobs> list = null;

				if (!"cat".equals(cat)) {
					list = new ArrayList<Jobs>();
					msgg = "Job Not Available";
				} else {
					list = dao.getJobAndCategory(cat);
				}

				//if (list.isEmpty()) {
				//%>
				<%-- <h4 class="text-center text-danger">Job Not Available</h4>--%>
				<%
				//}
				%>

				<%
				if (list != null) {
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
						</div>

						<h6>
							Publish Date:<%=j.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View </a>
						</div>
					</div>
				</div>

				<%
				}
				} else
				%>
				<h4 class="text-center text-danger"><%=msgg%></h4>

			</div>
		</div>
	</div>

</body>
</html>