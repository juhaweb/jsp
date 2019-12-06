package kr.co.board2.service;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.vo.BoardMemberVO;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			String path = req.getServletContext().getRealPath("/data");	

			int maxSize = 1024 * 1024 * 10; // 10MB

			// multipart 폼데이터(첨부파일)을 전송받는 mr객체를 생성하면서 파일저장 및 폼데이터 수신
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			String title    = mr.getParameter("subject");
			String content  = mr.getParameter("content");
			String fileName = mr.getFilesystemName("file");
			String regip    = req.getRemoteAddr();
				
			HttpSession session = req.getSession();
			BoardMemberVO bmb = (BoardMemberVO)session.getAttribute("member");
			String uid = bmb.getUid();
			
			if(fileName != null){
				// 1) 코드화된 파일명 생성(UUID)
				int idx = fileName.lastIndexOf(".");
				String ext = fileName.substring(idx); // 파일 확장자
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
				String now = sdf.format(new Date());
				
				String newFileName = now+uid+ext; // 191126111912_chhak.hwp
				
				// 2) 저장된 첨부 파일명 수정
				File oldFile = new File(path+"/"+fileName);
				File newFile = new File(path+"/"+newFileName);
				
				oldFile.renameTo(newFile);
			
				// 3) 원본 파일명과 코드화된 파일명을 테이블 저장 및 글 등록
				
				// 1, 2단계
				Connection conn = DBConfig.getConnection();
				conn.setAutoCommit(false); // 트랜젝션 시작
				
				// 3단계
				PreparedStatement psmt1 = conn.prepareStatement(SQL.INSERT_ARTICLE);
				psmt1.setInt(1, 0); 			//parent
				psmt1.setString(2, "free"); 	//cate
				psmt1.setString(3, title); 		//title
				psmt1.setString(4, content); 	//content
				psmt1.setInt(5, 1); 			//file
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
				psmt2.setInt(1, parent);
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
				
			}else{		
				// 1) 글 등록	
				// 1단계, 2단계
				Connection conn = DBConfig.getConnection();
				
				//3단계
				PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
				psmt.setInt(1, 0); 			//parent
				psmt.setString(2, "free"); 	//cate
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
			
			return "redirect:/Board2/list.do";
			
		}else {
			return "/write.jsp";	
		}
		
		
		
	}

}