<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구구단</title>
</head>
<body>
	<h3>3-2.반복문을 이용한 구구단</h3>

	<table border="1">
	<tr>
		<% for(int i=2; i<=9; i++) { %>
			<td><%= i  %> 단 </td> 		
		<% } %>
	</tr>
	
		<% for (int a=2; a<=9; a++){ %>
	<tr>
		<% for (int b=2; b<=9; b++){
			int c= b * a;  %>	
		<td><%= b%> x <%= a%> = <%= c %></td>
		<% } %>
	</tr>	
		<% } %>	
	</table>
	
</body>
</html>