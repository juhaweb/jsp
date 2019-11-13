<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터 수신
	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String hp    = request.getParameter("hp");
	String pos   = request.getParameter("pos");
	String dep   = request.getParameter("dep");
		
	// DB정보
	String host = "jdbc:mysql://192.168.44.9/hju";
	String user ="hju";
	String pass ="1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	String sql = "UPDATE `MEMBER` SET `name`=?, `hp`=?, `pos`=?, `dep`=? WHERE `uid`=?;";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);
	psmt.setString(2, hp);
	psmt.setString(3, pos);
	psmt.setString(4, dep);
	psmt.setString(5, uid);
	
	// 4단계
	psmt.executeUpdate();
	
	// 5단계
	// 6단계
	psmt.close();
	conn.close();
	
	// 목록이동
	response.sendRedirect("./14-3.jsp");
	
%>