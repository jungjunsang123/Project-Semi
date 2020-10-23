package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;

public class DeletePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		//로그인 상태 여부 확인
		if (session==null||session.getAttribute("mvo")==null||request.getMethod().equals("POST")==false) {
			return "redirect:front?command=home";
		}
		String bbs_no=request.getParameter("bbs_no");
		BBSDAO.getInstance().deletePosting(bbs_no);
		return "redirect:front?command=getPostList";
	}
}
