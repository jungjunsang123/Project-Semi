package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;

public class getPostListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<BBSVO> postList =BBSDAO.getInstance().getAllList();
		request.setAttribute("postList", postList);
		return "test.jsp";
	}

}
