package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entities.User;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
//			
//			UserDAO dao = new UserDAO(DBConnect.getConn());
//			User u = dao.login(email, password);
//			
//			HttpSession session = request.getSession();
//			
//			if(u == null) {
//				session.setAttribute("msg", "Invalid Email and Password");
//				response.sendRedirect("login.jsp");
//				return;
//			}else {
//				//login
//				session.setAttribute("userObj", u);
//				
//				//admin: admin.jsp
//				if(u.getRole().equals("user")) {
//					//u.setRole("admin");
//					response.sendRedirect("home.jsp");
//				}else {
//					//user: home.jsp
//					response.sendRedirect("admin.jsp");
//				}
//				
//			}
			
			User u = new User();
			
			
			
			HttpSession session = request.getSession();
			session.setAttribute("userObj", u);
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				u.setRole("admin");
				response.sendRedirect("admin.jsp");
			}else {
				
				UserDAO dao = new UserDAO(DBConnect.getConn());
				User user = dao.login(email, password);
				
				if(user != null) {
					session.setAttribute("userObj", user);
					response.sendRedirect("home.jsp");
				}else {
					
					session.setAttribute("msg", "Invalid Email and Password");
					response.sendRedirect("login.jsp");
				}
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
