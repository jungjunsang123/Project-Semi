package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class GetProfileDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id =request.getParameter("id");
		String avgstar = request.getParameter("avgstar");
		MemberVO mvo=MemberDAO.getInstance().findMemberById(id);
		mvo.setstar(avgstar);
		request.setAttribute("mvo", mvo);
		request.setAttribute("url", "/member/profile.jsp");
		return "/template/bbs-layout.jsp";
	}

}
