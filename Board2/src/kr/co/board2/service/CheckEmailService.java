package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;

public class CheckEmailService implements CommonService {
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		
		String uid = req.getParameter("email");
		
		// 1단계 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_EMAIL);
		psmt.setString(1,uid);

		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		JSONObject json = new JSONObject(); 
		
		if(rs.next()){
			json.put("result", rs.getInt(1));
		}
		
		// 6단계 
		rs.close();
		psmt.close();
		conn.close();
			
		return json.toJSONString();
		
	}

}
