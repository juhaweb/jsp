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
	
	//������ �ĺ��� (��ȣ)
	private static final long serialVersionUID = 1L;

	
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
			fis.cloase();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 5. prop(������Ƽ) ��ü�� key-value���� value���� ��ü�� ���� (model package�ȿ��ִ¾ֵ�)
		
		
		
		
		
		
	
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
