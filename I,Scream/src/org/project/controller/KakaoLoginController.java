package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberDAO;
import org.project.model.MemberVO;
import org.project.model.ReviewDAO;

public class KakaoLoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String result="";
		MemberVO vo = new MemberVO(id, "NULL", name, "NULL");
		boolean register_flag = MemberDAO.getInstance().idcheck(id);
		//회원가입이 안된 상태
		if(!register_flag)
			MemberDAO.getInstance().register(vo);
		
		HttpSession session = request.getSession();
		vo.setstar(ReviewDAO.getInstance().getAVGStarById(vo.getId()));
		session.setAttribute("mvo", vo);
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
		//로그아웃처리할때 확인하기 위함
		session.setAttribute("IsKakaoLogin", "YES");
		result = name;
		request.setAttribute("responsebody", result);
		return "AjaxView";	
	}

}
