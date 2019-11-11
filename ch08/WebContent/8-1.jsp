<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>8-1.자바빈</title>
</head>
<body>
	<h1>8-1.자바빈</h1>
	<%-- 빈 -> form 객체  --%>
	
	
	
	
	<h4>회원가입</h4>
	<form action="./8-2.jsp" method="get">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="1"/>남</label>
					<label><input type="radio" name="gender" value="2"/>여</label>
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