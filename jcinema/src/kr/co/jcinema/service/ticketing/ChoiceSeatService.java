package kr.co.jcinema.service.ticketing;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
import kr.co.jcinema.vo.MovieScheduleVO;
import kr.co.jcinema.vo.MovieVO;
import kr.co.jcinema.vo.SeatVO;

public class ChoiceSeatService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String theaterNo = req.getParameter("theater_no");
		String screenNo = req.getParameter("screen_no");
		String movieDate = req.getParameter("movie_date");
		String movieNo = req.getParameter("movie_no");
		String roundView = req.getParameter("round_view");
				
		MovieDAO dao = MovieDAO.getInstance();
		
		MovieVO mvo = dao.selectMovie(movieNo);
		MovieScheduleVO msvo = dao.selectMovieScheduleWithTheater(movieNo, theaterNo, screenNo, movieDate, roundView);
				
		List<List<SeatVO>> seatList = dao.selectSeat(theaterNo, screenNo, movieDate, movieNo, roundView);
			
		char row[] = {'A','B','C','D','E','F','G','H','I'};
		
						// 얘는 이름이라 아무렇게나 해도 돼. view에서 사용하는거임. 
		req.setAttribute("mInfo", mvo);
		req.setAttribute("mSchedule", msvo);
		req.setAttribute("setRow", row);
		req.setAttribute("seatList", seatList);
		// 뷰에서 공유하기 위해 리퀘스트 객체에 지정. 
		
		// JSON 테스트 출력
		// String json = new Gson().toJson(seatList);
		// return json;
		
		return "/ticketing/choice-seat.jsp";
		
	}

	
	
}
