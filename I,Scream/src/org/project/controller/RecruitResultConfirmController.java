package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.MemberVO;

public class RecruitResultConfirmController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String result = "";
		String hiredResult="";
		// 로그인 세션이 끊겼는지 확인
		if (session!=null && session.getAttribute("mvo") != null) {// 안끊겼을때
			String bbs_no = request.getParameter("bbs_no");
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			hiredResult = ApplyDAO.getInstance().recruitResultConfirm(bbs_no, vo.getId());
			//고용된 경우
			if(hiredResult.equals("YES"))
				result = "OK";
			//고용되지 않은 경우
			else if(hiredResult.equals("FAIL"))
				result="FAIL";
			else 
				result="NO";
		}
		else
			result="IsNotLogin";
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
