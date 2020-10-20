package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.ReviewDAO;
import org.project.model.ReviewVO;


public class ReviewDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String bbs_no=request.getParameter("bbs_no");
		ReviewVO rVO=ReviewDAO.getInstance().reviewDetailById(bbs_no, id);
		request.setAttribute("rvo", rVO);
		request.setAttribute("url", "/bbs_review/reviewDetail.jsp");
		return "template/bbs-layout.jsp";
	}

}
