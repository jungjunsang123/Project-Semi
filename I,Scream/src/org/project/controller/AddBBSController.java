package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class AddBBSController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("Login")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("Login");
			String title = request.getParameter("title");
			String context = request.getParameter("context");
			String category = request.getParameter("category");
			String workTime = request.getParameter("workTime");
			BBSVO bbsvo = new BBSVO(mvo, title, context, category, workTime);
			BBSDAO.getInstance().addBBS(bbsvo);
			url="/bbs/addBBS_result.jsp";
		}
		else {
			url="member/sessionOut.jsp";
		}
		request.setAttribute("url", url);
		
		return "redirect:template/layout.jsp";
	}

}
