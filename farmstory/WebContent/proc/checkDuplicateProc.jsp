<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="kr.co.farmstory.config.DBconfig"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String type  = request.getParameter("type");
	String value = request.getParameter("value");
	
	// 1단계, 2단계
	Connection conn = DBconfig.getconnection();
	
	// 3단계
	PreparedStatement psmt = null; 
	
	if(type.equals("uid")){
		psmt = conn.prepareStatement(SQL.SELECT_CHECK_UID);
	}else if(type.equals("nick")){
		psmt = conn.prepareStatement(SQL.SELECT_CHECK_NICK);
	}else if(type.equals("hp")){
		psmt = conn.prepareStatement(SQL.SELECT_CHECK_HP);
	}else if(type.equals("email")){
		psmt = conn.prepareStatement(SQL.SELECT_CHECK_EMAIL);
	}
	
	psmt.setString(1,value);

	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계
	JSONObject json = new JSONObject(); 
	
	if(rs.next()){
		json.put("result", rs.getInt(1));
	}
	
	// 6단계
	rs.close();
	psmt.close();
	conn.close();
	
	// json 출력
	out.print(json);
	
%>