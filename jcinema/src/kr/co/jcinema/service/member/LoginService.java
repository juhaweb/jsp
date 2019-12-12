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
			
			// �Ķ���� ����
			String user_id  = req.getParameter("uid");
			String user_pw = req.getParameter("pass");

			MemberDAO dao = MemberDAO.getInstance();
			MemberVO mvo   = dao.selectMember(user_id, user_pw );
					
			if(mvo != null) {

				// ȸ���� ������ 
				// ��������
				HttpSession session = req.getSession();
				session.setAttribute("user",mvo);
				
				// ����Ʈ�� �̵�
				return "redirect:/jcinema/";
			
			}else {
				// ȸ���� �ƴϸ�
				return "redirect:/jcinema/member/login";
			}
				
		}else {
			
		return "/member/login.jsp";
	}

}
	
}
