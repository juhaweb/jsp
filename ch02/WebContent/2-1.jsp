<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>1.변수</h3>
	
	<%
		// 스크립트릿 : 자바코드가 실행되는 HTML 영역
		int		var1 = 1;
		boolean	var2 = true;
		double	var3 = 3.14;
		String	var4 = "HELLO JSP !!! ";
	
	%>
	
	<!--  표현식 : 자바 변수값을 출력하는 자바코드 영역  -->
	<p>
		var1 : <%= var1 %> <br>
		var2 : <%= var2 %> <br>
		var3 : <%= var3 %> <br>
		var4 : <%= var4 %> <br>
	<p>
	
	
	
	
</body>
</html>