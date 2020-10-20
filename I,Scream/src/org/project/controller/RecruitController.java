package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class RecruitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String result = "";
		//세션이 끊겼는지 확인
		if(session!=null&&session.getAttribute("mvo")!=null) {
			//지원자이외에는 db에 no라고 해줄게 필요함
			String bbs_no=request.getParameter("bbs_no");
			String applyID=request.getParameter("applyID");
			ApplyDAO.getInstance().recruit(bbs_no,applyID);
			result="OK";
		}
		else
			result="NO";
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
