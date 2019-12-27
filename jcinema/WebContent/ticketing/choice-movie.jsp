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

		<input type="text" name="movie_date"/> 
		<input type="text" name="theater_no"/> 
		<input type="text" name="movie_no"/> 
		
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
                <a class="login" href="${path}/ticketing/choice-seat">로그인</a>
              </p>
            </div>
            <article>
              <h4>전체영화관</h4>
              <ul class="theaters">
                <li class="active">
                  <a href="#">서울(23)</a>
                  <ol class="on"></ol>
                </li>
                <li>
                  <a href="#">경기/인천(44)</a>
                  <ol></ol>
                </li>
                <li>
                  <a href="#">충청/대전(10)</a>
                  <ol></ol>
                </li>
                <li>
                  <a href="#">전라/광주(9)</a>
                  <ol></ol>
                </li>
                <li>
                  <a href="#">경북/대구(16)</a>
                  <ol></ol>
                </li>
                <li>
                <a href="#">경남/부산/울산(22)</a>
                <ol></ol>
                </li>
                <li>
                  <a href="#">강원(3)</a>
                  <ol></ol>
                </li>
                <li>
                  <a href="#">제주(3)</a>
                  <ol></ol>
                </li>
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
	            <ul></ul>
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
          
          <ul class="round_view">
		  		<li>
					<a href="#">
						<span>1회차</span>
						<span>09:00 ~ 11:00</span>
						<span><em>24</em>석/<em>80</em>석</span>
					</a>                	
				</li>
				<li>
					<a href="#">
						<span>1회차</span>
						<span>09:00 ~ 11:00</span>
						<span><em>24</em>석/<em>80</em>석</span>
					</a>                	
				</li>
				<li>
					<a href="#">
						<span>1회차</span>
						<span>09:00 ~ 11:00</span>
						<span><em>24</em>석/<em>80</em>석</span>
					</a>                	
				</li>
				<li>
					<a href="#">
						<span>1회차</span>
						<span>09:00 ~ 11:00</span>
						<span><em>24</em>석/<em>80</em>석</span>
					</a>                	
				</li>
			</ul>
        </section>               
      </article>
    </div>
    <!-- 쇼타임끗-->

  </div><!-- 예매페이지 끝 -->

   
<!-- 푸터인클루드 -->
<%@ include file="../_footer.jsp" %>