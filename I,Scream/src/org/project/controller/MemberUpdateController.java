package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class MemberUpdateController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String id = mvo.getId();
			System.out.println(id);
			MemberDAO.getInstance().ProfileImgUpload(mvo.getId(), mvo.getProfile_path());// 아이디, 프로필 이미지 Url
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String address = request.getParameter("address");
			String sex = request.getParameter("sex");
			String birth = request.getParameter("birth");
			System.out.println(name);
			MemberDAO.getInstance().updateInfo(new MemberVO(id,password,address,name,tel,null,sex,birth));
			mvo = MemberDAO.getInstance().findMemberById(id);
			System.out.println(mvo.getName());
			session.setAttribute("mvo", mvo);
			url=id;
		}
		else {
			url="/member/IsNotLogin.jsp";
			return url;
		}
		
		return "redirect:front?command=UpdateInfoResult&id="+url;
	}

}
