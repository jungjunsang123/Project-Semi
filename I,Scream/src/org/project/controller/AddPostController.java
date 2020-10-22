package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class AddPostController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {
		//포스트 업로드를 위한 정보 수집
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String title = request.getParameter("title");
			String context = request.getParameter("context");
			String category = request.getParameter("category");
			String startWorkTime = request.getParameter("StartWorkTime");
			String endWorkTime = request.getParameter("EndWorkTime");
			BBSVO bbsvo = new BBSVO(title, context, category, startWorkTime, endWorkTime, mvo);
		//Board Table에 insert 해주는 메소드 호출
			BBSDAO.getInstance().addBBS(bbsvo);
		}
		else {
			url="/member/IsNotLogin.jsp";
			return url;
		}
		return "redirect:bbs/addPost_result.jsp";
	}
}
