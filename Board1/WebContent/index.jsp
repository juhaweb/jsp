<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션에 사용자 정보 유무를 확인

	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");

	if(bmb == null){
		// 로그인을 안했으면
		pageContext.forward("./user/login.jsp");
		
	}else{
		// 로그인을 했으면
		pageContext.forward("./list.jsp");
		
	}

%>