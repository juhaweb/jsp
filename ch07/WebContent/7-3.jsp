<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7-3. 포워드 액션태그</title>
</head>
<body>
	<h3>7-3. 포워드 액션태그</h3>
	
	<%-- 이건 자바 프로그래밍 코드 
		pageContext.forward("7-1.jsp");
	--%>
	
	
	<%-- 근데 jsp로 시작하는 태그 거의 안씀.  --%>
	<jsp:forward page="7-1.jsp"/>
	<c:redirect location="7-1.jsp"/>
	
</body>
</html>