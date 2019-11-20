<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title 	= request.getParameter("subject");
	String content	= request.getParameter("content");
	String regip	= request.getRemoteAddr();
	
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	String uid = bmb.getUid();

	// 1단계, 2단계
	Connection conn = DBconfig.getconnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
	psmt.setInt(1, 0); 			//parent
	psmt.setString(2, "free"); 	//cate
	psmt.setString(3, title); 	//title
	psmt.setString(4, content); //content
	psmt.setInt(5, 0); 			//file
	psmt.setString(6, uid); 	//uid
	psmt.setString(7, regip); 	//regip
	
	// 4단계
	psmt.executeUpdate();
	
	// 5단계
	
	// 6단계
	psmt.close();
	conn.close();
	
	// 리스트 페이지 이동
	response.sendRedirect("/Board1/list.jsp");

%>