package mygolf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionCheckInter extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println("preHandle : " + session.getId());
		
		String id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
			response.sendRedirect("login.do");
			return false;
		}
		
		return true;
	}
}
