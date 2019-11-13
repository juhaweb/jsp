
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
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

	// 3단계
	Statement stmt = conn.createStatement(); 
	
	// 4단계
	String sql = "SELECT * FROM `MEMBER` WHERE `uid`='"+uid+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	MemberBean mb = null;  // null로 초기화 
	
	if(rs.next()){
		mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
	}
	
	// 6단계s
	rs.close();
	stmt.close();
	conn.close();



%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>14-5.직원수정</title>
</head>
<body>
	<h1>14-5.직원수정</h1>
	<form action="./14-6.jsp" method="get">
		<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="uid" readonly="readonly" value="<%= mb.getUid() %>"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%= mb.getName() %>"></td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><input type="text" name="hp" maxlength="13" value="<%= mb.getHp() %>"></td>
		</tr>
		<tr>
			<th>직급</th>
			<td>
				<select name="pos">
					<option>사원</option>
					<option>대리</option>
					<option>과장</option>
					<option>차장</option>
					<option>부장</option>			
				</select>
			</td>
		</tr>
		<tr>
			<th>부서</th>
			<td>
				<select name="dep">
					<option value="101">영업1부</option>
					<option value="102">영업2부</option>
					<option value="103">영업3부</option>
					<option value="104">영업4부</option>
					<option value="105">영업지원부</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td><input type="date" name="rdate" readonly="readonly" value="<%= mb.getRdate().substring(0,10) %>"></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="수정하기"></th>
		</tr>				
		</table>
	</form>
</body>
</html>