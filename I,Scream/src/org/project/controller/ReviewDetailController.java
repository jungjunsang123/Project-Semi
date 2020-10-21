package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ReviewDAO;
import org.project.model.ReviewVO;


public class ReviewDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session!=null&&session.getAttribute("mvo")!=null) {
			String id=request.getParameter("id");
			String bbs_no=request.getParameter("bbs_no");
			ReviewVO rVO=ReviewDAO.getInstance().reviewDetailById(bbs_no, id);
			request.setAttribute("rvo", rVO);
			request.setAttribute("url", "/bbs_review/reviewDetail.jsp");
		}else {
			return "/member/IsNotLogin.jsp";
		}	
		return "template/bbs-layout.jsp";
	}
}
