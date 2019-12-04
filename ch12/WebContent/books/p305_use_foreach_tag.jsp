<%@ page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	HashMap<String,Object> mapData = new HashMap<String,Object>();
	mapData.put("name","최범균");
	mapData.put("today", new java.util.Date());

%>
<c:set var="intArray" value="<%= new int[] {1,2,3,4,5} %>" />
<c:set var="map" value="<%= mapData %>" />
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>USE FOREACH TAG</title>
</head>
<body>

	<h1>USE FOREACH TAG</h1>
	<hr/>
	<h3>1부터 100까지 홀수의 합</h3>
	<c:set var="sum" value="0"/>
		<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${sum+i}" />
	</c:forEach>
	결과 = ${sum}	
	
	
	<hr/>
	<h3>구구단:6단</h3>
	<ul>
		<c:forEach var="i" begin="1" end="9">
			<li>6* ${i} = ${6*i} </li>
		</c:forEach>
	</ul>
	
	
	<hr/>
	<h3>int형 배열</h3>
	<c:forEach var="i" items="${intArray}" begin="2" end="4" varStatus="status">
		${status.index}-${status.count}-[${i}] <br/>
	</c:forEach>
	
	
	<hr/>
	<h3>MAP</h3>
	<c:forEach var="i" items="${map}">
		${i.key} = ${i.value} <br>
	</c:forEach>
	
</body>
</html>