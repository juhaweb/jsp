<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더인클루드 -->
<%@ include file="../_header.jsp" %>
<script src="/jcinema/admin/js/api_theater_screen.js"></script>

<section class="ticket-register">
    <nav>
        <h3>티켓생성</h3>
        <p>티켓관리 > 티켓생성</p>
    </nav>
                                                            
    <article>
        <form action="#">
            <div class="field">
                <label for="theater_city">영화관</label>
                <select name="theater_city" id="theater_city">
                    <option>선택</option>
                    <option>서울</option>
                    <option>경기/인천</option>
                    <option>충청/대전</option>
                    <option>전라/광주</option>
                    <option>경북/대구</option>
                    <option>경남/부산/울산</option>
                    <option>강원</option>
                    <option>제주</option>
                </select>
                <select name="theater_name" id="theater_name">
                    <option>선택</option>
                </select>
            </div>
            <div class="field">
                <label for="screen_name">상영관</label>
                <select name="screen_name" id="screen_name">
                    <option value="00">선택</option>
                </select>
            </div>
            <div class="field">
                <label for="movie_no">영화</label>
                <select name="movie_no" id="movie_no">
                    <option value="001">겨울왕국2</option>
                    <option value="002">백두산</option>
                    <option value="003">캣츠</option>
                    <option value="004">시동</option>
                    <option value="005">천문:하늘에 묻는다.</option>                                    
                </select>
            </div>
            <div class="field">
                <label for="movie_date">상영일</label>
                <input id="movie_date" type="date" name="movie_date" />
            </div>
            <div class="field">
                <label for="round_view">상영회차</label>
                <select name="round_view" id="round_view">
                    <option value="1">1회차</option>
                    <option value="2">2회차</option>
                    <option value="3">3회차</option>
                    <option value="4">4회차</option>
                    <option value="5">5회차</option>                                    
                </select>
            </div>
            
            <div class="field">
                <label for="price">티켓가격</label>
                <input id="price" type="text" name="price" />
                <span>1인 1매 가격 예) 10000, 12000, 18000</span>
            </div>              
            
            <button type="submit" class="btnRegister">등록하기</button>
        </form>
    </article>

</section>

<!-- 푸터인클루드 -->
<%@ include file="../_footer.jsp" %>

