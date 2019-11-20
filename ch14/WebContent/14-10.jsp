<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid 	 = request.getParameter("uid");
	String name	 = request.getParameter("name");
	String hp	 = request.getParameter("hp");
	String pos	 = request.getParameter("pos");
	String dep	 = request.getParameter("dep");
	String rdate = request.getParameter("rdate");
	
	// DB정보
	String host ="jdbc:mysql://192.168.44.9/hju";
	String user ="hju";
	String pass ="1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "INSERT INTO `MEMBER` SET";
		  sql += "`uid`='"+uid+"',";
		  sql += "`name`='"+name+"',";
		  sql += "`hp`='"+hp+"',";
		  sql += "`pos`='"+pos+"',";
		  sql += "`dep`="+dep+",";
		  sql += "`rdate`='"+rdate+"';";
	
	int result = stmt.executeUpdate(sql);
		  
	// 5단계
	
	// 6단계
	
	stmt.close();
	conn.close();
	
	JSONObject json = new JSONObject();
	json.put("result",result);
	
	out.print(json);
	
%>