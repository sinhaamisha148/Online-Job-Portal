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
import com.entities.Jobs;

@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String description = request.getParameter("desc");
			
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setDescription(description);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			HttpSession session = request.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.addJobs(j);
			if(f) {
				session.setAttribute("msg", "Job Post Successfully....");
				response.sendRedirect("add_jobs.jsp");
			}else {
				session.setAttribute("msg", "Something wrong on Server");
				response.sendRedirect("add_jobs.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
