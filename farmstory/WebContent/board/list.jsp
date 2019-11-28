<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory.bean.BoardArticleBean"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	/*
	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");

	
	// 로그인을 안했을 경우 로그인페이지로 이동. 
	if (bmb==null){
		response.sendRedirect("/farmstory/user/login.jsp");
		return;		// 여기까지 프로그램 실행 (지연실행)
	};
	
	*/
	request.setCharacterEncoding("UTF-8");
	
	String cate = request.getParameter("cate");
	String pg = request.getParameter("pg");

	if(pg ==null) {
		pg = "1";
	};
	
	// 페이지 관련
	int total		= 0;
	int lastPage	= 0; 
	int listCount	= 0;
	int currentPg	= Integer.parseInt(pg);
	int limitBegin	= (currentPg - 1) *10; 
	int groupCurrent = (int)Math.ceil(currentPg / 10.0);
	int groupStart	= (groupCurrent-1) * 10 +1;
	int groupEnd	= groupCurrent * 10;


	// 1단계, 2단계
	Connection conn = DBconfig.getconnection();
	
	// 3단계
	
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
	psmt.setString(1, cate );
	psmt.setInt(2, limitBegin );
	
	Statement stmt = conn.createStatement();
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	ResultSet rsTotal = stmt.executeQuery(SQL.SELECT_ARTICLE_TOTAL);
	
	// 5단계
	if(rsTotal.next()){
		total = rsTotal.getInt(1);
		
		if(total % 10 != 0){
			lastPage = total/10 + 1;
		}else{
			lastPage = total/10;
		}		
				
		if(groupEnd > lastPage){
			groupEnd = lastPage;
		}
		
		listCount = total - limitBegin;
	}
	
	
	List<BoardArticleBean> articleList = new ArrayList<>();
	
	while(rs.next()){
		
		BoardArticleBean bab = new BoardArticleBean();
		
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
		bab.setNick(rs.getString(12));
		
		articleList.add(bab);
	}
	
	// parent 갯수 -> comment 업데이트
	
	
	// 6단계
	rs.close();
	psmt.close();
	stmt.close();
	conn.close();
	
	
%>
<%@ include file="../_header.jsp" %>
<section class="sub cate3">
    <div><img src="/farmstory/img/sub_top_tit1.png"/></div>
    <div>
        <aside class="lnb">  <!-- lnb : local navigation bar -->
            <img src="/farmstory/img/sub_aside_cate3_tit.png" alt="농작물이야기">
            <ul>
                <li class="on"><a href="/farmstory/board/list.jsp?cate=story">농작물이야기</a></li> 
                <li><a href="/farmstory/board/list.jsp?cate=grow">텃밭가꾸기</a></li>
                <li><a href="/farmstory/board/list.jsp?cate=school">귀농학교</a></li>
            </ul>
        </aside>
        <article class="contents">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate3_tit1.png" alt="농작물이야기">
                <p>HOME > 농작물이야기 > <span>농작물이야기 </span></p>
            </nav>
            <!-- 컨텐츠 내용시작 -->


			<div id="board">
				<!-- 리스트 -->
				<div class="list">
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
						
						<% for(BoardArticleBean bab : articleList){ %>
						<tr>
						<td><%= listCount-- %></td>
						<td><a href="./view.jsp?seq=<%= bab.getSeq() %>&pg=<%= pg %>"><%= bab.getTitle() %></a>&nbsp;[<%= bab.getComment() %>]</td>
						<td><%= bab.getNick() %></td>
						<td><%= bab.getRdate().substring(2,10) %></td>
						<td><%= bab.getHit() %></td>
						</tr>
						<% } %>
			
						
					</table>
				</div>
				<!-- 페이징 -->
				<nav class="paging">
					
					<% if(groupStart > 1 ) { %>
					<span> 
					<a href="./list.jsp?pg=<%= groupStart -1 %>" class="prev">이전</a>
					<% } %>
					
					<% for(int p=groupStart; p<=groupEnd; p++){ %>
					<a href="./list.jsp?pg=<%= p %>" class="num <%= (currentPg == p)? "current":"" %>"><%= p %></a>
					<% } %>
					
					<% if(groupEnd < lastPage){ %>
					<a href="./list.jsp?pg=<%= groupEnd + 1 %>" class="next">다음</a>
					</span>
					<% } %>
					
				</nav>
				<a href="/farmstory/board/write.jsp?cate=<%= cate %>" class="btnWrite">글쓰기</a>
			</div>

		<!-- 컨텐츠 내용끗 -->
        </article>
    </ul>
</section>
<%@ include file="../_footer.jsp" %>









