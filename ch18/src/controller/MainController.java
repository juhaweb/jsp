package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
	
	//서블릿의 식별값 (번호)
	private static final long serialVersionUID = 1L;

	
	@Override
	public void init(ServletConfig config) throws ServletException {
	
		// 1. 프로퍼티 파일 경로 구하기
		
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";

		Properties prop = new Properties();
 
		try {
			// 2. 프로퍼티 파일과 스트림 연결
			FileInputStream fis = new FileInputStream(path);
			// 3. 스트림으로 데이터 읽어서 prop 객체에 저장 (hashmap)
			prop.load(fis);
			// 4.스트림 해제
			fis.cloase();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 5. prop(프로퍼티) 객체의 key-value에서 value값을 객체로 생성 (model package안에있는애들)
		
		
		
		
		
		
	
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
