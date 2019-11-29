<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBconfig"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	String uid = bmb.getUid();
	
	
	//서버상에서 경로 
	String path = request.getServletContext().getRealPath("/data");	// Context:환경정보
	int maxSize = 1024 * 1024 * 10 ; // 10 MB
	
	// multipart 폼데이터(첨부파일)을 전송받는 mr객체 생성하면서 파일저장 및 폼 데이터 수신 
	MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	String group = mr.getParameter("group");
	String cate  = mr.getParameter("cate");
	String title = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String fileName = mr.getFilesystemName("file");
	String regip = request.getRemoteAddr();

	
	// 파일이 있을 경우 -> 파일네임이 null이 아니면   
	if(fileName != null){
		
		// 1) 코드화된 파일명 생성 (UUID)
		int idx = fileName.lastIndexOf("."); 	// 점부터 마지막까지 잘라냄     
		String ext = fileName.substring(idx);	// 파일확장자
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
		String now = sdf.format(new Date()); 
		
		String newFileName = now+uid+ext;	// 191126111920_ukkk.hwp
		
		
		// 2) 저장된 첨부 파일명 수정 
		File oldFile = new File(path+"/"+fileName);
		File newFile = new File(path+"/"+newFileName);
		
		oldFile.renameTo(newFile);
		
		// 3) 원본 파일명과 코드화된 파일명을 DB테이블에 저장 / 글 등록

			// 1,2단계
			Connection conn = DBconfig.getconnection();
			conn.setAutoCommit(false); //트랜잭션 시작 
		
			// 3단계
			PreparedStatement psmt1 = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt1.setInt(1, 0);				//parent
			psmt1.setString(2, cate); 		//cate
			psmt1.setString(3, title);		//title
			psmt1.setString(4, content);	//content
			psmt1.setInt(5, 1); 			//file  첨부되면 1, 안되면 0 
			psmt1.setString(6, uid); 		//uid
			psmt1.setString(7, regip); 		//regip
							
			Statement stmt = conn.createStatement();
			
			// 4단계
			psmt1.executeUpdate();
			ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);
			
			// 5단계
			int parent = 0;
			
			if(rs.next()){
				parent = rs.getInt(1);
			}
			
			PreparedStatement psmt2 = conn.prepareStatement(SQL.INSERT_FILE);
			psmt2.setInt(1, parent); 	// insert(executeUpdate) 를 한 다음에 바로 부모 글번호가 생성되기 때문에 뒤로 좀 미룸. 
			psmt2.setString(2, fileName);
			psmt2.setString(3, newFileName);
			
			psmt2.executeUpdate();
			
			conn.commit(); // 트랜젝션 끝(쿼리 실행)	
			
			// 6단계
			rs.close();
			psmt2.close();
			psmt1.close();
			stmt.close();
			conn.close();			
			
	// 아래 파일이 없을 경우
	} else {
		
		// 1단계, 2단계
		Connection conn = DBconfig.getconnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
		psmt.setInt(1, 0); 			//parent
		psmt.setString(2, cate); 	//cate
		psmt.setString(3, title); 	//title
		psmt.setString(4, content); //content
		psmt.setInt(5, 0); 			//file
		psmt.setString(6, uid); 	//uid
		psmt.setString(7, regip); 	//regip
		
		// 4단계
		psmt.executeUpdate();
		
		// 5단계
		
		// 6단계
		psmt.close();
		conn.close();

	}
		
	// 리스트 페이지 이동
	response.sendRedirect("/farmstory/board/list.jsp?group="+group+"&cate="+cate);

	
%>