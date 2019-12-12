package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.BoardVO;
import kr.co.farmstory2.vo.UserVO;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String uid = req.getParameter("uid");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String title = getCategoryTitle(cate);
		
		if(pg ==null) {
			pg = "1";
		};
		
		BoardDAO dao = BoardDAO.getInstance();
		
		// 페이지 관련 변수 선언		
		int total		= dao.selectArticleTotal(cate);
		int lastPage	= 0; 
		int listCount	= 0;
		int currentPg	= Integer.parseInt(pg);
		int limitBegin	= (currentPg - 1) *10; 
		int groupCurrent = (int)Math.ceil(currentPg / 10.0);
		int groupStart	= (groupCurrent-1) * 10 +1;
		int groupEnd	= groupCurrent * 10;

		if(total % 10 != 0){
			lastPage  = total / 10 + 1;	
		}else{
			lastPage  = total / 10;
		}
		
		if(groupEnd > lastPage) {
			groupEnd = lastPage;
		}
		
		listCount = total - limitBegin;
		
		List<BoardVO> articleList = dao.selectArticleList(cate, limitBegin);

		req.setAttribute("articleList",articleList);
		req.setAttribute("boardGroup",group);
		req.setAttribute("category",cate);
		req.setAttribute("title",title);		
		req.setAttribute("groupStart",groupStart);
		req.setAttribute("groupEnd",groupEnd);
		req.setAttribute("listCount",listCount+1);
		
		
		return "/board/list.jsp";
		
	}

	public String getCategoryTitle(String cate) {
		
					// title 빈문자열로 선언. 
		String title = "";		
		
		switch (cate) {
		case "market":title="장보기"; break;
		case "story":title="농작물이야기"; break;
		case "grow":title="텃밭가꾸기"; break;
		case "school":title="귀농학교"; break;
		case "event":title="이벤트"; break;
		case "notice":title="공지사항"; break;
		case "menu":title="오늘의식당"; break;
		case "chef":title="나도요리사"; break;
		case "qna":title="고객문의"; break;
		case "faq":title="자주묻는 질문"; break;
		
		}
		return title;
		
		
	}
	
	
	
}
