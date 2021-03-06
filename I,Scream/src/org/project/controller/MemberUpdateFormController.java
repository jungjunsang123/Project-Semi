package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class MemberUpdateFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			MemberVO fmvo = MemberDAO.getInstance().findMemberById(mvo.getId());
			request.setAttribute("fmvo", fmvo);
			url="/member/update-form.jsp";
		}
		else {
			url="/member/IsNotLogin.jsp";
		}
		
		return url;
	}

}
