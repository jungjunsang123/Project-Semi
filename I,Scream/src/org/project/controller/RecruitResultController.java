package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecruitResultController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("url", "/apply/recruitResult.jsp");
		request.setAttribute("bbs_no",request.getAttribute("bbs_no"));
		request.setAttribute("id",request.getAttribute("id"));
		return "template/bbs-layout.jsp";
	}

}
