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

public class getPostListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null) {
			
		}
		int totalPostCount = BBSDAO.getInstance().getTotalPostCount();
		String pageNo = request.getParameter("pageNo");
	      PagingBean pagingBean = null;
	      if(pageNo==null) {
	         pagingBean = new PagingBean(totalPostCount);
	      }else
	       pagingBean = new PagingBean(totalPostCount,Integer.parseInt(pageNo));
	      ArrayList<BBSVO> list=BBSDAO.getInstance().getPostingList(pagingBean);
	      ListVO listVO = new ListVO(list, pagingBean);
	      request.setAttribute("lvo", listVO);
	      
	      request.setAttribute("url", "/bbs/BBSAllList.jsp");      
	      return "/template/bbs-layout.jsp";
	}

}
