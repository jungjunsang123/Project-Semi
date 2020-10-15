package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberDAO;

public class IdCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		boolean flag=MemberDAO.getInstance().idcheck(id);
		String result="fail";
		if(flag==false)
			result="ok";
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
