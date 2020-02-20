package kr.co.board1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconfig {

	// DB정보
	private static final String HOST = "jdbc:mysql://192.168.44.7/hju";
	private static final String USER = "hju";
	private static final String PASS = "1234";
		
	public static Connection getconnection() throws Exception {
		
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
		
		
	}
		
}
