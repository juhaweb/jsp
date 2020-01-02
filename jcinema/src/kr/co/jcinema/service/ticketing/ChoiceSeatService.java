package kr.co.jcinema.service.ticketing;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
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
		
		List<List<SeatVO>> seatList = dao.selectSeat(theaterNo, screenNo, movieDate, movieNo, roundView);
	
		req.setAttribute("seatList", seatList);
		// 뷰에서 공유하기 위해 리퀘스트 객체에 지정. 
		
		// JSON 테스트 출력
		String json = new Gson().toJson(seatList);
		
		return "/ticketing/choice-seat.jsp";
		// return json;
		
	}

	
	
}
