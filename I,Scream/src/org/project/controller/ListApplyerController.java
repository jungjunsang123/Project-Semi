package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.ApplyVO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class ListApplyerController implements Controller {
	// 고용주 게시물에서 지원한 사람출력
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url = "";
		String fromMypage="";
		// 세션이 끊겼는지 확인
		if (session != null && session.getAttribute("mvo") != null) {
			String bbs_no = request.getParameter("bbs_no"); // 게시물번호
			fromMypage = request.getParameter("mypage");
			ArrayList<MemberVO> list = ApplyDAO.getInstance().listApplyer(bbs_no);
			BBSVO vo = BBSDAO.getInstance().detailPostingByNo(bbs_no);
			request.setAttribute("ListApplyer", list);
			request.setAttribute("pvo", vo);
			
			url = "/bbs/detailPost_ListApplyer.jsp";
			
		} else {
			url = "/member/IsNotLogin.jsp";
		}
		request.setAttribute("url", url);
		//마이페이지에서 호출한것인지 확인
		if(fromMypage.equals("YES")) {
			return "/template/mypage-layout.jsp";
		}
		else
			return "template/bbs-layout.jsp";
		
	}

}
