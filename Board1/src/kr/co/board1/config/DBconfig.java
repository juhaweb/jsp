package kr.co.board1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconfig {

	/* DB���� */
	private static final String HOST = "jdbc:mysql://35.197.177.190/hju";
	private static final String USER = "root";
	private static final String PASS = "juha66^^^";
		
	public static Connection getconnection() throws Exception {
		
		// 1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
		
		
	}
		
}
