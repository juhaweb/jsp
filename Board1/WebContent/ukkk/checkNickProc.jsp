<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String nick = request.getParameter("nick");

	// 1단계, 2단계
	Connection conn = DBconfig.getconnection();
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `nick`='"+nick+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	JSONObject json = new JSONObject();
	
	if(rs.next()){
		json.put("result", rs.getInt(1));
	}

	// 6단계
	rs.close();
	stmt.close();
	conn.close();
	
	// JSON 출력
	
	out.print(json);




%>