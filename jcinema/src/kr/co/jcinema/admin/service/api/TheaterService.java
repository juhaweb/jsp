package kr.co.jcinema.admin.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.admin.dao.AdminApiDAO;
import kr.co.jcinema.admin.vo.TheaterVO;
import kr.co.jcinema.controller.CommonService;

public class TheaterService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// ajax로 요청할거임 : 도시에 대한 영화관 가져오기
		String city = req.getParameter("city");
		AdminApiDAO dao = AdminApiDAO.getInstance();
		List<TheaterVO> theaters = dao.selectTheater(city);
		
		String json = new Gson().toJson(theaters);
		return json;
		
	}

}
