package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddPostFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {
			url="/bbs/addPostForm.jsp";
		}
		else {
			url="/member/IsNotLogin.jsp";
		}
		request.setAttribute("url", url);
		
		return "template/bbs-layout.jsp";
	}

}
