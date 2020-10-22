package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;
import org.project.model.PagingBean;

public class HomeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		
		if(session !=null&&session.getAttribute("mvo")!=null) {
			MemberVO vo = (MemberVO)session.getAttribute("mvo");
			String id = vo.getId();
			//내가 지원한 게시물의 endwork 알리는 영역;
			ApplyDAO.getInstance().applyEndWork(id);
			//내가 작성한 게시물의 endwork 알리는 영역;
			ApplyDAO.getInstance().writerEndWork(id);
			int totalPostCount = BBSDAO.getInstance().getTotalPostCount();
			PagingBean pagingBean = new PagingBean(totalPostCount);
			ArrayList<BBSVO> list=BBSDAO.getInstance().mustReview(pagingBean, id);
			//써야할 리뷰가 있다.
			if(list.size() >0) {
				request.setAttribute("MustReviewPost", list.get(0));
				request.setAttribute("MustReviewPostSize", list.size());
			}

		}
		request.setAttribute("url", "/home.jsp");

		return "/template/layout.jsp";
	}
}


