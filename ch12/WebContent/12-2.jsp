<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>12-2. JSTL Function 라이브러리 태그</title>
</head>
<body>
	<h1>12-2. JSTL Function 라이브러리 태그</h1>
	<c:set var="str" value="Hello Korea" />
	
	<ul>
		<li>문자열 길이 : ${fn:length(str) }</li>
		<li>문자열 자르기 : ${fn:substring(str, 7, 9) }</li>
		<li>문자열 교체 : ${fn:replace(str, "Korea", "Busan") }</li>
		<li>인덱스 번호 : ${fn:indexOf(str, "e") }</li>		
	</ul>
</body>
</html>