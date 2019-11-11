<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// 전송파라미터 수신
	/* 스크립트릿 안쓰고 태그 자바빈 사용할거임.  
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String hobbies[] = request.getParameterValues("hobby");
	String addr = request.getParameter("addr");
	*/
%>

<!-- 결론적으로 쓰진않으나 그냥한번 해본거. 실패한 모델임 !!   
	 UserBean user = new UserBean();
												-->
												
<jsp:useBean id="user" class="sub1.UserBean">
	<jsp:setProperty name="user" property="name" />
	<jsp:setProperty name="user" property="gender" />
	<jsp:setProperty name="user" property="hobby" />
	<jsp:setProperty name="user" property="addr" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>8-2. 출력</title>
</head>
<body>
	<h1>8-2. 파라미터 출력</h1>

	<p>
		이름 : <%= user.getName() %> <br>
		성별 : <%= (user.getGender() == 1 ) ? "남자" : "여자" %><br>
		취미 : <% 
				for(String hobby : user.getHobby()) {
					out.print(hobby+", ");
				}
				%><br>
		주소 : <%= user.getAddr() %> <br>
		
	
	</p>
	
</body>
</html>