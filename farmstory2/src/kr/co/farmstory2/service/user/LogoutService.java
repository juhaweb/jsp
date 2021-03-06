package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.controller.CommonService;

public class LogoutService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		// 세션에 있는 모든 데이터 초기화 
		HttpSession session = req.getSession();
		session.invalidate();
		
		// 로그인 페이지로 이동
		return "redirect:/farmstory2/";
		
	}

}
