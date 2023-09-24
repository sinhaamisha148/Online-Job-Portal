package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDAO;

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.deleteJobs(id);
			
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("msg", "Job Delete Successfully....");
				response.sendRedirect("view_jobs.jsp");
			}else {
				session.setAttribute("msg", "Something wrong on Server");
				response.sendRedirect("view_jobs.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
