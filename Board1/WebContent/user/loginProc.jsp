<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 파라미터 수신
	request.setCharacterEncoding("UTF-8");
	
	String uid = request.getParameter("uid");
	String pw = request.getParameter("pass");

	// DB정보
	String host = "jdbc:mysql://192.168.44.9/hju";
	String user = "hju";
	String pass = "1234";

	// 1단계
	Class.forName("com.mysql.jdbc.Driver");

	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	String sql = "SELECT * FROM `BOARD_MEMBER` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	psmt.setString(2, pw);
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계
	if(rs.next()){
		
		// 입력한 아이디,비밀번호에 해당하는 회원이 있으면. = 로그인성공
		BoardMemberBean bmb = new BoardMemberBean();
		bmb.setUid(rs.getString(1));
		bmb.setPass(rs.getString(2));
		bmb.setName(rs.getString(3));
		bmb.setNick(rs.getString(4));
		bmb.setEmail(rs.getString(5));
		bmb.setHp(rs.getString(6));
		bmb.setGrade(rs.getInt(7));
		bmb.setZip(rs.getString(8));
		bmb.setAddr1(rs.getString(9));
		bmb.setAddr2(rs.getString(10));
		bmb.setRegip(rs.getString(11));
		bmb.setRdate(rs.getString(12));
		
		// 세션에 사용자 정보객체 저장
		session.setAttribute("member", bmb);
		
		// 리스트페이지 이동
		response.sendRedirect("../list.jsp");
				
	} else {
		// 입력한 아이디, 비밀번호에 해당하는 회원이 없으면. = 로그인실패 

		// 로그인페이지로 이동
		response.sendRedirect("./login.jsp?code=101");
	}
	
	// 6단계
	rs.close();
	psmt.close();
	conn.close();
	
	
	
	
%>