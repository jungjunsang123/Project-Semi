package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.PagingBean;
import org.project.model.ReviewDAO;
import org.project.model.ReviewListVO;
import org.project.model.ReviewVO;

public class ReviewListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int totalPostCount=ReviewDAO.getInstance().getTotalReviewCount();
		String pageNo=request.getParameter("pageNo");
		PagingBean PagingBean=null;
		if(pageNo==null) {
			PagingBean=new PagingBean(totalPostCount);
		}
			
		else
			PagingBean=new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		ArrayList<ReviewVO> reviewList=ReviewDAO.getInstance().getReviewList(PagingBean);
		ReviewListVO reviewListVO=new ReviewListVO(reviewList, PagingBean);
		request.setAttribute("rlvo", reviewListVO);
		request.setAttribute("url", "/bbs_review/reviewList.jsp");
		return "/template/bbs-layout.jsp";
		
	}

}