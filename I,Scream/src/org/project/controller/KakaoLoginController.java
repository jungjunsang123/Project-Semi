package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class KakaoLoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String result="";
		MemberVO vo = new MemberVO(id, "NULL", name, "NULL");
		boolean register_flag = MemberDAO.getInstance().idcheck(id);
		//회원가입이 안된 상태
		if(!register_flag)
			MemberDAO.getInstance().register(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("mvo", vo);
		result = name;
		request.setAttribute("responsebody", result);
		return "AjaxView";	
	}

}
