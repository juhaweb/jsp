package kr.co.farmstory2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	/* DB���� */
	private static final String HOST = "jdbc:mysql://35.197.177.190/hju";
	private static final String USER = "root";
	private static final String PASS = "juha66^^^";
	
		
	public static Connection getConnection() throws Exception {
		
		// 1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
		
		
	}
		
}
