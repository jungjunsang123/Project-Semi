package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;





public class ApplyFormController implements Controller {
// detailPost.jsp -> 로그인 한사람이 지원하기 버튼을 누름 -> controller -> 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//로그인 세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {// 안끊겼을때
			String bbs_no=request.getParameter("bbs_no");
			String id=request.getParameter("vo");
			ApplyDAO.getInstance().apply(bbs_no,id);
			request.setAttribute("url","/bbs/detailPost.jsp");
		}
		else {//회원 세션이 끊김
			 url="/template/layout.jsp";
			 return url;
		}
		//처리한정보를 bbs-layout.jsp로 보냄
		return "/template/bbs-layout.jsp";
	}

}
