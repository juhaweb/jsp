package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.CommonService;

public class LoginService implements CommonService {
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("POST")) {

			String uid 	= req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			req.setAttribute("uid", uid);
			req.setAttribute("pass", pass);
						
			
			return "/loginResult.jsp";
						
		}else {
			
			return  "/login.jsp";
			
		}
		
	}
	
	
	
}
