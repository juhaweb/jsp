package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDAO;
import kr.co.board2.vo.BoardMemberVO;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		if(req.getMethod().equals("POST")) {
			
			// 파라미터 수신
			String uid  = req.getParameter("uid");
			String pw   = req.getParameter("pass");

			UserDAO dao = UserDAO.getInstance();
			BoardMemberVO bmv = dao.selectUser(uid,pw);
			
			if(bmv != null) {
				// 아이디, 비번에 해당하는 회원이 있을 경우 
				// 세션처리
				HttpSession session = req.getSession();
				session.setAttribute("member", bmv);
				
				// 리스트로 이동
				return "redirect:/Board2/list.do";
				
			}else {
				// 아이디, 비번에 해당하는 회원이 없을 경우 
				return "redirect:/Board2/user/login.do";
			}		
					
			
		}else {
			return "/user/login.jsp";	
		}
				
	}

}