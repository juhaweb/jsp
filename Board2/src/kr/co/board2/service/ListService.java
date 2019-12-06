package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.BoardDAO;
import kr.co.board2.vo.BoardArticleVO;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String pg = req.getParameter("pg");
		
		if(pg == null){
			pg = "1";
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		
		// 페이지 관련 변수선언
		int total      = dao.selectArticleTotal();
		int lastPage   = 0;
		int listCount  = 0; 
		
		if(total % 10 != total) {
			lastPage = total / 10 + 1; 
		}else {
			lastPage = total / 10; 
		}
		
		int currentPg  = Integer.parseInt(pg);
		int limitBegin = (currentPg - 1) * 10;
		int groupCurrent = (int)Math.ceil(currentPg / 10.0);
		int groupStart   = (groupCurrent - 1) * 10 + 1;
		int groupEnd     = groupCurrent * 10;
		if(groupEnd > lastPage) {
			groupEnd = lastPage;
		}
		
		listCount = total - limitBegin;

		List<BoardArticleVO>articleList = dao.selectArticles(limitBegin);
				
		// view에서 데이터 출력을 위해 저장
		req.setAttribute("articleList", articleList);
		req.setAttribute("listCount", listCount+1);
		req.setAttribute("currentPg", currentPg);
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		
		
		return "/list.jsp";
	}

	
	
}

