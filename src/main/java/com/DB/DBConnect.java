package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn() {
		
		try {
			if(conn == null) {
				Class.forName("org.postgresql.Driver");
				conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/job_portal","postgres","postgres");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
		
		
	}
	
	
	
}
