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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String qua = request.getParameter("qua");
			String email = request.getParameter("email");
			String ps = request.getParameter("ps");
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			
			User u = new User(name, email, ps, qua,"User");
			
			boolean f = dao.addUser(u);
			
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("msg", "Register Successfully");
				response.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("msg", "Something wrong on server");
				response.sendRedirect("signup.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
