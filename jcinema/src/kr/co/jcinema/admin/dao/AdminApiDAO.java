package kr.co.jcinema.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.admin.vo.ScreenVO;
import kr.co.jcinema.admin.vo.TheaterVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;

public class AdminApiDAO {

	//ΩÃ±€≈Ê∞¥√º
	private static AdminApiDAO instance = new AdminApiDAO();
	public static AdminApiDAO getInstance() {
		return instance;	
	}
	private AdminApiDAO() {}
	
	
	// øµ»≠º±≈√
	public List<TheaterVO> selectTheater(String city) throws Exception{
	
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_THEATER);
		psmt.setString(1,  city);
		
		ResultSet rs = psmt.executeQuery();
		
		List<TheaterVO> theaters = new ArrayList<>();
		while(rs.next()){
			
			TheaterVO tvo = new TheaterVO();
			
			tvo.setTheater_no(rs.getInt(1));
			tvo.setTheater_local_code(rs.getInt(2));
			tvo.setTheater_name(rs.getString(3));
			
			theaters.add(tvo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return theaters;
	
	}
	
	
	// Ω∫≈©∏∞º±≈√
		public List<ScreenVO> selectScreen(String theater_no) throws Exception{
		
			Connection conn = DBConfig.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_SCREEN);
			psmt.setString(1,  theater_no);
			
			ResultSet rs = psmt.executeQuery();
			
			List<ScreenVO> screens = new ArrayList<>();
			while(rs.next()){
				
				ScreenVO svo = new ScreenVO();
				
				svo.setScreen_no(rs.getInt(1));
				svo.setScreen_name(rs.getString(2));
				svo.setScreen_total_seat(rs.getInt(3));
				svo.setScreen_theater_no(rs.getInt(4));
				
				screens.add(svo);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
			return screens;
		
		}
		
	
	
	public void insertTheater() throws Exception{}
	public void updateTheater() throws Exception{}
	public void deleteTheater() throws Exception{}
	
	
	
	
	
	
	
	
}
