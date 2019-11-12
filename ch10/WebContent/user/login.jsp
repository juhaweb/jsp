<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
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