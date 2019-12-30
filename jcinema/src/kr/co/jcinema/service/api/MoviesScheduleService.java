package kr.co.jcinema.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;

public class MoviesScheduleService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// moviesService 내용 가져와야함.. 
		String theater_no = req.getParameter("theater_no");
		String movie_no = req.getParameter("movie_no");
		String schedule_date = req.getParameter("schedule_date");
		
		// 다오 !! 
		MovieDAO dao = MovieDAO.getInstance();
		List<List<MovieScheduleVO>> movies = dao.selectMovieRoundView(schedule_date, theater_no, movie_no);
		
		String json = new Gson().toJson(movies);
		
		return json;
		
		
		// http://localhost:8085/jcinema/api/movies-schedule?schedule_date=2020-01-04&theater_no=24&movie_no=56
	}

	
	
}
