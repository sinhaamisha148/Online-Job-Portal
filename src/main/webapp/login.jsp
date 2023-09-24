<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_components/myCSS.jsp" %>
</head>
<body style="background-color: #bfccd9;">
	<%-- <%@include file="all_components/navbar.jsp" %>--%>
	
	<%--start navbar --%>
	
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
				<a href="login.jsp" class="btn btn-light mr-1"><i
					class="fa fa-sign-in-alt"></i>Login</a> <a href="signup.jsp"
					class="btn btn-light"><i class="fa fa-user-plus"></i>Signup</a>
			</form>
		</div>
	</nav>
	
	
	<%--end of navbar --%>
	
	
	
	<div class="continer-fluid">
			<div class="row p-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
							</div>
							<%@include file="all_components/msg.jsp" %>
							<%---<c:if test="${not empty succMsq }">
								<h4 class="text-center text-danger">${succMsg }</h4>
								<c:remove var="succMsg"/>
							</c:if>--%>
							<form action="loginServlet" method="post">
								<div class="form-group">
									<label>Enter Email</label> <input type="email" 
									required="required" class="form-control" id="exampleInputEmail" aria-descibedly="emailHelp" name="email">
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label>
									<input required="required" type="password"  class="form-control" id="exampleInputPassword1" name="password">
								</div>
								
								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
								
</body>
</html>