package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.ApplyVO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class findApplyListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			ArrayList<BBSVO> list = ApplyDAO.getInstance().findApplyList(mvo.getId());
			request.setAttribute("ApplyList", list);
				url="/apply/findApplyList.jsp";
		}
		else {
			url="/member/IsNotLogin.jsp";
		}
		request.setAttribute("url", url);
		return "/template/mypage-layout.jsp";

	}

}
