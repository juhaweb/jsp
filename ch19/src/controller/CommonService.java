package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {
	
	// 1. ������ ��� �ż��� 
	public String requestProc(HttpServletRequest req, HttpServletResponse resp);
	
	
}
