<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-1</title>
</head>
<body>
	<h3>1.request 내장객체</h3>
	<!-- HTML 주석  -->
	<%-- JSP주석 

		전송방식 GET과 POST 교재 P80
		
		■ GET
			= 서버로 페이지나 데이터를 요청하는 방식 ( = 주세요 )
			= 데이터가 서버 주소창에 노출이 됨. 
		 
		■ POST
			= 서버로 데이터를 전달하면서 처리를 요청하는 방식 ( = 해주세요 )
			= 데이터가 서버 주소창에 노출이 안됨. Request header에 삽입되어 전송.  
	
	--%>
	
	
	<h4>로그인</h4>
	<form action="./3-2.jsp" method="get">
		<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="uid"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass"></td>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
		</table>
	</form>
		
		
	<h4>회원가입</h4>
	<form action="./3-3.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="남"/>남</label>
					<label><input type="radio" name="gender" value="여"/>여</label>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<label><input type="checkbox" name="hobby" value="등산"/>등산</label>
					<label><input type="checkbox" name="hobby" value="볼링"/>볼링</label>
					<label><input type="checkbox" name="hobby" value="야구"/>야구</label>
					<label><input type="checkbox" name="hobby" value="골프"/>골프</label>
					<label><input type="checkbox" name="hobby" value="수영"/>수영</label>
					<label><input type="checkbox" name="hobby" value="사진"/>사진</label>
				</td>				
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select name="addr">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>					
					</select>
				</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="가입하기">
				</td>
			</tr>	
		
		</table>
	</form>	
</body>
</html>