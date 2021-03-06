package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class ViewService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// 그룹 카테 타이틀 얻기
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String title = getCategoryTitle(cate);
		
		req.setAttribute("boardGroup",group);
		req.setAttribute("category",cate);
		req.setAttribute("title",title);		
		
		return "/board/view.jsp";
		
	}

	
	// 카테고리 리스트 얻기 
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
