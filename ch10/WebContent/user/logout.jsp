<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 세션에 저장된 데이터 모두 지움 ( = 세션정보 초기화)
	session.invalidate();

	// 다시 로그인 페이지로 이동
	response.sendRedirect("./login.jsp");
	
%>