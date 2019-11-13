
<%@page import="java.util.ArrayList"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
	String sql = "SELECT * FROM `MEMBER`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	List<MemberBean> list = new ArrayList<>();
	
	while(rs.next()){
	
		MemberBean mb = new MemberBean();
		// 멤버 빈 mb 생성 (데이터없음...)
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		list.add(mb);	
		
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>14-3. 직원목록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
	$(document).ready(function(){
		
		// 수정 클릭
				
		// 삭제 클릭
		$('.delete').click(function(){
			
			var result = confirm("삭제하시겠습니까?");
			if(result){
				// a태그의 링크이동을 실행 한다 .
				return true;
			}else{
				// a태그의 링크이동을 실행 안한다. 
				return false;
			}
			
		});
		
		
	});
	
	
	</script>
</head>
<body>
	<h1>직원목록</h1>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>수정/삭제</th>
		</tr>
		
		<!--  데이터 출력   -->
		<% 
			// for(int i=0; i<list.size(); i++){ 
			//	MemberBean mb = list.get(i);
			for(MemberBean mb : list) {
		%>
		
		<tr>
			<td><%= mb.getUid() %></td>
			<td><%= mb.getName() %></td>
			<td><%= mb.getHp() %></td>
			<td><%= mb.getPos() %></td>
			<td><%= mb.getDep() %></td>
			<td><%= mb.getRdate().substring(2,10) %></td>
			<td>
				<a class="modify" href="./14-5.jsp?uid=<%= mb.getUid() %>" alt="수정하기">수정</a>
				<a class="delete" href="./14-4.jsp?uid=<%= mb.getUid() %>" alt="삭제하기">삭제</a>
			</td>
		</tr>
		
		<% } %>
		
	</table>
	

	
	<a href="./14-1.jsp" alt="등록하기"> 등록하기 </a>
	
	
</body>
</html>