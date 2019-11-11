<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>6-2. 500 에러페이지</title>
</head>
<body>
	<h3> 6-2. 500 에러 페이지 </h3>
	<%
		int num1 = 6;
		int num2 = 0;
		int result = num1/num2;
		
	%>
	
	<p> 결과 : <%= result %> </p>
		
</body>
</html>