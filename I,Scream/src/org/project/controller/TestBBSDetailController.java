package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.MemberVO;

public class TestBBSDetailController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session=request.getSession(false);
      if(session==null||session.getAttribute("mvo")==null) {
         return "redirect:index.jsp";
      }else {
         MemberVO mvo=(MemberVO) session.getAttribute("mvo");
         String LoginId=mvo.getId();
        // System.out.println(LoginId);
         String no= request.getParameter("no");
         BBSVO pvo=BBSDAO.getInstance().getPostDetail(no);
        // System.out.println(pvo.getVo().getId());
          if(pvo.getVo().getId()!=LoginId) {
            BBSDAO.getInstance().updateBBSHit(no);
              pvo=BBSDAO.getInstance().getPostDetail(no);
          }
          request.setAttribute("pvo",pvo);
      }
      return "test2.jsp";
   }
}
