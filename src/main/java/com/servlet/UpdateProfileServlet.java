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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String qua = request.getParameter("qua");
			String email = request.getParameter("email");
			String ps = request.getParameter("ps");
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			
			User u = new User();
			
			u.setId(id);
			u.setName(name);
			u.setQualification(qua);
			u.setEmail(email);
			u.setPassword(ps);
			
			boolean f = dao.updateUser(u);
			
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("msg", "Profile Update Successfully....");
				response.sendRedirect("home.jsp");
			}else {
				session.setAttribute("msg", "Something Wrong On Server....");
				response.sendRedirect("home.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
