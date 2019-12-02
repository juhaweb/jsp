<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>12-1. JSTL (Java Standard Tag Library) </title>
</head>
<body>
	<h1>12-1. JSTL (Java Standard Tag Library) </h1>
	
	<% 
	
		String str = "Hello";
		out.println("<p>"+str+"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1 < num2){
			out.println("<p>num1이 num2보다 작다. </p>");
		}
	%>
	
	<c:set var="str" value="Hello" />
	
	<p>${str}</p>
	
	<c:set var="num1" value="1" />
	<c:set var="num2" value="2" />
	<c:set var="num3" value="3" />
	
	<c:if test="${num1 < num2}">
		<p>num1이 num2보다  작다.</p>
	</c:if>
	
	<hr/>
	
	<%
		if(num1 > num2){
			out.println("<p>num1이 num2보다 크다. </p>");
		}else{
			out.println("<p>num1이 num2보다 작다. </p>");
		}
	%>

	<!-- if-else -->
	<c:choose>
		<c:when test="">
			<p>num1 이 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1 이 num2보다 작다.</p>
		</c:otherwise>
	</c:choose>
	
	<hr/>
	
	
	<%
		if(num1 > num2){
			out.println("<p>num1이 num2보다 크다. </p>");
		}else if(num2 > num3) {
			out.println("<p>num2가 num3보다 크다. </p>");
		}else {
			out.println("<p>num3이 가장 크다. </p>");
		}
	 %>
	 
	<!-- if-elseif-else -->
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1이 num2보다 크다. </p>
		</c:when>
		<c:when test="${num2 gt num3}">
			<p>num2가 num3보다 크다. </p>
		</c:when>
		<c:otherwise>
			<p>num3이 가장 크다. </p>
		</c:otherwise>
	</c:choose>
	
	<hr/>
	 
	 <% 
		for(int i=1; i<=5; i++){
			out.println("<p>Hello JSTL! {"+i+"}</p>");
		}
		
	%>

	<!-- for -->
	<c:forEach var="i" begin="1" end="5">
		<p>Hello JSTL! ${i}</p>
	</c:forEach>

	<hr/>

	<%
		int total = 0;
		for(int k=1; k<=10; k++){
			total += k;
		}
		
		out.println("<p>1부터 10까지의 합 : "+total+"</p>");
	%>

	<c:set var="total" value="0" />
	<c:forEach var="k" begin="1" end="10">
		<c:set var="total" value="${total + k}" />
	</c:forEach>
	<p> 1부터 10까지의 합 : ${total} </p>

	<hr/>
	
	
	
	
	
	
	
</body>
</html>