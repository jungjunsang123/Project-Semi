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
import org.project.model.ScrapDAO;

public class ListApplyerController implements Controller {
	// 고용주 게시물에서 지원한 사람출력
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String url = "";
		String fromMypage="";
		String bbs_no = request.getParameter("bbs_no"); // 게시물번호
		System.out.println(bbs_no);
		String LoginId="";
		BBSVO vo = BBSDAO.getInstance().detailPostingByNo(bbs_no);
		// 세션이 끊겼는지 확인
		if (session != null && session.getAttribute("mvo") != null) {
			MemberVO mvo = (MemberVO)session.getAttribute("mvo");
			LoginId= mvo.getId();
			System.out.println(vo.getVo().getId());
			System.out.println(LoginId);
			fromMypage = request.getParameter("mypage");
			System.out.println("fromMypage: "+fromMypage);

			//작성자와 로그인한 사용자가 같다면
			if(LoginId.equals(vo.getVo().getId())) {
				System.out.println("작성자와 로그인한 사용자가 같다");
				ArrayList<MemberVO> list = ApplyDAO.getInstance().listApplyer(bbs_no);
				request.setAttribute("ListApplyer", list);
			}
			//작성자와 로그인한 사용자가 다르면
			else {
				System.out.println("작성자와 로그인한 사용자가 다르다");
				 	BBSDAO.getInstance().updateBBSHit(bbs_no);
			       vo=BBSDAO.getInstance().detailPostingByNo(bbs_no);
				//해당 게시물을 지원했는지 확인.
				   boolean IsApply=false;
				   boolean IsScrap=false;
				   //현재 접속한 사용자가 게시물을 지원했는지 확인.
				   IsApply = ApplyDAO.getInstance().IsApply(bbs_no, mvo.getId());
				   //해당 게시물을 스크랩했는지 확인.
				   IsScrap = ScrapDAO.getInstance().IsScrap(bbs_no, mvo.getId());
				   request.setAttribute("IsApply", IsApply);
				   request.setAttribute("IsScrap", IsScrap);
				   //게시물 작성자 와 로그인한 사용자가 다른지 확인, 다를시에만 hit up
			}
		} 
		request.setAttribute("pvo", vo);
		url = "/bbs/detailPost_ListApplyer.jsp";
		request.setAttribute("url", url);
		//마이페이지에서 호출한것인지 확인
		if(fromMypage.equals("YES")) {
			return "/template/mypage-layout.jsp";
		}
		else{
			return "template/bbs-layout.jsp";
		}
	}
}
