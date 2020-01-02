package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.jcinema.vo.MovieScheduleVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MovieVO;
import kr.co.jcinema.vo.SeatVO;

public class MovieDAO {
	
	//싱글톤 객체
	private static MovieDAO instance = new MovieDAO();

	public static MovieDAO getInstance() {
		return instance;	
	}

	private MovieDAO() {}



	// 영화관에서 상영중인 영화들만.. > api.MoviesService
	public List<MovieVO> selectMovies(String theater_no, String schedule_date) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_BY_THEATER);
		psmt.setString(1, theater_no);
		psmt.setString(2, schedule_date);
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieVO> movies = new ArrayList<MovieVO>();
		
		while(rs.next()) {
			MovieVO vo = new MovieVO();			
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
	public List<List<MovieScheduleVO>> selectMovieRoundView(String schedule_date, String theater_no, String movie_no) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_ROUND_VIEW);
		psmt.setString(1,schedule_date);
		psmt.setString(2,theater_no);
		psmt.setString(3,movie_no);
		
		ResultSet rs = psmt.executeQuery();
		
		List<List<MovieScheduleVO>> movieSchedules = new ArrayList<>();
		List<MovieScheduleVO> movieSchedule = null;
				
		while(rs.next()) {
			
			// schedule_round_view 에서 7이후 8이 아니라 1이 나오니까.. 
			if(rs.getInt(7) == 1) {
				
				if(movieSchedule != null) {
					movieSchedules.add(movieSchedule);
					}
				
				movieSchedule = new ArrayList<>();
				
			}		
			
			MovieScheduleVO msv = new MovieScheduleVO();
			
			msv.setSchedule_theater_no(rs.getString(1));	
			msv.setSchedule_screen_no(rs.getString(2));	
			msv.setSchedule_movie_no(rs.getString(3));	
			msv.setSchedule_date(rs.getString(4));	
			msv.setSchedule_start_time(rs.getString(5));	
			msv.setSchedule_end_time(rs.getString(6));
			msv.setSchedule_round_view(rs.getString(7));	
			
			movieSchedule.add(msv);
		}
		
		// 마지막 상영관의 영화 상영표 추가하기 (위에선 7이후 8이 아니라 1이 안와서.. 추가를 못함) 
		movieSchedules.add(movieSchedule);
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movieSchedules;
		
	}
	
	
	
	
	// 영화관에서 상영중인 영화 선택시 상영 스케쥴 표시 이후 좌석 토탈 구해서 표시 choice-movie.jsp	
	public List<List<Integer>> selectRemainSeatWithTotal(String ticketMovieDate, 
										  String ticketMovieNo, 
										  String ticketTheaterNo,
										  String ticketScreenNo ) throws Exception{
											// 길다싶으면 세로쓰기 
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_REMAIN_SEAT_WITH_TOTAL);
		psmt.setString(1, ticketMovieDate);
		psmt.setString(2, ticketMovieNo);
		psmt.setString(3, ticketTheaterNo);
		psmt.setString(4, ticketScreenNo);
		
		ResultSet rs = psmt.executeQuery();
		
		List<List<Integer>> seats = new ArrayList<>();
		
		
		while(rs.next()) {
		
			List<Integer> seat = new ArrayList<>();
			
			seat.add(rs.getInt(1));
			seat.add(rs.getInt(2));
			
			seats.add(seat);
			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return seats;
	}
	
	
	
	// 좌석선택 넘어가기전에..  영화선택을하겠다. 
	public MovieVO selectMovie(String movie_no) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIE);
		
		ResultSet rs = psmt.executeQuery();
		
		MovieVO mvo = null;

		if(rs.next()) {
			
			mvo = new MovieVO();
			
			mvo.setMovie_no(rs.getInt(1));
			mvo.setMovie_title(rs.getString(2));
			mvo.setMovie_grade(rs.getString(3));
			mvo.setMovie_company(rs.getString(4));
			mvo.setMovie_score(rs.getDouble(5));
			mvo.setMovie_ticket_rate(rs.getDouble(6));
			mvo.setMovie_release_date(rs.getString(7));
			mvo.setMovie_genre(rs.getString(8));
			mvo.setMovie_country(rs.getString(9));
			mvo.setMovie_running_time(rs.getInt(10));
			mvo.setMovie_homepage(rs.getString(11));
			mvo.setMovie_poster(rs.getString(12));
			mvo.setMovie_desc(rs.getString(13));
			mvo.setMovie_director(rs.getString(14));
			mvo.setMovie_actor(rs.getString(15));
			
		}
		
		psmt.close();
		conn.close();
		
		return mvo;
		
	}
	
	
	public void insertMovie() throws Exception{}
	public void updateMovie() throws Exception{}
	public void deleteMovie() throws Exception{}
	
	
	
	
	// 포스터 선택 (메인 좌롤링배너 10개)	
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
	
	
	
	
	// 좌석선택	
	public List<List<SeatVO>> selectSeat( String theaterNo,
											String screenNo,
											String movieDate,
											String movieNo,
											String roundView ) throws Exception{
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_SEAT);
		
		psmt.setString(1,  theaterNo);
		psmt.setString(2,  screenNo);
		psmt.setString(3,  screenNo);
		psmt.setString(4,  movieNo);
		psmt.setString(5,  movieDate);
		psmt.setString(6,  roundView);
		
		ResultSet rs = psmt.executeQuery();
		
		List<List<SeatVO>>	list1 = new ArrayList<>();
		List<SeatVO>		list2 = null;
		
		// 여기서는 로직이 들어가는게 안좋음. 데이터 빨리받아서 빨리 넘겨줘. 
		while(rs.next()) {
			
			if(rs.getInt(4) == 1) {
				
				if(list2 != null){
						list1.add(list2);
					}
				
				list2 = new ArrayList<>();
			} 
			
			SeatVO svo = new SeatVO();
			svo.setSeat_theater_no(rs.getString(1));
			svo.setSeat_screen_no(rs.getString(2));
			svo.setSeat_row(rs.getString(3));
			svo.setSeat_column(rs.getString(4));
			svo.setTicket_is_valid(rs.getString(5));
			
			list2.add(svo);
		}
		
		list1.add(list2);
		
		rs.close();
		psmt.close();
		conn.close();
		
		return list1;
	}
	
	
	
	
	
	public List<SeatVO> selectSeatTotalByRow (String theaterNo,	String screenNo ) throws Exception{

		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_SEAT_TOTAL_BY_ROW);
		
		psmt.setString(1,  theaterNo);
		psmt.setString(2,  screenNo);

		ResultSet rs = psmt.executeQuery();
		
		List<SeatVO> list = new ArrayList<>();
		
		// 여기서는 로직이 들어가는게 안좋음. 데이터 빨리받아서 빨리 넘겨줘. 
		while(rs.next()) {
		
		SeatVO svo = new SeatVO();
			svo.setSeat_theater_no(rs.getString(1));
			svo.setSeat_screen_no(rs.getString(2));
			svo.setSeat_row(rs.getString(3));
			svo.setSeat_column(rs.getString(4));
			svo.setTicket_is_valid(rs.getString(5));
			
			list.add(svo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return list;
		
	}
	
	
	
	// 좌석선택 하단에 선택영화 출력용 
	public MovieScheduleVO selectMovieScheduleWithTheater(String movieNo,
											   String theaterNo,
											   String screenNo,
											   String movieDate,
											   String roundView ) throws Exception {

		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIE_SCHEDULE_WITH_THEATER);
		
		psmt.setString(1, movieNo);
		psmt.setString(2, theaterNo);
		psmt.setString(3, screenNo);
		psmt.setString(4, movieDate);
		psmt.setString(5, roundView);
		
		ResultSet rs = psmt.executeQuery();
				
		MovieScheduleVO msvo = null;
		
		if(rs.next()) {
			
			msvo = new MovieScheduleVO();
			
			msvo.setSchedule_theater_no(rs.getString(1));
			msvo.setSchedule_screen_no(rs.getString(2));
			msvo.setSchedule_movie_no(rs.getString(3));
			msvo.setSchedule_date(rs.getString(4));
			msvo.setSchedule_start_time(rs.getString(5));
			msvo.setSchedule_end_time(rs.getString(6));
			msvo.setSchedule_round_view(rs.getString(7));
			msvo.setTheater_name(rs.getString(8));
			msvo.setScreen_name(rs.getString(9));
		
			
		}
		rs.close();
		psmt.close();
		conn.close();
		
		return msvo;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
