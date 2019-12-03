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
	
	//������ �ĺ��� (��ȣ)
	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
	
		// 1. ������Ƽ ���� ��� ���ϱ�
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";

		Properties prop = new Properties();
 
		try {
			// 2. ������Ƽ ���ϰ� ��Ʈ�� ����
			FileInputStream fis = new FileInputStream(path);
			// 3. ��Ʈ������ ������ �о prop ��ü�� ���� (hashmap)
			prop.load(fis);
			// 4.��Ʈ�� ����
			fis.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 5. prop(������Ƽ) ��ü�� key-value���� value���� ��ü�� ���� (model package�ȿ��ִ¾ֵ�)
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
	
	// 6. ��Ŭ���� ����
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
