package kr.co.farmstory2.service.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class ChefService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		return "/community/chef.jsp";
		
	}

}
