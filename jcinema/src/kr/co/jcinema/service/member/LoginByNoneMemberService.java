package kr.co.jcinema.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class LoginByNoneMemberService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String birth = req.getParameter("birth");
		String pass = req.getParameter("pass1");
		String regip = req.getRemoteAddr();

		MemberVO mvo = new MemberVO();
		mvo.setUser_id(hp);
		mvo.setUser_pass(pass);
		mvo.setUser_name(name);
		mvo.setUser_tel(birth);
		mvo.setUser_hp(hp);
		mvo.setUser_grade(1);
		mvo.setUser_regip(regip);
				
		MemberDAO dao= MemberDAO.getInstance();
		int result= dao.selectCheckUid(hp);
		
		if(result == 1) {
			dao.updateMember(mvo);
		}else {
			dao.insertMember(mvo);
		}

		
		// 官肺 技记贸府(历厘)		
		HttpSession session = req.getSession();
		session.setAttribute("member", mvo);		
		
		return "redirect:/jcinema/";
		
	}
		
	
	
	
	
}
