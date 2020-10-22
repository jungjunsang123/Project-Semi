package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.ListVO;
import org.project.model.MemberDAO;
import org.project.model.MemberVO;
import org.project.model.PagingBean;
import org.project.model.ReviewDAO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		MemberVO vo=MemberDAO.getInstance().login(id, password);
		if(vo==null) {
			return "/member/login-fail.jsp"; //로그인 실패 화면
		}else {
			vo.setstar(ReviewDAO.getInstance().getAVGStarById(vo.getId()));
			HttpSession session=request.getSession();
			//내가 지원한 게시물의 endwork 알리는 영역;
			ApplyDAO.getInstance().applyEndWork(id);
			//내가 작성한 게시물의 endwork 알리는 영역;
			ApplyDAO.getInstance().writerEndWork(id);
			ArrayList<BBSVO> list=BBSDAO.getInstance().mustReview(id);
			//써야할 리뷰가 있다.
			if(list.size()>0) {
				request.setAttribute("MustReviewPost", list.get(0));
				request.setAttribute("MustReviewPostSize", list.size());
			}
			session.setAttribute("mvo", vo);
			return "front?command=home"; //로그인 성공 화면 홈으로 
		}
	}
}
