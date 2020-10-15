package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.BBSDAO;

public class YoungPostCountController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int count=BBSDAO.getInstance().countAllPosting();
		request.setAttribute("youngCount", count);
		return "test.jsp";
	}

}
