package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;

public class UpdatePostFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("mvo") != null) {
			String bbs_no = request.getParameter("bbs_no");
			BBSVO vo = BBSDAO.getInstance().detailPostingByNo(bbs_no);
			request.setAttribute("updatePost", vo);
			request.setAttribute("url", "/bbs/updatePostForm.jsp");
		}
		else {
			request.setAttribute("url", "/member/IsNotLogin.jsp");
		}
		return "template/bbs-layout.jsp";
	}
}
