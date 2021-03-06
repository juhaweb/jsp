package kr.co.jcinema.admin.service.api;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.admin.dao.AdminApiDAO;
import kr.co.jcinema.admin.vo.TheaterVO;
import kr.co.jcinema.controller.CommonService;

public class TheatersService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// ajax 로 요청할거임 : 전국의 도시 영화관 다 가져오기. 
		
		AdminApiDAO dao = AdminApiDAO.getInstance();
		Map<String, List<TheaterVO>> map = dao.selectTheaters();
		
		String json = new Gson().toJson(map);
		
		return json;
	}

}
