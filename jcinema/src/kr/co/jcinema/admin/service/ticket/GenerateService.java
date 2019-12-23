package kr.co.jcinema.admin.service.ticket;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jcinema.admin.dao.AdminTicketDAO;
import kr.co.jcinema.admin.vo.TicketVO;
import kr.co.jcinema.controller.CommonService;

public class GenerateService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("POST")) {
			
			// 포스트로 generate.jsp에서 받아옴. 
			String theater_no	 = req.getParameter("theater_no");
			String screen_no	 = req.getParameter("screen_no");
			String movie_no 	 = req.getParameter("movie_no");
			String movie_date 	 = req.getParameter("movie_date");
			String round_view 	 = req.getParameter("round_view");
			String price 	 	 = req.getParameter("price");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String today = sdf.format(new Date());
			
			
			// 티켓 코드생성
			char[] seat_alphabet = {'A','B','C','D','E','F','G','H'};
			String ticket_no = theater_no+screen_no+movie_no+today+round_view;
			
			AdminTicketDAO dao = AdminTicketDAO.getInstance();
			

			// 2중포문이여.. 8row 10col이라.. 
			
			for(int row=1; row<=seat_alphabet.length; row++) {
			
				for(int col=1; col<=10; col++) {
					
									// 그냥 + 하면 연산이 되기 때문에 가운데 문자열 넣음. 
				String seat_no = row+""+col;
				
				// 티켓 객체
				TicketVO tvo = new TicketVO();
				tvo.setTicket_no(ticket_no+seat_no);
				tvo.setTicket_movie_no(movie_no);
				tvo.setTicket_movie_date(movie_date);
				tvo.setTicket_round_view(round_view);
				tvo.setTicket_theater_no(theater_no);
				tvo.setTicket_screen_no(screen_no);			
				tvo.setTicket_seat(seat_alphabet[row-1]+""+col);
				tvo.setTicket_price(price);
				
				dao.insertTicket(tvo);
				
				}
			}
			
			
			
			return "redirect:/jcinema/admin/ticket/generate";
			
		}else {
		
			return "/admin/ticket/generate.jsp";
			
		}
				
	}

}
