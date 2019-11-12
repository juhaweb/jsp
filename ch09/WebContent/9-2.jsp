<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>9-2. 쿠키확인</title>
</head>
<body>
	<h1>9-2. 쿠키확인</h1>
	<%
		// get이니까 반드시 리턴됨. 쿠키(들) 
		Cookie[] cookies = request.getCookies();
	
		// 배열이니까 for문으로 
		
		for(Cookie c : cookies){
			
			String name = c.getName();
			String value = c.getValue();
			
	%>
			<p> 
				쿠키이름 : <%= name %> <br>
				쿠키 값 : <%= value %> <br>
			</p>
	<%
		}
	%>
	
	
	
</body>
</html>