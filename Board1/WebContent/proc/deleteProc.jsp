<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String seq		= request.getParameter("seq");

	Connection conn = DBconfig.getconnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_DELETE);
	psmt.setString(1, seq); 
	
	// DB 파일데이터 셀렉트
	PreparedStatement psmtSelect = conn.prepareStatement(SQL.SELECT_FILE);
	psmtSelect.setString(1, seq);
	
	// DB 파일데이터 삭제
	PreparedStatement psmtFile = conn.prepareStatement(SQL.DELETE_FILE);
	psmtFile.setString(1, seq);
	
	psmt.executeUpdate();
	ResultSet rs = psmtSelect.executeQuery();
	
	if(rs.next()){
		String newName = rs.getString(4);
		psmtFile.executeUpdate(); 
		
		// 파일 스트림 연결해서 저장된 실제  파일 삭제 
		String path = request.getServletContext().getRealPath("/data");	// Context:환경정보
		File file = new File(path+"/"+newName);
		file.delete();		
	}

		
	// 닫기	
	rs.close();
	psmt.close();
	psmtSelect.close();
	psmtFile.close();
	conn.close();
	
	response.sendRedirect("/Board1/list.jsp");

	
	

%>