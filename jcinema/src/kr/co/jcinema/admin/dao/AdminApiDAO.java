// 스크립트 에서 요청하는 데이터베이스 코드 (json으로 생성)


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
import kr.co.jcinema.config.SQL_ADMIN;
import kr.co.jcinema.vo.MovieVO;

public class AdminApiDAO {

	//싱글톤객체
	private static AdminApiDAO instance = new AdminApiDAO();
	public static AdminApiDAO getInstance() {
		return instance;	
	}
	private AdminApiDAO() {}
	
	
	// 영화선택
	public List<TheaterVO> selectTheater(String city) throws Exception{
	
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_THEATER);
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
	
	
	// 스크린선택
	public List<ScreenVO> selectScreen(String theater_no) throws Exception{
	
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_SCREEN);
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
	

	
	// 영화선택..? 
	public List<MovieVO> selectMovies(String title) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_MOVIE);
		psmt.setString(1, "%"+title+"%");
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieVO> movies = new ArrayList<>();
		while(rs.next()){
			
			MovieVO mvo = new MovieVO();
			
			mvo.setMovie_no(rs.getInt(1));
			mvo.setMovie_title(rs.getString(2));
			mvo.setMovie_grade(rs.getString(3));
			mvo.setMovie_company(rs.getString(4));
			mvo.setMovie_score(rs.getDouble(5));
			mvo.setMovie_release_date(rs.getString(6));
			mvo.setMovie_genre(rs.getString(7));
			mvo.setMovie_country(rs.getString(8));
			mvo.setMovie_running_time(rs.getInt(9));
			mvo.setMovie_homepage(rs.getString(10));
			mvo.setMovie_poster(rs.getString(11));
			mvo.setMovie_desc(rs.getString(12));
			mvo.setMovie_director(rs.getString(13));
			mvo.setMovie_actor(rs.getString(14));

			movies.add(mvo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
	
	}	
	
	
	
	
	
	
	public void insertTheater() throws Exception{}
	public void updateTheater() throws Exception{}
	public void deleteTheater() throws Exception{}
	
	
	
	
	
	
	
	
}
