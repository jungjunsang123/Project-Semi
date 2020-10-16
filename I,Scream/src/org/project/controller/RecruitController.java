package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class RecruitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String bbs_no=request.getParameter("bbs_no");
		String applyID=request.getParameter("applyID");
		String url ="";	
		//세션이 끊겼는지 확인
		if(session !=null&&session.getAttribute("mvo")!=null) {
			//지원자이외에는 db에 no라고 해줄게 필요함
			ApplyDAO.getInstance().recruit(bbs_no,applyID);
		}
		else {
			url="/member/IdNotLogin.jsp";
			return url;
		}
		
		return "redirect:command=recuitResult&&bbs_no="+bbs_no+"&id="+applyID;
	}

}
