package kr.co.jcinema.service.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
import kr.co.jcinema.vo.MovieVO;

public class PostersService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//제이슨으로 포스터 이름 10개 출력  		
		MovieDAO dao = MovieDAO.getInstance();
		List<MovieVO> posters = dao.selectPosters();

		String json = new Gson().toJson(posters);
		return json;
		
		
		
		
//		JSONObject json = new JSONObject();
//		
//		for(int i=0; i<posters.size(); i++) {
//			
//			String name = "poster"+(i+1);
//			MovieVO vo = posters.get(i);
//			json.put(name,vo.getMovie_poster());
//		}
//		
//		return json.toString();		
		
		
	}
	

}
