package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.UserVO;

public class UserDAO {

	
	// 싱글톤 객체 
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {	
		return instance;	
	}
	
	private UserDAO() {}
	
	
	// 로그인
	public UserVO selectUser(String uid, String pw) throws Exception {
		
		// 1단계,2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pw);
		
		//4단계
		ResultSet rs = psmt.executeQuery();
				
		//5단계
		UserVO uv = null;
		
		if(rs.next()){
			// 입력한 아이디, 비밀번호에  해당하는 회원이 있으면
			
			uv = new UserVO();
			uv.setUid(rs.getString(1));
			uv.setPass(rs.getString(2));
			uv.setName(rs.getString(3));
			uv.setNick(rs.getString(4));
			uv.setEmail(rs.getString(5));
			uv.setHp(rs.getString(6));
			uv.setGrade(rs.getInt(7));
			uv.setZip(rs.getString(8));
			uv.setAddr1(rs.getString(9));
			uv.setAddr2(rs.getString(10));
			uv.setRegip(rs.getString(11));
			uv.setRdate(rs.getString(12));
		}
		
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return uv;
		
	}
	
	
	// 회원가입
	public void insertUser(UserVO uv) throws Exception {
		
		// 1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
		psmt.setString(1, uv.getUid());
		psmt.setString(2, uv.getPass());
		psmt.setString(3, uv.getName());
		psmt.setString(4, uv.getNick());
		psmt.setString(5, uv.getEmail());
		psmt.setString(6, uv.getHp());
		psmt.setString(7, uv.getZip());
		psmt.setString(8, uv.getAddr1());
		psmt.setString(9, uv.getAddr2());
		psmt.setString(10, uv.getRegip());
		
		// 4단계
		psmt.executeQuery();		
		
		// 5단계
				
		// 6단계
		psmt.close();
		conn.close();
			
	}
	
		
	
	
	
	// 체크아이디
	public void checkUserId() throws Exception {}
	public void checkUserEmail() throws Exception {}
	public void checkUserHp() throws Exception {}
	public void checkUserNick() throws Exception {}
	public void selectTerms() throws Exception {}
	
}
