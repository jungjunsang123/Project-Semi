package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.ApplyDAO;
import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;
import org.project.model.ScrapDAO;
//게시물 상세보기
public class DetailPostController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession(false);
      MemberVO mvo=(MemberVO) session.getAttribute("mvo");
      String bbs_no = request.getParameter("bbs_no");
      BBSVO vo = BBSDAO.getInstance().detailPostingByNo(bbs_no);
      
      if(mvo!=null) {
    	 String LoginId= mvo.getId();
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
         if(!LoginId.equals(vo.getVo().getId()) || LoginId=="") {
             BBSDAO.getInstance().updateBBSHit(bbs_no);
             vo=BBSDAO.getInstance().detailPostingByNo(bbs_no);
       }
      }
      request.setAttribute("pvo", vo);
      request.setAttribute("url", "/bbs/detailPost.jsp");
      return "template/bbs-layout.jsp";
   }

}