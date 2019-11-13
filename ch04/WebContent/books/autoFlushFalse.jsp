<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>auto Flush 속성값 false 예제</title>
</head>
<body>
	<h1>auto Flush 속성값 false 예제</h1>
	<% for(int i=0; i<1000; i++){ %>
	false
	<% } %>
	//11~13행에서만 4KB이상의 데이터가 생성된다. 
	
</body>
</html>