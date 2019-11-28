<%@page import="kr.co.farmstory.config.DBconfig"%>
<%@page import="kr.co.farmstory.bean.BoardArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String seq = request.getParameter("seq");
	
	// 1, 2단계
	Connection conn = DBconfig.getconnection();
		
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_VIEW);
	psmt.setString(1, seq);
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
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
	psmt.close();
	conn.close();
%>
		<div id="board">
			<h3>글수정</h3>
			<div class="write">
				<form action="/farmstory/proc/modifyProc.jsp" method="post">
					<input type="hidden" name="seq" value="<%= seq %>" />
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="<%= bab.getTitle() %>" placeholder="제목을 입력하세요." required /></td>
						</tr>				
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" required><%= bab.getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td>첨부</td>
							<td>
								<input type="file" name="file" />
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="/farmstory/board/view.jsp?seq=<%= seq %>" class="cancel">취소</a>
						<input type="submit" class="submit" value="수정완료" />
					</div>
				</form>
			</div>
		</div>


