<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 받습니다. 
	request.setCharacterEncoding("UTF-8");
	String result = request.getParameter("result");
	// 로그인 성공하면 null
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<script>
	
	// result를 자바스크립트 변수에 담아서 
	var result = "<%= result %>";
	
	if(result == "fail") {
		alert("로그인 실패. \n다시 확인 바랍니다. ");
	}

	</script>
	
</head>
<body>
	<h1>Login</h1>
	
	<form action="./LoginProc.jsp" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="uid" placeholder="아이디를 입력하세요"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<th colspan="2"> 
					<input type="submit" value="로그인"/ >
				</th>
			</tr>		
		</table>
	</form>
	
	
	<% %>
	
	
</body>
</html>