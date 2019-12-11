package kr.co.farmstory2.service.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.TermsVO;
import kr.co.farmstory2.controller.CommonService;

public class TermsService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		Statement stmt = conn.createStatement();
		
		// 4단계
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		// 5단계
		TermsVO tv = new TermsVO();
		
		if(rs.next()){
			tv.setTerms(rs.getString(1));
			tv.setPrivacy(rs.getString(2));
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();	
		
		// 뷰에서 출력하기 위한 데이터 공유
		req.setAttribute("tv", tv);
		
		
		return "/user/terms.jsp";
	}

}
