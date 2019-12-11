<!-- jsp파일마다 항상 선언해야함. -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!-- 헤더인클루드 -->
<%@ include file="../header.jsp" %>
<jsp:include page="../header.jsp"/>

<!-- 이렇게도 씀 -->
<c:choose>
	<c:when test="${boardGroup == 'market'}"><%@ include file="./_aside_market.jsp" %></c:when>
	<c:when test="${boardGroup == 'market'}"><%@ include file="./_aside_market.jsp" %></c:when>
	<c:when test="${boardGroup == 'market'}"><%@ include file="./_aside_market.jsp" %></c:when>
</c:choose>

<!-- 표현언어는 태그요소에서만 적용 -->
<jsp:include page="./_aside_${boardGroup}.jsp"/>


<!-- 게시판 리스트 영역  -->
<div id="board">
	<h3>글목록</h3>
	<!-- 리스트 -->
	<div class="list">
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>날짜</td>
				<td>조회</td>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="#">테스트 제목입니다.</a>&nbsp;[3]</td>
				<td>홍길동</td>
				<td>18-03-01</td>
				<td>12</td>
			</tr>
			
			<c:forEach var="a" items="${articleList}">
				<tr>
					<td>${listCount=listCount-1}</td>
					<td><a href="#">${a.title}</a>&nbsp;[${a.comment}]</td>
					<td>${a.nick}</td>
					<td>${a.rdate.substring(2,10)}</td>
					<td>${a.hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- 페이징 -->
	<nav class="paging">
		<span> 
		<a href="#" class="prev">이전</a>
		<a href="#" class="num">1</a>
		<a href="#" class="next">다음</a>
		</span>
	</nav>
	<a href="${path}/board/write.do" class="btnWrite">글쓰기</a>
	
</div>
<!--  게시판 리스트 영역 끝  -->


</div>
<!-- 컨텐츠 영역 끝 -->
				
		</article>
	</div>
</section>
		
<!-- 푸터인클루드 -->
<jsp:include page="../footer.jsp" />
