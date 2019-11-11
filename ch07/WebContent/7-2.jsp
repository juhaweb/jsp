<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7-2. include action tag</title>
</head>
<body>

	<h1>7-2. include action tag</h1>
	<%--
	<jsp:include page="./inc/config.jsp"></jsp:include>  // 이건안됌 
	 --%>
	<hr>
	
	<!-- 인클루드 지시자  
		 = 공통의 전역파일을 삽입하는 include, 뷰컴포넌트도 삽입가능 
		 = 정적타입에 삽입된다. 
	-->
	<%@ include file="./inc/header.jsp" %>
	
	<main>
		<h3>메인 컨텐츠 영역</h3>
		<%--
			주소 : <%= HOST %> <br/>
			유저 : <%= USER %> <br/>
			비번 : <%= PASS %> <br/> --%>
	</main>
	
	<%-- 인클루드 태그 // 소스보기에서 노출이 안되는 주석 
		 = 뷰 컴포넌트(사용자 눈에 보이는 태그)를 모듈화해서 삽입하는 include
		 = 런타임(실행)에 삽입된다.
	--%> 
	<jsp:include page="./inc/footer.jsp"></jsp:include>
	
	
</body>
</html>