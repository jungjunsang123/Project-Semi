package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddReviewFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";
		if(session != null && session.getAttribute("mvo")!=null)
			url="/bbs_review/addReview.jsp";
		else
			url="/member/IsNotLogin.jsp";
		request.setAttribute("url", url);
		
		return "template/bbs-layout.jsp";
	}

}
