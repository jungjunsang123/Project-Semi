package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class UpdateInfoResultController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		MemberVO fmvo = MemberDAO.getInstance().findMemberById(id);
		request.setAttribute("fmvo", fmvo);
		request.setAttribute("url", "/member/updateInfo-result.jsp");
		return "/template/layout.jsp";
	}

}
