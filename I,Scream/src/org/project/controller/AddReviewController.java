package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.MemberVO;
import org.project.model.ReviewDAO;
import org.project.model.ReviewVO;

public class AddReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  HttpSession session = request.getSession(false); 
		  if(session==null||session.getAttribute("mvo")==null||request.getMethod().equals("post")==false) {
			  return "redirect:index.jsp";
		  }else {
		  String review_context = request.getParameter("review_context");
		  
		  ReviewVO rvo=new ReviewVO();
		  rvo.setReview_context(review_context);
		  rvo.setGiveReviewer((MemberVO)session.getAttribute("mvo"));
		  ReviewDAO.getInstance().reviewAdd(rvo);
		  }
		  
		return "redirect:bbs_review/addReview.jsp";
	}

}
