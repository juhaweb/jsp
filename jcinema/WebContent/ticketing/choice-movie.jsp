<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더인클루드 -->
<%@ include file="../_header.jsp" %>

  <!-- 예매페이지 시작 -->
  <div id="sub" class="choice-movie">
    <nav class="sub-menu"></nav>
    
    <!--예매-->
    <div class="theater">
      <article>
        <!-- 사이드배너-->
        <a class="side-banner left"  href="#"><img src="${path}/img/ticketing_side_banner_event.png" alt=""></a>
        <a class="side-banner right" href="#"><img src="${path}/img/ticketing_side_banner_event2.png" alt=""></a> 

        <!-- 날짜선택 캘린더 -->                    
        <div class="calendar">

          <nav>
            <span class="month">12</span>
            <span class="year">2019 December</span>
          </nav>

          <div>
            <ul>
              <li class="day on"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="sat"><a href="#"><em></em><span></span></a></li>
              <li class="sun"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="day"><a href="#"><em></em><span></span></a></li>
              <li class="sat"><a href="#"><em></em><span></span></a></li>
              <li class="sun"><a href="#"><em></em><span></span></a></li>
            </ul>                            
          </div>
        </div>

        <!-- left 영화관 선택 -->
        <section>
          <div class="region">
            <div>
              <h3>영화관</h3>
              <span><strong>·&nbsp;최대 1개</strong>까지 선택 가능</span>
            </div>
            <div>
              <h4>MY 영화관</h4>
              <p>
                로그인 후 확인하실 수 있습니다.
                <a class="login" href="${path}/ticketing/choice-seat.do">로그인</a>
              </p>
            </div>
            <article>
              <h4>전체영화관</h4>
              <ul>
                <li class="active">
                  <a href="#">서울(24)</a>
                  <ol class="on">
                    <li class="chk"><a href="#">가산디지털</a></li>
                    <li><a href="#">가양</a></li>
                    <li><a href="#">강동</a></li>
                    <li><a href="#">건대입구</a></li>
                    <li><a href="#">김포공항</a></li>
                    <li><a href="#">노원</a></li>
                    <li><a href="#">독산</a></li>
                    <li><a href="#">신도림</a></li>
                    <li><a href="#">영등포</a></li>
                    <li><a href="#">월드타워</a></li>
                    <li><a href="#">용산</a></li>
                  </ol>
                </li>
                <li>
                  <a href="#">경기/인천(44)</a>
                </li>
                <li>
                  <a href="#">충청/대전(10)</a>
                </li>
                <li>
                  <a href="#">전라/광주(9)</a>
                </li>
                <li>
                  <a href="#">경북/대구(16)</a>
                </li>
                <li>
                <a href="#">경남/부산/울산(22)</a>
                  <ol>
                    <li><a href="#">광복</a></li>
                    <li><a href="#">동래</a></li>
                    <li><a href="#">대영</a></li>
                    <li><a href="#">동부산아울렛</a></li>
                    <li><a href="#">사상</a></li>
                    <li><a href="#">마산터미널</a></li>
                    <li><a href="#">부산본점</a></li>
                    <li><a href="#">센텀시티</a></li>
                    <li><a href="#">서면</a></li>
                    <li><a href="#">오투</a></li>
                    <li><a href="#">창원</a></li>
                  </ol>
                </li>
                <li>
                  <a href="#">강원(3)</a>
                </li>
                <li><a href="#">제주(3)</a></li>
              </ul>
            </article>

          </div>

          <!-- right 영화 선택 -->
          <div class="rank">
            <div>
            <h3>영화</h3>
            <span><strong>·&nbsp;최대 1개</strong>까지 선택 가능</span>
          </div>

          <div>
            <p>
            <a class="on" href="#">예매순</a>
            <a href="#">평점순</a>
            </p>
          </div>

          <article>
            <ul>                                    
              <li><a href="#"><span class="grade gradeAll">all</span><span class="tit">겨울왕국2</span></a></li>
              <li><a href="#"><span class="grade grade12">12</span><span class="tit">나를 찾아줘</span></a></li>
              <li><a href="#"><span class="grade grade15">15</span><span class="tit">블랙머니</span></a></li>
              <li><a href="#"><span class="grade grade18">18</span><span class="tit">굿라이어</span></a></li>
              <li><a href="#"><span class="grade grade19">19</span><span class="tit">프란치스코</span></a></li>
              <li><a href="#"><span class="grade gradeAll">all</span><span class="tit">겨울왕국2</span></a></li>
              <li><a href="#"><span class="grade grade12">12</span><span class="tit">나를 찾아줘</span></a></li>
              <li><a href="#"><span class="grade grade15">15</span><span class="tit">블랙머니</span></a></li>
              <li><a href="#"><span class="grade grade18">18</span><span class="tit">굿라이어</span></a></li>
              <li><a href="#"><span class="grade grade19">19</span><span class="tit">프란치스코</span></a></li>
              <li><a href="#"><span class="grade gradeAll">all</span><span class="tit">겨울왕국2</span></a></li>
              <li><a href="#"><span class="grade grade12">12</span><span class="tit">나를 찾아줘</span></a></li>
              <li><a href="#"><span class="grade grade15">15</span><span class="tit">블랙머니</span></a></li>
              <li><a href="#"><span class="grade grade18">18</span><span class="tit">굿라이어</span></a></li>
              <li><a href="#"><span class="grade grade19">19</span><span class="tit">프란치스코</span></a></li>
              <li><a href="#"><span class="grade gradeAll">all</span><span class="tit">겨울왕국2</span></a></li>
              <li><a href="#"><span class="grade grade12">12</span><span class="tit">나를 찾아줘</span></a></li>
            </ul>
          </article>
          <!-- 영화선택 끝 -->

          </div>
        </section>

      </article>
    </div>
    <!--예매끗-->

    <!-- 쇼타임-->
    <div class="showtime">
      <article>
        <div class="info">
          <em>상영일</em>
          <span class="infoDate">2019.11.27(수)</span>
          <em>영화관</em>
          <span class="infoTheater">영화관을 선택하세요.</span>
          <em>영화</em>
          <span class="infoMovie">영화를 선택하세요.</span>
        </div>

        <section>
          <h1>상영시간<span>예고편 상영 등으로 시작이 10여분 정도 차이 날 수 있습니다.</span></h1>
          <p class="nodata">상영시간이 조회되지 않았습니다. </p>
        </section>               
      </article>
    </div>
    <!-- 쇼타임끗-->

  </div><!-- 예매페이지 끝 -->

   
<!-- 푸터인클루드 -->
<%@ include file="../_footer.jsp" %>