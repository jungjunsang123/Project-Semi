package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.metal.MetalComboBoxUI.MetalComboBoxLayoutManager;

import org.project.model.ApplyDAO;
import org.project.model.MemberVO;

public class ApplyController implements Controller {
// detailPost.jsp -> 로그인 한사람이 지원하기 버튼을 누름 -> controller -> 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String result = "";
		// 로그인 세션이 끊겼는지 확인
		if (session!=null && session.getAttribute("mvo") != null) {// 안끊겼을때
			String bbs_no = request.getParameter("bbs_no");
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			ApplyDAO.getInstance().apply(bbs_no, vo.getId());
			result = "OK";
		}
		else
			result="IsNotLogin";
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}
}
