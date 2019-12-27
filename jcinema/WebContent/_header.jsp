<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="shortcut icon" href="${path}/img/favicon.ico">
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="${path}/css/jquery.bxslider.css">
  <link rel="stylesheet" href="${path}/css/style.css">
  <link rel="stylesheet" href="${path}/css/sub.css">
  <link rel="stylesheet" href="${path}/css/sub_member.css">   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="${path}/js/jquery.bxslider.js"></script>
  <script src="${path}/js/topbanner.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${path}/js/zipcode.js"></script>
  <script src="${path}/js/user.js"></script>
  <script src="${path}/js/ticketCalendar.js"></script>
  <script src="${path}/js/theaterList.js"></script>
  <script src="${path}/js/mainSliderBanner.js"></script>

  <!-- 작업중js -->
  <script src="${path}/js/jsworks.js"></script>

  <title>제이시네마</title>
</head>
<body>

  <div id="wrapper">
    <!-- topbanner 시작 -->
    <div id="top-banner">
      <canvas id="canvas"></canvas>
      <div>
        <a href="#"><img id="topBannerImg" src="${path}/img/top_banner_poster1.jpg" alt="상단배너"></a>
        <a href="#" class="close"><img src="${path}/img/banner-close.png" alt="닫기"></a>
      </div>
    </div>
    
    <!-- header 시작 -->
    <header>
      <div class="service">
        <article>
          <p>
            <a href="/jcinema/admin" target="_blank">모바일 APP</a>
            <a href="/jcinema/admin" target="_blank">좋아요</a>
            <a href="/jcinema/admin" target="_blank">구독하기</a>
          </p>
          <p>
              <c:choose>
	              <c:when test="${user eq null}">
		            <a href="${path}/member/login">로그인</a>
		            <a href="${path}/member/register">회원가입</a>
	              </c:when>
	              <c:otherwise>
	              	<a href="${path}/member/logout">로그아웃</a>
	              	<a href="${path}/member/my-cinema">마이시네마</a>
	              </c:otherwise>
              </c:choose>
              
              <a href="#">고객센터</a>
          </p>
        </article>
      </div>
      <div class="logo">
        <article>
          <a href="${path}/"><img src="${path}/img/logo.gif" alt="제이시네마"></a>
        </article>
      </div>
      <div class="gnb">
        <article>
          <ul>
            <li class="on"><a href="${path}/ticketing/choice-movie">예매</a></li>
            <li><a href="${path}/ticketing/choice-seat">영화</a></li>
            <li><a href="${path}/ticketing/order-confirm">영화관</a></li>
            <li><a href="${path}/ticketing/order-result">이벤트</a></li>
            <li><a href="#">제이몰</a></li>
            <li><a href="#">VOD</a></li>
          </ul>
        </article>
      </div>
    </header>