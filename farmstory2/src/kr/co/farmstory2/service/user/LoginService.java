package kr.co.farmstory2.service.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.websocket.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.vo.UserVO;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		if(req.getMethod().equals("POST")) {
			
			// �Ķ���� ����
			String uid  = req.getParameter("uid");
			String pass = req.getParameter("pass");

			UserDAO dao = UserDAO.getInstance();
			UserVO uv   = dao.selectUser(uid, pass);
					
			if(uv != null) {

				// ȸ���� ������ 
				// ��������
				HttpSession session = req.getSession();
				session.setAttribute("user",uv);
				
				// ����Ʈ�� �̵�
				return "redirect:/farmstory2/index.do";
			
			}else {
				// ȸ���� �ƴϸ�
				return "redirect:/farmstory2/user/login.do";
			}
				
		}else {
			
			return "/user/login.jsp";	
		}
				
	}

}