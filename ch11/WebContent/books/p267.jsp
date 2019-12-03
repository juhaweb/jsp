<%@page import="chap11.Thermometer"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// Thermometer 객체를 생성하고, EL에서 사용할 수 있도록 request 의속성으로 추가하다. 
	Thermometer thermometer = new Thermometer();
	request.setAttribute("t",thermometer);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>p267 EL에서의 메서드 호출</title>
</head>
<body>
	<h1>온도 변환 예제</h1>
	<hr/>
	
	<!--  setCelsius() 메서드 실행. 리턴타입이 void이므로 아무것도 출력되지 않음.  -->
	${t.setCelsius('서울',27.3)}
	
	<!--  getCelsius()와 getFahrenteit() 메서드 실행.  -->
	서울 온도 : 섭씨 ${t.getCelsius('서울')}도 / 화씨 ${t.getFahrenheit('서울')}
	
	<br/>
	<!--  getInfo() 메서드의 결과를 값으로 출력 -->
	정보 : ${t.info}
	
	
	
	
</body>
</html>