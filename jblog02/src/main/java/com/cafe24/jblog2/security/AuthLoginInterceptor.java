package com.cafe24.jblog2.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.jblog2.service.UserService;
import com.cafe24.jblog2.vo.UserVo;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
//		ApplicationContext ac = 
//		WebApplicationContextUtils.
//		getWebApplicationContext(request.getServletContext());
//		UserService userService = ac.getBean(UserService.class);
		
		UserVo userVo = new UserVo();
		userVo.setId(id);
		userVo.setPassword(password);
		
		UserVo authUser = userService.login(userVo);
		if(authUser == null) {
			response.sendRedirect(request.getContextPath() + "/user/login");
			return false;
		}
		
		// session 처리
		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", authUser);
		response.sendRedirect( request.getContextPath() );

		return false;
	}

}
