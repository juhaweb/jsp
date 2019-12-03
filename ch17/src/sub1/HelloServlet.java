package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

		public HelloServlet() {
			System.out.println("HelloServlet ��ü ����");
		}
	
		@Override
		public void init(ServletConfig config) throws ServletException {
			System.out.println("HelloServlet init ����!");
		}
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			requestProc(req, resp);
		}
		
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			requestProc(req, resp);
		}

		
		public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// doGet�̶� doPost�� ����ó���� �ϱ⶧���� 
				
			resp.setContentType("text/html;charset=utf-8");
			
			PrintWriter out = resp.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<title>HelloServlet</title>");
			out.println("<meta charset='UTF-8'/>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Hello Servlet !!! </h1>");
			out.println("</body>");
			out.println("</html>");
			
			
		}
		
		
		
		
}
