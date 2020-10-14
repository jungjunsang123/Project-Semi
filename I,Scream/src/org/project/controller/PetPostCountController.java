package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.BBSDAO;

public class PetPostCountController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int count=BBSDAO.getInstance().countAllPosting();
		request.setAttribute("petCount", count);
		return "test.jsp";
	}

}
