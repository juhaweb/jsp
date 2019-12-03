package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
	
	//서블릿의 식별값 (번호)
	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	
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
			fis.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 5. prop(프로퍼티) 객체의 key-value에서 value값을 객체로 생성 (model package안에있는애들)
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()){
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				instances.put(k,instance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
					
		}
		
		
		
	
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	// 6. 모델클래스 실행
	public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getContextPath();
		String uri = req.getRequestURI();
				
		String action = uri.substring(path.length());
		
		CommonService instance = (CommonService) instances.get(action);
		String view = instance.requestProc(req, resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req,resp);
			
		
	}
	
}
