package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String sex=request.getParameter("sex");
		String birth=request.getParameter("birth");
		MemberDAO.getInstance().register(new MemberVO(id,password,address,name,tel,sex,birth));
		return "redirect:front?command=registerResult&id="+id; //리턴위치 조정필요함
	}
}
