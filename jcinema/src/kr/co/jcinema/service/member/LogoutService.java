package kr.co.jcinema.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jcinema.controller.CommonService;


public class LogoutService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		// ���ǿ� �ִ� ��� ������ �ʱ�ȭ 
		HttpSession session = req.getSession();
		session.invalidate();
		
		// �α��� �������� �̵�
		return "redirect:/jcinema/member/login";
	
	
	
	}
	
}
