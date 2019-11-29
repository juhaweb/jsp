<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>
	<section class="sub cate5">
    <div><img src="/farmstory/img/sub_top_tit5.png" alt="COMMUNITY"/></div>
    <div>
        <aside class="lnb">  <!-- lnb : local navigation bar -->
            <img src="/farmstory/img/sub_aside_cate5_tit.png" alt="커뮤니티">
            <ul>
                <li class="<%= (cate.equals("story"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=notice">공지사항</a></li> 
                <li class="<%= (cate.equals("grow"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=menu">오늘의식단</a></li>
                <li class="<%= (cate.equals("school"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=chef">나도요리사</a></li>
                <li class="<%= (cate.equals("school"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=qna">1:1고객게시판</a></li>
                <li class="<%= (cate.equals("school"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=faq">자주묻는질문</a></li>
            </ul>
        </aside>
        <article class="contents">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate5_tit_<%= cate %>.png" alt="커뮤니티">
                <p>HOME > 커뮤니티 > 
	                <% if(cate.equals("notice")){ %>
	                <span>공지사항 </span>
	                <% }else if(cate.equals("menu")){ %>
	                <span>오늘의식단 </span>
	                <% }else if(cate.equals("chef")){ %>
	                <span>나도요리사 </span>
	                <% }else if(cate.equals("qna")){ %>
	                <span>1:1고객게시판 </span>
	                <% }else if(cate.equals("faq")){ %>
	                <span>자주묻는질문 </span>
	                <% } %>
                </p>
                
            </nav>