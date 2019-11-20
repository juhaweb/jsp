<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// DB정보
	String host ="jdbc:mysql://192.168.44.9/hju";
	String user ="hju";
	String pass ="1234";
	
	// 1단계 : JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 : db접속
	Connection conn = DriverManager.getConnection(host, user, pass);
		
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	ResultSet rs = stmt.executeQuery ("SELECT * FROM `MEMBER`;");
	
	// 5단계
	JSONArray jarr = new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("uid",rs.getString(1));
		obj.put("name",rs.getString(2));
		obj.put("hp",rs.getString(3));
		obj.put("pos",rs.getString(4));
		obj.put("dep",rs.getInt(5));
		obj.put("rdate",rs.getString(6));
		
		jarr.add(obj);
	}
	
	// 6단계
	
	rs.close();
	stmt.close();
	conn.close();
	

	// json에 배열 출력하기
	out.print(jarr);
	
%>