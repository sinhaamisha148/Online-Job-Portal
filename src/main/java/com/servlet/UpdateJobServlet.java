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


@WebServlet("/UpdateJobServlet")
public class UpdateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String description = request.getParameter("desc");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String location = request.getParameter("location");
			
			
			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(description);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);
			
			
			HttpSession session = request.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.updateJob(j);
			if(f) {
				session.setAttribute("msg", "Job Update Successfully....");
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

}
