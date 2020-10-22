package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.BBSDAO;
import org.project.model.BBSVO;
import org.project.model.ListVO;
import org.project.model.MemberDAO;
import org.project.model.MemberVO;
import org.project.model.PagingBean;

public class searchByTextController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int totalPostCount = BBSDAO.getInstance().getTotalPostCount();
		String searchtitlepageNo = request.getParameter("searchtitlepageNo");
		PagingBean searchTitlepagingBean = null;
		if(searchtitlepageNo==null) 
			searchTitlepagingBean = new PagingBean(totalPostCount);
		else
			searchTitlepagingBean = new PagingBean(totalPostCount,Integer.parseInt(searchtitlepageNo));
		//Paging for search_Context
		String searchtextpageNo = request.getParameter("searchtextContext");
		PagingBean searchContextpagingBean = null;
		if(searchtextpageNo==null)
			searchContextpagingBean = new PagingBean(totalPostCount);
		else
			searchContextpagingBean = new PagingBean(totalPostCount,Integer.parseInt(searchtextpageNo));
		//텍스트로 회원검색하는 메서드
		String searchText = request.getParameter("searchText");
		String searchById = request.getParameter("searchText");
		MemberVO searchmvo=MemberDAO.getInstance().findMemberById(searchById);
		request.setAttribute("sbymco", searchmvo);
		
		//텍스트로 타이틀 검색하는 메서드
		ArrayList<BBSVO> searchlist=BBSDAO.getInstance().searchIdTitleByText(searchText, searchTitlepagingBean);
		ListVO searchTitleListVO = new ListVO(searchlist, searchTitlepagingBean);
		request.setAttribute("slvo", searchTitleListVO);

		//텍스트로 작성한 게시글 검색하는 메서드
		ArrayList<BBSVO> searchContext=BBSDAO.getInstance().searchContextByText(searchText, searchContextpagingBean);
		ListVO searchContextListVO = new ListVO(searchContext, searchContextpagingBean);
		request.setAttribute("sclvo", searchContextListVO);
		
		request.setAttribute("url", "/bbs/SearchResult.jsp");
		return "/template/bbs-layout.jsp";
	}

}
