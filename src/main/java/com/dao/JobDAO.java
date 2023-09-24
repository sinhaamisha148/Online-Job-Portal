package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Jobs;

public class JobDAO {
	private Connection conn;

	 
	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addJobs(Jobs j) {
		
		boolean f = false;
		
		try {
			String sql = "insert into jobs(title, description, category, status, location) values(?,?,?,?,?)";
			
			PreparedStatement psmt =  conn.prepareStatement(sql);
			
			psmt.setString(1, j.getTitle());
			psmt.setString(2, j.getDescription());
			psmt.setString(3, j.getCategory());
			psmt.setString(4, j.getStatus());
			psmt.setString(5, j.getLocation());
			
			int i = psmt.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Jobs> getAllJobs(){
		
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select * from jobs order by id desc";
			PreparedStatement psmt =  conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				list.add(j);
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Jobs> getAllJobsForUser(){
		
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select * from jobs where status=? order by id desc";
			PreparedStatement psmt =  conn.prepareStatement(sql);
			psmt.setString(1, "Active");
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				list.add(j);
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public Jobs getJobById(int id){
		Jobs j = null;
		
		try {
			String sql = "select * from jobs where id=?";
			PreparedStatement psmt =  conn.prepareStatement(sql);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return j;
	}
	
	public boolean updateJob(Jobs j) {
boolean f = false;
		
		try {
			String sql = "update jobs set title=?, description=?, category=?, status=?, location=? where id=?";
			
			PreparedStatement psmt =  conn.prepareStatement(sql);
			
			
			psmt.setString(1, j.getTitle());
			psmt.setString(2, j.getDescription());
			psmt.setString(3, j.getCategory());
			psmt.setString(4, j.getStatus());
			psmt.setString(5, j.getLocation());
			psmt.setInt(6, j.getId());
			
			
			int i = psmt.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f; 
	}
	
	public boolean deleteJobs(int id) {
		boolean f = false;
		
		try {
			String sql = "delete from jobs where id=?";
			PreparedStatement psmt =  conn.prepareStatement(sql);
			psmt.setInt(1,id);
			
			int i=psmt.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public List<Jobs> getJobAndCategory(String category){
		
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select * from jobs where category=? order by id desc";
			PreparedStatement psmt =  conn.prepareStatement(sql);
			psmt.setString(1, category);
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				list.add(j);
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
//	public List<Jobs> getJobsAndLocationAndCate(String category, String location){
//		
//		List<Jobs> list = new ArrayList<Jobs>();
//		Jobs j = null;
//		
//		try {
//			String sql = "select * from jobs where category=? and location=? order by id desc";
//			PreparedStatement psmt =  conn.prepareStatement(sql);
//			psmt.setString(1, category);
//			psmt.setString(2, location);
//			
//			ResultSet rs = psmt.executeQuery();
//			while(rs.next()) {
//				j = new Jobs();
//				j.setId(rs.getInt(1));
//				j.setTitle(rs.getString(2));
//				j.setDescription(rs.getString(3));
//				j.setCategory(rs.getString(4));
//				j.setStatus(rs.getString(5));
//				j.setLocation(rs.getString(6));
//				j.setPdate(rs.getTimestamp(7)+"");
//				list.add(j);
//			}
//			
//			
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//		
//	}
	
	
}




