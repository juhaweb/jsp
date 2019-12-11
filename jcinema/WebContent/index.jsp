<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더인클루드 -->
<%@ include file="./_header.jsp" %>

<!-- main 시작 -->
<main>
  <!-- 1. 슬라이더 -->
  <div class="slider">
    <div>
      <ul class="bxslider">
        <li><img src="${path}/img/slider_banner_poster1.jpg" alt="겨울왕국2"></li>
        <li><img src="${path}/img/slider_banner_poster2.jpg" alt="조커"></li>
        <li><img src="${path}/img/slider_banner_poster3.jpg" alt="82년생 김지영"></li>
        <li><img src="${path}/img/slider_banner_poster4.jpg" alt="가장 보통의 연애"></li>
        <li><img src="${path}/img/slider_banner_poster5.jpg" alt="터미네이터 다크페이트"></li>
      </ul>
      <div class="box-office">

        <div class="top">
          <img src="${path}/img/tit_boxoffice.png" alt="박스오피스">
          <span class="tab">
            <a href="#" class="on">예매순</a>
            <span> | </span>
            <a href="#">평점순</a>
          </span>
        </div>
        <ul>
          <li>
            <a href="#">
              <em class="rank">1.</em>
              <span class="grade gradeAll">ALL</span>
              <span class="tit">겨울왕국2</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
          <li>
            <a href="#">
              <em class="rank">2.</em>
              <span class="grade grade12">12</span>
              <span class="tit">나좀 찾아줘</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
          <li>
            <a href="#">
              <em class="rank">3.</em>
              <span class="grade grade15">15</span>
              <span class="tit">블랙 머니</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
          <li>
            <a href="#">
              <em class="rank">4.</em>
              <span class="grade grade18">18</span>
              <span class="tit">신의 한 수</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
          <li>
            <a href="#">
              <em class="rank">5.</em>
              <span class="grade grade19">19</span>
              <span class="tit">크롤</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
          <li>
            <a href="#">
              <em class="rank">6.</em>
              <span class="grade gradeAll">12</span>
              <span class="tit">프란치스코 교황</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
          <li>
            <a href="#">
              <em class="rank">7.</em>
              <span class="grade gradeAll">12</span>
              <span class="tit">82년생 김지영</span>
            </a>
            <span>예매율<em>24.2%</em></span>
          </li>
        </ul>

        <a href="${path}/ticketing/choice-movie.do"> 예매하기 </a>

      </div>
    </div>
  </div>

  <!-- 2. 포스터 -->
  <div class="poster">
    <article>
      <ul>
        <li><a href="#"><img src="${path}/img/poster_banner_img1.jpg" alt="겨울왕국2"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img2.jpg" alt="조커"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img3.jpg" alt="가장 보통의 연애"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img4.jpg" alt="말레피센트"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img5.jpg" alt="82년생김지영"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img6.jpg" alt="터미네이터"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img7.jpg" alt="제미니맨"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img8.jpg" alt="엑시트"></a></li>
        <li><a href="#"><img src="${path}/img/poster_banner_img9.jpg" alt="날씨의아이"></a></li>
      </ul>
    </article>
  </div>

  <!-- 3. 극장종류 -->
  <div class="sponsor">
    <article>
      <ul>
        <li><a href="#"><img src="${path}/img/sponsor_img1.jpg" alt="샤로때"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img2.jpg" alt="슈퍼플랙스G"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img3.jpg" alt="슈퍼S"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img4.jpg" alt="슈퍼플랙스"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img5.jpg" alt="SUPER4D"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img6.jpg" alt="시네패밀리"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img7.jpg" alt="시네커플"></a></li>
        <li><a href="#"><img src="${path}/img/sponsor_img8.jpg" alt="시네비즈"></a></li>
      </ul>
    </article>
  </div>

  <!-- 4. 이벤트 -->
    <div class="event">
      <article>
        <h1>Event</h1>
        <div>
          <a href="#"><img src="${path}/img/event_img1.jpg" alt="신한카드"></a>
          <a href="#"><img src="${path}/img/event_img2.jpg" alt="청소년"></a>
          <a href="#"><img src="${path}/img/event_img3.jpg" alt="할로윈큰거"></a>
          <a href="#"><img src="${path}/img/event_img4.jpg" alt="할로윈작은거"></a>
          <a href="#"><img src="${path}/img/event_img5.jpg" alt="롯데시네마"></a>
          <a href="#"><img src="${path}/img/event_img6.jpg" alt="현대카드"></a>
          <a href="#"><img src="${path}/img/event_img7.jpg" alt="vip"></a>
        </div>
    </article>
  </div> 

  <!-- 5. 바로가기 -->
  <div class="quick">
    <article>
      <ul>
        <li><a href="#"><img src="${path}/img/quick_menu1.gif" alt="할인안내"></a></li>
        <li><a href="#"><img src="${path}/img/quick_menu2.gif" alt="포인트"></a></li>
        <li><a href="#"><img src="${path}/img/quick_menu3.gif" alt="VIP"></a></li>
        <li><a href="#"><img src="${path}/img/quick_menu4.gif" alt="틴틴클럽"></a></li>
        <li><a href="#"><img src="${path}/img/quick_menu5.gif" alt="브라보클럽"></a></li>
      </ul>
    </article>
  </div>
  
  <!-- 6. 공지 -->
  <div class="notice">
    <article>
      <h2>공지사항</h2>
      <ul>
        <li><a href="#">시스템 점검 안내</a></li>
        <li><a href="#">개인정보 이용내역 안내</a></li>
        <li><a href="#">개인정보 처리방침 개정 안내</a></li>
        <li><a href="#">시티카드 시스템 점검 안내</a></li>
        <li><a href="#">환불규정 안내</a></li>
      </ul>
      <a class="more" href="#">MORE</a>
    </article>
  </div>

</main>
   
   
<!-- 푸터인클루드 -->
<%@ include file="./_footer.jsp" %>
    