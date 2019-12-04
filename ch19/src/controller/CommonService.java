package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {
	
	// 1. 공통의 멤버 매서드 
	public String requestProc(HttpServletRequest req, HttpServletResponse resp);
	
	
}
