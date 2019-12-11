<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<section class="sub">
	<div class="bg">
		<img src="${path}/img/sub_top_tit5.png" alt="INTRODUCTION" />
	</div>
	<div>
		<aside>
			<img src="${path}/img/sub_aside_cate5_tit.png" alt="팜스토리소개" />

			<ul class="pg5">
				<li class="${category eq 'notice' ? 'on':'off'}">
					<a href="${path}/board/list.do?group=community&cate=notice"><strong>Notice</strong></a>
				</li>
				<li class="${category eq 'menu' ? 'on':'off'}">
					<a href="${path}/board/list.do?group=community&cate=menu"><strong>Menu</strong></a>
				</li>
				<li class="${category eq 'chef' ? 'on':'off'}">
					<a href="${path}/board/list.do?group=community&cate=chef"><strong>Chef</strong></a>
				</li>
				<li class="${category eq 'qna' ? 'on':'off'}">
					<a href="${path}/board/list.do?group=community&cate=qna"><strong>Q&A</strong></a>
				</li>
				<li class="${category eq 'faq' ? 'on':'off'}">
					<a href="${path}/board/list.do?group=community&cate=faq"><strong>F&Q</strong></a>
				</li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="${path}/img/sub_nav_tit_cate5_${category}.png" alt="" />
				<span>HOME > 커뮤니티 > <strong>${title}</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content5">