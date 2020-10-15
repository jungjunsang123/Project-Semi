package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;
//게시물 상세보기
public class DeatilPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		String LoginId="";
		if(mvo!=null) {
			LoginId= mvo.getId();
		}
		String bbs_no = request.getParameter("bbs_no");
		BBSVO vo = BBSDAO.getInstance().detailPostingByNo(bbs_no);
		
		if(!LoginId.equals(vo.getVo().getId()) || LoginId=="") {
            BBSDAO.getInstance().updateBBSHit(bbs_no);
              vo=BBSDAO.getInstance().detailPostingByNo(bbs_no);
          }
		request.setAttribute("pvo", vo);
		request.setAttribute("url", "/bbs/detailPost.jsp");
		return "template/bbs-layout.jsp";
	}

}
