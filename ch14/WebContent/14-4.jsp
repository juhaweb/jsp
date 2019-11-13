<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 수신
	String uid = request.getParameter("uid");

	// DB정보
	String host ="jdbc:mysql://192.168.44.9/hju";
	String user ="hju";
	String pass ="1234";
		
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
		
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계 : SQL 실행객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "DELETE FROM `MEMBER` WHERE `uid`='"+uid+"';";
	stmt.executeUpdate(sql);
	
	// 5단계
	// 6단계
	stmt.close();
	conn.close();

	// 목록으로 이동
	response.sendRedirect("./14-3.jsp");
	
%>
	