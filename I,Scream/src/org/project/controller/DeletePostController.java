package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;

public class DeletePostController implements Controller {
//SH : mvo는 로그인 에 맞추어야 함 , 게시물 삭제
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		System.out.println("하이");
		if (session==null||request.getAttribute("mvo")==null||request.getMethod().equals("POST")==false) {
			return "redirect:index.jsp";
		}
		String bbs_no=request.getParameter("bbs_no");
		BBSDAO.getInstance().deletePosting(bbs_no);
		return "redirect:front?command=getPostList";
	}

}
