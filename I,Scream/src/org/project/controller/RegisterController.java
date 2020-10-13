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
		String regDate=request.getParameter("regDate");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		MemberDAO.getInstance().register(new MemberVO(id,password,address,name,tel,regDate,sex,age));
		return "redirect:front?command=registerResult&id="+id;
	}
}
