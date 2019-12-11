<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<%@ include file="../header.jsp" %>
<section class="sub user">
	<div class="bg"></div>
	<div>
		<article>
			<nav>
				<img src="${path}/img/member_tit_terms.jpg" alt="인사말" />
				<span>HOME > <strong>약관동의</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content">
				<div class="terms">
					<section>
						<table>
							<caption>사이트 이용약관</caption>
							<tr>
								<td>
									<textarea readonly>${tv.getTerms()}</textarea>
									<div>
										<label><input type="checkbox" name="chk1" />&nbsp;동의합니다.</label>        
									</div>
								</td>
							</tr>
						</table>
					</section>			
					<section>
						<table>
							<caption>개인정보 취급방침</caption>
							<tr>
								<td>
									<textarea readonly>${tv.privacy}</textarea>
									<div>
										<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
									</div>
								</td>
							</tr>
						</table>
					</section>
					
					<div>
						<a href="${path}/" class="btnCancel">취소</a>
						<a href="${path}/user/register.do" class="btnNext">다음</a>
					</div>
					
				</div>


			</div>

		</article>
	</div>
</section>
<%@ include file="../footer.jsp" %>