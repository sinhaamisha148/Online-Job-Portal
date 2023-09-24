package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.User;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User u) {
		boolean f = false;
		try {
			String sql = "insert into jobseeker(name, qualification, email, password, role) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, "user");
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public User login(String email, String password) {
		User u = null;
		
		try {
			String sql = "select * from jobseeker where email=? and password=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				String name = rs.getString(2);
				u.setName(name);
				//u.setName(rs.getString(2));
				u.setQualification(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setRole(rs.getString(6));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
		
	}

	public boolean updateUser(User u) {
		boolean f = false;
		try {
			String sql = "update jobseeker set name=?, qualification=?, email=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	
	
	
	
	
	
	
}
