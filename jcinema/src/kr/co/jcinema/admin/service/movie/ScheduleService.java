package kr.co.jcinema.admin.service.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jcinema.admin.dao.AdminMovieDAO;
import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.controller.CommonService;

public class ScheduleService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("post")) {
			
			String theater_no =req.getParameter("teater_no");
			String screen_no =req.getParameter("screen_no");
			String schedule_movie_no =req.getParameter("schedule_movie_no");
			String schedule_date =req.getParameter("schedule_date");
			String schedule_start_time =req.getParameter("schedule_start_time");
			String schedule_end_time =req.getParameter("schedule_end_time");
			String schedule_round_view =req.getParameter("schedule_round_view");
			
			MovieScheduleVO msv = new MovieScheduleVO();
			msv.setSchedule_theater_no("theater_no");
			msv.setSchedule_screen_no("screen_no");
			msv.setSchedule_movie_no("schedule_movie_no");
			msv.setSchedule_date("schedule_date");
			msv.setSchedule_start_time("schedule_start_time");
			msv.setSchedule_end_time("schedule_end_time");
			msv.setSchedule_round_view("schedule_round_view");
			
			AdminMovieDAO dao = AdminMovieDAO.getInstance();
			dao.insertMovieSchedule(msv);
					
			return "redirect:/jcinema/admin/movie/schedule";
			
		}else {
			return "/admin/movie/schedule.jsp";
		}
		
	}

}
