package kr.co.board2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	// DB����
	private static final String HOST = "jdbc:mysql://192.168.44.3/hju";
	private static final String USER = "hju";
	private static final String PASS = "1234";
	
		
	public static Connection getConnection() throws Exception {
		
		// 1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
		
		
	}
		
}
