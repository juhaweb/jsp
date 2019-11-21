<%@page import="kr.co.board1.config.SQL"%>
<%@page import="kr.co.board1.bean.BoardArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");
	
	if (bmb==null){
		response.sendRedirect("./user/login.jsp");
		return;		// 여기까지 프로그램 실행 (지연실행)
	}

	String seq = request.getParameter("seq");
	
	// 1단계, 2단계
	Connection conn = DBconfig.getconnection();

	// 트랜잭션 시작
	conn.setAutoCommit(false);
	
		// 3단계
		PreparedStatement psmtView = conn.prepareStatement(SQL.SELECT_ARTICLE_VIEW);
		psmtView.setString(1, seq);
		
		PreparedStatement psmtHit = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT);
		psmtHit.setString(1, seq);
		
		// 4단계
		ResultSet rs = psmtView.executeQuery();
		psmtHit.executeUpdate();
	
	// 트랜잭션 끝 (실행)  ---> 3, 4단계 작업을 1개로 걸어버림.   
	conn.commit();

	// 5단계
	BoardArticleBean bab = new BoardArticleBean();
	
	if(rs.next()){
		
		bab.setSeq(rs.getInt(1));
		bab.setParent(rs.getInt(2));
		bab.setComment(rs.getInt(3));
		bab.setCate(rs.getString(4));
		bab.setTitle(rs.getString(5));
		bab.setContent(rs.getString(6));
		bab.setFile(rs.getInt(7));
		bab.setHit(rs.getInt(8));
		bab.setUid(rs.getString(9));
		bab.setRegip(rs.getString(10));
		bab.setRdate(rs.getString(11));

	}
	
	// 6단계
	rs.close();
	psmtView.close();
	psmtHit.close();
	conn.close();
	



%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글보기</title> 
		<link rel="stylesheet" href="./css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글보기</h3>
			<div class="view">
				<form action="#" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="<%= bab.getTitle() %>" readonly />
							</td>
						</tr>
						<% if(bab.getFile() ==1){ %>
						<tr>
							<td>첨부파일</td>
							<td>
								<a href="#">테스트.hwp</a>
								<span>3회 다운로드</span>
							</td>
						</tr>
						<% } %>
						
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" readonly><%= bab.getContent() %></textarea>
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="#" class="cancel del">삭제</a>
						<a href="#" class="cancel mod">수정</a>
						<a href="./list.jsp" class="cancel">목록</a>
					</div>
				</form>
			</div><!-- view 끝 -->
			
			<!-- 댓글리스트 -->
			<section class="comments">
				<h3>댓글목록</h3>
				<!--  댓글이 없어서 주석
				<div class="comment">
					<span>
						<span>홍길동</span>
						<span>18-03-01</span>
					</span>
					<textarea>테스트 댓글입니다.</textarea>
					<div>
						<a href="#" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
				 -->
				 
				<p class="empty">
					등록된 댓글이 없습니다.
				</p>
				
			</section>
			
			<!-- 댓글쓰기 -->
			<section class="comment_write">
				<h3>댓글쓰기</h3>
				<div>
					<form action="./proc/commentProc.jsp" method="post">
						<input type="hidden" name="seq" value="<%= bab.getSeq()%>" />
						<textarea name="comment" rows="5"></textarea>
						<div class="btns">
							<a href="#" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />
						</div>
					</form>
				</div>
			</section>
		</div><!-- board 끝 -->
	</body>

</html>










