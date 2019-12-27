package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MovieVO;

public class MovieDAO {
	
	//싱글톤 객체
	private static MovieDAO instance = new MovieDAO();

	public static MovieDAO getInstance() {
		return instance;	
	}

	private MovieDAO() {}

	
	// ★ 포스터 선택 (메인 좌롤링배너 10개)
	
	public List<MovieVO> selectPosters() throws Exception {
		
		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs= stmt.executeQuery(SQL.SELECT_POSTERS);
		
		List<MovieVO> movies = new ArrayList<>();
		while(rs.next()) {
			
			MovieVO mvo = new MovieVO();
			mvo.setMovie_no(rs.getInt(1));
			mvo.setMovie_title(rs.getString(2));
			mvo.setMovie_poster(rs.getString(3));
			
			movies.add(mvo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return movies;
	}
	
	
	
	

	// 영화관에서 상영중인 영화들만.. > api.MoviesService
	public List<MovieVO> selectMovies(String theater_no, String schedule_date) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_BY_THEATER);
		psmt.setString(1, theater_no);
		psmt.setString(2, schedule_date);
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieVO> movies = new ArrayList<MovieVO>();
		MovieVO vo = null;
		
		while(rs.next()) {
			vo = new MovieVO();
			
			vo.setMovie_no(rs.getInt(3));
			vo.setMovie_title(rs.getString(9));
			vo.setMovie_grade(rs.getString(10));	
			
			movies.add(vo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
		
	}
	
	
	
	// 영화관에서 상영중인 영화 선택시 상영 스케쥴 표시하기
	public List<MovieScheduleVO> selectMovieRoundView(String schedule_date, String theater_no, String movie_no) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_ROUND_VIEW);
		psmt.setString(1,schedule_date);
		psmt.setString(2,theater_no);
		psmt.setString(3,movie_no);
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieScheduleVO> movies = new ArrayList<MovieScheduleVO>();
		
		while(rs.next()) {
			MovieScheduleVO msv = new MovieScheduleVO();
			msv.setSchedule_theater_no(rs.getString(1));	
			msv.setSchedule_screen_no(rs.getString(2));	
			msv.setSchedule_movie_no(rs.getString(3));	
			msv.setSchedule_date(rs.getString(4));	
			msv.setSchedule_start_time(rs.getString(5));	
			msv.setSchedule_end_time(rs.getString(6));
			msv.setSchedule_round_view(rs.getString(7));	
			
			movies.add(msv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
		
		
	}
	
	
	public void selectMovie() throws Exception{}
	public void insertMovie() throws Exception{}
	public void updateMovie() throws Exception{}
	public void deleteMovie() throws Exception{}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
