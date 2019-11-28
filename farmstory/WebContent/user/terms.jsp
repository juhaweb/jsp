<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="kr.co.farmstory.config.DBconfig"%>
<%@page import="kr.co.farmstory.bean.BoardTermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 1단계, 2단계
	Connection conn = DBconfig.getconnection();
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
	
	// 5단계
	BoardTermsBean btb = new BoardTermsBean();
	
	if(rs.next()){
		btb.setTerms(rs.getString(1));
		btb.setPrivacy(rs.getString(2));
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();

%>
<%@ include file="../_header.jsp" %>

<div id="terms">
	<section>
		<table>
			<caption>사이트 이용약관</caption>
			<tr>
				<td>
					<textarea readonly><%= btb.getTerms() %></textarea>
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
					<textarea readonly><%= btb.getPrivacy() %></textarea>
					<div>
						<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
					</div>
				</td>
			</tr>
		</table>
	</section>
	
	<div>
		<a href="#" class="btnCancel">취소</a>
		<a href="/farmstory/user/register.jsp" class="btnNext">다음</a>
	</div>
		
</div>
<%@ include file="../_footer.jsp" %>










