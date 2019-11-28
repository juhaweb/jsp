<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<section class="sub cate3">
    <div><img src="/farmstory/img/sub_top_tit1.png"/></div>
    <div>
        <aside class="lnb">  <!-- lnb : local navigation bar -->
            <img src="/farmstory/img/sub_aside_cate3_tit.png" alt="농작물이야기">
            <ul>
                <li class="on"><a href="/farmstory/croptalk/story.jsp">농작물이야기</a></li> 
                <li><a href="/farmstory/croptalk/grow.jsp">텃밭가꾸기</a></li>
                <li><a href="/farmstory/croptalk/school.jsp">귀농학교</a></li>
            </ul>
        </aside>
        <article class="contents">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate3_tit1.png" alt="농작물이야기">
                <p>HOME > 농작물이야기 > <span>농작물이야기 </span></p>
            </nav>
            <!-- 컨텐츠 내용시작 -->
            
            <%@ include file="../board/list.jsp" %>

            <!-- 컨텐츠 내용끗 -->
        </article>
    </ul>
</section>

<%@ include file="../_footer.jsp" %>