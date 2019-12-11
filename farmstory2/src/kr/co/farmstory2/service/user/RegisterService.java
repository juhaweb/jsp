package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.vo.UserVO;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			
		if(req.getMethod().equals("POST")) {
			String uid   = req.getParameter("uid");
			String pass1 = req.getParameter("pass1");
			String name  = req.getParameter("name");
			String nick  = req.getParameter("nick");
			String email = req.getParameter("email");
			String hp	 = req.getParameter("hp");
			String zip	 = req.getParameter("zip");
			String addr1 = req.getParameter("addr1");
			String addr2 = req.getParameter("addr2");
			String regip = req.getRemoteAddr();

			UserVO uv = new UserVO();
			uv.setUid(uid);
			uv.setPass(pass1);
			uv.setName(name);
			uv.setNick(nick);
			uv.setEmail(email);
			uv.setHp(hp);
			uv.setZip(zip);
			uv.setAddr1(addr1);
			uv.setAddr2(addr2);
			uv.setRegip(regip);
			
			UserDAO dao = UserDAO.getInstance();
			dao.insertUser(uv);
			
			return "redirect:/farmstory2/";
			
		}else {
			
			return "/user/register.jsp";
			
		}
		
	}

}