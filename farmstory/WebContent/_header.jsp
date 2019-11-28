<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");
	String code = request.getParameter("code"); 

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="/farmstory/css/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="/farmstory/css/style.css">
    <link rel="stylesheet" type="text/css" href="/farmstory/css/boardStyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/farmstory/js/script.js"></script>
    <script src="/farmstory/js/termsCheck.js"></script>
    <script src="/farmstory/js/validation.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/farmstory/js/zipcode.js"></script>
	<script src="/farmstory/js/checkUid.js"></script>
	<script>
		var code = "<%= code %>";
		if(code == 101){
			alert('회원정보가 잘못되었습니다. 다시 확인바랍니다.');
		}
	</script>
    <title>FARMSTORY:ukk</title>
</head>

<body>
    <div id="wingbanner">
     배너내용

    </div>
    <div id="wrapper">

        <header>
            <div class="logo"><a href="/farmstory/"><img src="/farmstory/img/logo.png" alt="FarmStory"></a></div>
            <p>
                <a href="/farmstory/" alt="HOME">Home</a>
                <% if(bmb==null){ %>
                <a href="/farmstory/user/login.jsp" alt="LOGIN">로그인</a>
                <a href="/farmstory/user/terms.jsp" alt="JOIN">회원가입</a>
                <%}else{ %>
                <a href="#"><%= bmb.getNick() %>님 마이페이지</a>
                <a href="/farmstory/user/logout.jsp" alt="LOGOUT">로그아웃</a>
                <% } %>
                <a href="#" alt="Contact us">Contact us</a>
            </p>
            <div class="main_top_banner"><a href="#"><img src="/farmstory/img/head_txt_img.png" alt="상단배너"></a></div>

            <ul class="gnb">
                <li><a href="/farmstory/introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/farmstory/market/market.jsp"><img src="/farmstory/img/head_menu_badge.png" alt="30%"> 장보기</a></li>
                <li><a href="/farmstory/board/list.jsp?cate=story">농작물이야기</a></li>
                <li><a href="/farmstory/event/event.jsp">이벤트</a></li>
                <li><a href="/farmstory/community/notice.jsp">커뮤니티</a></li>
            </ul>
            
        </header>