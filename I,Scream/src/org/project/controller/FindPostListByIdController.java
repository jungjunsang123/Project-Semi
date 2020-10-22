package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.ListVO;
import org.project.model.MemberVO;
import org.project.model.PagingBean;

public class FindPostListByIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		String url="";
		//로그인 여부 확인
		if(session==null||session.getAttribute("mvo")==null) {
			return "/member/IsNotLogin.jsp";
		}
		MemberVO vo = (MemberVO)session.getAttribute("mvo");
		//전체 게시물 수 확인
		int totalPostCount=BBSDAO.getInstance().getTotalPostCount();
		String pageNo=request.getParameter("pageNo");
		//id 추출
		String id = vo.getId();
		PagingBean pagingBean=null;
		
		if(pageNo==null)
			pagingBean=new PagingBean(totalPostCount);
		else
			pagingBean=new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		
		ArrayList<BBSVO> list=BBSDAO.getInstance().findPostListById(pagingBean,id);
		ListVO lvo=new ListVO(list, pagingBean);
		request.setAttribute("lvo",lvo);
			url="/bbs/findPostListById_result.jsp";
		request.setAttribute("url", url);
			
		return "/template/mypage-layout.jsp";
	}

}
