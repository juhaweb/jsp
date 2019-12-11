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
		
		
		//1�ܰ�, 2�ܰ�
		Connection conn = DBConfig.getConnection();
		
		// 3�ܰ�
		Statement stmt = conn.createStatement();
		
		// 4�ܰ�
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		// 5�ܰ�
		TermsVO tv = new TermsVO();
		
		if(rs.next()){
			tv.setTerms(rs.getString(1));
			tv.setPrivacy(rs.getString(2));
		}
		
		// 6�ܰ�
		rs.close();
		stmt.close();
		conn.close();	
		
		// �信�� ����ϱ� ���� ������ ����
		req.setAttribute("tv", tv);
		
		
		return "/user/terms.jsp";
	}

}
