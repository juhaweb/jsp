<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");	
	String uid= request.getParameter("uid");

	// DB정보
	String host ="jdbc:mysql://192.168.44.9/hju";
	String user ="hju";
	String pass ="1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "DELETE FROM `MEMBER` WHERE `uid`='"+uid+"';";
	int result = stmt.executeUpdate(sql);
	
	// 5단계
	// 6단계
	
	stmt.close();
	conn.close();
	
	JSONObject json = new JSONObject();
	json.put("result",result);
	
	out.print(json);

%>