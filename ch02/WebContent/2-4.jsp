<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4. 클래스</title>
</head>
<body>
	<h3>4.클래스</h3>
	
	<% 
		Account kb = new Account("국민은행", "010-6555-4444", "김유신", 10000);
		
		kb.deposit(100000);
		kb.withdraw(50000);
	%>

	<h4>현재잔액</h4>
	<ul>
		<li>은 행 명 : <%= kb.bank %></li>
		<li>계좌번호 : <%= kb.id %></li>
		<li>예 금 주 : <%= kb.name %></li>
		<li>현재잔액 : <%= kb.money %></li>
	</ul>
	
	
</body>
</html>