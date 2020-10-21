package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.MemberVO;
import org.project.model.ScrapDAO;

public class ScrapController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String result = "";
		// 로그인 세션이 끊겼는지 확인
		if (session!=null && session.getAttribute("mvo") != null) {// 안끊겼을때
			String bbs_no = request.getParameter("bbs_no");
			String isScarp = request.getParameter("isScarp");
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			if(isScarp.equals("스크랩"))
				ScrapDAO.getInstance().addScrap(bbs_no,vo.getId());
			else
				ScrapDAO.getInstance().deleteScrap(bbs_no,vo.getId());
			result = "OK";
		}
		else
			result="IsNotLogin";
		
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}
}
