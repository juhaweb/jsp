<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	// 사용자의 눈에는 보이지않아
	// 파라미터 수신
	String uid = request.getParameter("uid");
	String pass= request.getParameter("pass");
	// 원래는 데이터베이스 로직도 나와야함. 
	
	// 아이디 비번이 이렇다고 가정하고 마무리하겠음. 
	if (uid.equals("abcd") && pass.equals("1234") ){
		// 회원이 맞을 경우 세션에 회원정보 저장
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		// 회원이니까 다음페이지로 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	} else {
		// 회원이 아닐 경우 (로그인 처리결과가 실패했다는 값을 가져감 result=fail)
		response.sendRedirect("./login.jsp?result=fail");
				
	}

%>