package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class RegisterResultController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		MemberVO vo=MemberDAO.getInstance().findMemberById(id);
		request.setAttribute("mvo", vo);
		request.setAttribute("url", "/member/register-result.jsp");
		return "/template/layout.jsp";
	}

}
