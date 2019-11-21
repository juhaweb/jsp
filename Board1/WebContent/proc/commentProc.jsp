<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
	String comment = request.getParameter("comment");
	String regip = request.getRemoteAddr();
	
	// 세션에서 사용자정보 가져오기 
	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");
	String uid = bmb.getUid();
	
	// 1, 2단계
	Connection conn = DBconfig.getconnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
	psmt.setString(1, seq);
	psmt.setString(2, comment);
	psmt.setString(3, uid);
	psmt.setString(4, regip);
	
	// 4단계
	psmt.executeUpdate();
	
	// 5단계
	
	// 6단계
	psmt.close();
	conn.close();
	
	// 글보기 페이지로 이동
	response.sendRedirect("../view.jsp?seq="+seq);
	

%>