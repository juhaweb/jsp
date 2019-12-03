package sub2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet {
	
	public WelcomeServlet() {
		System.out.println("°´Ã¼»ý¼º");
	}
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>WelcomeServlet</title>");
		out.println("<meta charset='UTF-8'/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Welcome Servlet !!! </h1>");
		out.println("<a href='#'>Welcome</a>");
		out.println("</body>");
		out.println("</html>");
	}
	

	
	
	
}
