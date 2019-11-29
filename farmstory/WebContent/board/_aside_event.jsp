<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>
	<section class="sub cate4">
    <div><img src="/farmstory/img/sub_top_tit4.png" alt="EVENT"/></div>
    <div>
        <aside class="lnb">  <!-- lnb : local navigation bar -->
            <img src="/farmstory/img/sub_aside_cate4_tit.png" alt="이벤트">
            <ul>
                <li class="<%= (cate.equals("event"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=event&cate=event">이벤트</a></li> 
            </ul>
        </aside>
        <article class="contents">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate4_tit_<%= cate %>.png" alt="이벤트">
                <p>HOME > 이벤트 > 
	                <% if(cate.equals("event")){ %>
	                <span>이벤트 </span>
	                <% } %>
                </p>
            </nav>
