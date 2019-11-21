<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Layout2</title>
</head>
<body>
	<table width="400" border="1" cellpadding="0" cellspacing=0">
		<tr>
			<td colspan="2">
				<jsp:include page="./top.jsp" flush="false"/>
			</td>
		</tr>
		<tr>
			<td width="100">
				<jsp:include page="./left.jsp" flush="false"/>
			</td>
			<td width="300">
			<!-- 내용부분 시작 -->
			레이아웃2
			<br><br><br>
			<!-- 내용부분 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="./bottom.jsp" flush="false"/>
			</td>
		</tr>
		
	</table>
	
</body>
</html>