<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버퍼 정보</title>
</head>
<body>
	<h1>버퍼 정보</h1>
	
	<p>
	버퍼 크기 : <%= out.getBufferSize() %> <br>
	남은 크기 : <%= out.getRemaining() %><br>
	auto Flush : <%= out.isAutoFlush() %><br>
	</p>
</body>
</html>