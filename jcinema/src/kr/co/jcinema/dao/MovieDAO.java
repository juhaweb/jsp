package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MovieVO;

public class MovieDAO {
	
	//½Ì±ÛÅæ °´Ã¼
	private static MovieDAO instance = new MovieDAO();

	public static MovieDAO getInstance() {
		return instance;	
	}

	private MovieDAO() {}

	
	// ¡Ú Æ÷½ºÅÍ ¼±ÅÃ (¸ÞÀÎ ÁÂ·Ñ¸µ¹è³Ê 10°³)
	
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
	
	
	

	

	
	public void selectMovies() throws Exception{}
	public void selectMovie() throws Exception{}
	public void insertMovie() throws Exception{}
	public void updateMovie() throws Exception{}
	public void deleteMovie() throws Exception{}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
