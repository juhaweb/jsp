<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!-- 헤더인클루드 -->
<jsp:include page="../header.jsp"/>

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
						
						<c:forEach var="vo" items="${articleList}">
							<tr>
								<td>${listCount=listCount-1}</td>
								<td><a href="${path}/board/view.do?group=${boardGroup}&cate=${category}">${vo.title}</a>&nbsp;[${vo.comment}]</td>
								<td>${vo.nick}</td>
								<td>${vo.rdate.substring(2,10)}</td>
								<td>${vo.hit}</td>
							</tr>
						</c:forEach>

					</table>
				</div>

				<!-- 페이징 -->
				<nav class="paging">
					<span>
					<a href="#" class="prev">이전</a>
					
					<c:forEach var="p" begin="${groupStart}" end="${groupEnd}">
					<a href="${path}/board/list.do?group=${boardGroup}&cate=${category}&pg=${p}" class="num">${p}</a>
					</c:forEach>
					
					<a href="#" class="next">다음</a>
					</span>
				</nav>
				
				<c:if test="${uid != null}">
					<a href="${path}/board/write.do?group=${boardGroup}&cate=${category}" class="btnWrite">글쓰기</a>
				</c:if>
			</div>
			<!--  게시판 리스트 영역 끝  -->
			
			
			</div>
			<!-- 컨텐츠 영역 끝 -->
				
		</article>
	</div>
</section>
		
<!-- 푸터인클루드 -->
<jsp:include page="../footer.jsp" />
