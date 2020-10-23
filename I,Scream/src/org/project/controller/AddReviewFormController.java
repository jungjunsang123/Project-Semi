package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;
import org.project.model.ReviewDAO;
import org.project.model.ReviewVO;


public class AddReviewFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String url ="";
		if(session != null && session.getAttribute("mvo")!=null) {
			MemberVO vo = (MemberVO)session.getAttribute("mvo");
			//게시물 번호 검색
			String bbs_no = request.getParameter("bbs_no");
			BBSVO bvo = BBSDAO.getInstance().detailPostingByNo(bbs_no);
			request.setAttribute("bvo", bvo);
			//리뷰를 받는사람의 정보 출력
			ReviewVO rvo = ReviewDAO.getInstance().reviewDetailById(bbs_no,vo.getId());
			MemberVO grvo = rvo.getGetReviewer();
			request.setAttribute("grvo", grvo);

			url="/bbs_review/addReview.jsp";
		}else {
			url="/member/IsNotLogin.jsp";
		}
		request.setAttribute("url", url);
		
		return "template/bbs-layout.jsp";
	}

}
