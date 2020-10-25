package org.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;


public class UpdatePostController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if (session==null||session.getAttribute("mvo")==null||request.getMethod().equals("POST")==false) {
			return "redirect:front?command=getPostList";
		}
		
		String title=request.getParameter("title");
		String context=request.getParameter("context");
		String category=request.getParameter("category");
		String startWorkTime=request.getParameter("startworkTime");
		String endWorkTime=request.getParameter("endworkTime");
		String bbs_no= request.getParameter("bbs_no");
		//작성자가 수정한 게시물 정보 받아오기
		BBSVO vo=new BBSVO();
		vo.setBbs_no(bbs_no);
		vo.setTitle(title);
		vo.setContext(context);
		vo.setCategory(category);
		vo.setStartWorkTime(startWorkTime);
		vo.setEndWorkTime(endWorkTime);
		//DB테이블에 UPDATE하기 위해 BBSDAO 호출
		BBSDAO.getInstance().updatePosting(vo);
		
		
		return "redirect:front?command=listApplyer&bbs_no="+bbs_no+"&mypage=";
	}
}
