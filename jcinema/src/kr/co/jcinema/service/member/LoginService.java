package kr.co.jcinema.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			// 파라미터 수신
			String user_id  = req.getParameter("uid");
			String user_pw = req.getParameter("pass");

			MemberDAO dao = MemberDAO.getInstance();
			MemberVO mvo   = dao.selectMember(user_id, user_pw );
					
			// 회원여부 확인해서 세션처리. 
			if(mvo != null) {

				// 회원이 맞으면 (세션저장. 메인으로 이동) 
				HttpSession session = req.getSession();
				session.setAttribute("user",mvo);
				// 리스트로 이동
				return "redirect:/jcinema/";
			
			}else {
				// 회원이 아니면
				return "redirect:/jcinema/member/login?success=fail";
			}
			
				
		}else {
			
		return "/member/login.jsp";
	}

}
	
}
