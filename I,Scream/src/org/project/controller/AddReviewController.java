package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSVO;
import org.project.model.MemberVO;
import org.project.model.ReviewDAO;
import org.project.model.ReviewVO;

public class AddReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		
		if(session!=null&&session.getAttribute("mvo")!=null) {
			MemberVO vo= (MemberVO) session.getAttribute("mvo");
			String id = vo.getId();
			String BBS_NO = ReviewDAO.getInstance().getBBS_NO(id);
			String rc = request.getParameter("review_content");
			int stars = Integer.parseInt(request.getParameter("reviewstar"));
			BBSVO bvo = new BBSVO();
			bvo.setBbs_no(BBS_NO);
			bvo.setContext(rc);
			ReviewDAO.getInstance().reviewAdd(bvo,stars);
		}else
			return "/member/IsNotLogin.jsp";
		return "redirect:bbs_review/addReview_Result.jsp";
	}

}
