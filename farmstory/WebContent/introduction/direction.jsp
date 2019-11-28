<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<section class="sub cate1">
    <div><img src="/farmstory/img/sub_top_tit1.png"/></div>
    <div>
        <aside class="lnb">  <!-- lnb : local navigation bar -->
            <img src="/farmstory/img/sub_aside_cate1_tit.png" alt="팜스토리소개">
             <ul>
                <li><a href="/farmstory/introduction/hello.jsp">인사말</a></li>
                <li class="on"><a href="/farmstory/introduction/direction.jsp">찾아오시는길</a></li>
            </ul>
        </aside>
        <article class="contents">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는길">
                <p>HOME > 팜스토리소개 > <span>찾아오시는길 </span></p>
            </nav>
            <!-- 컨텐츠 내용시작 -->
            
                <!-- * 카카오맵 - 지도퍼가기 -->
                <!-- 1. 지도 노드 -->
                <div id="daumRoughmapContainer1571897945475" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                <!--
                    2. 설치 스크립트
                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                -->
                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                <!-- 3. 실행 스크립트 -->
                <script charset="UTF-8">
                    new daum.roughmap.Lander({
                        "timestamp" : "1571897945475",
                        "key" : "vjsz",
                        "mapWidth" : "740",
                        "mapHeight" : "480"
                    }).render();
                </script>

            <!-- 컨텐츠 내용끗 -->
        </article>
    </ul>
</section>

<%@ include file="../_footer.jsp" %>