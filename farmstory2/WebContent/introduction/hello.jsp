<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!-- 헤더인클루드 -->
<%@ include file="../header.jsp" %>

<section class="sub">
	<div class="bg">
		<img src="${path}/img/sub_top_tit1.png" alt="INTRODUCTION" />
	</div>
	<div>
		<aside>
			<img src="${path}/img/sub_aside_cate1_tit.png" alt="팜스토리소개" />

			<ul class="pg1">
				<li class="on">
					<a href="hello.do"><strong>인사말</strong></a>
				</li>
				<li>
					<a href="direction.do"><strong>찾아오시는길</strong></a>
				</li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="${path}/img/sub_nav_tit_cate1_tit1.png" alt="인사말" />
				<span>HOME > 팜스토리소개 > <strong>인사말</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content1">
				<p>
					안녕하세요. 팜스토리입니다...
				</p>
			</div>

		</article>
	</div>
</section>

<!-- 푸터인클루드 -->
<%@ include file="../footer.jsp" %>
		