package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		MemberVO vo=MemberDAO.getInstance().login(id, password);
		if(vo==null) {
			return "/member/login-fail.jsp"; //로그인 실패 화면
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("mvo", vo);
			return "redirect:front?command=home"; //로그인 성공 화면 홈으로 
		}
	}
}
