<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null){
		
		
		//out.println(msg);
		
		
%>

	<div class="alert alert-success" role="alert">
  		<%=msg %>
	</div>

<% 
		
		session.removeAttribute("msg");
	}
%>
