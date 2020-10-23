package org.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.model.BBSVO;
import org.project.model.ListVO;
import org.project.model.MemberVO;
import org.project.model.PagingBean;
import org.project.model.ReviewDAO;
import org.project.model.ReviewListVO;
import org.project.model.ScrapDAO;
import org.project.model.ScrapListVO;
import org.project.model.ScrapVO;

public class ScrapListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session!=null&&session.getAttribute("mvo")!=null) {
			MemberVO vo = (MemberVO)session.getAttribute("mvo");
			int totalScrapCount=ScrapDAO.getInstance().getTotalScrapCount(vo.getId());
			String pageNo=request.getParameter("pageNo");
			PagingBean PagingBean=null;
			if(pageNo==null) {
				PagingBean=new PagingBean(totalScrapCount);
			}
				
			else
				PagingBean=new PagingBean(totalScrapCount, Integer.parseInt(pageNo));
			
			
			ArrayList<BBSVO> scrapList=ScrapDAO.getInstance().getScrapList(PagingBean,vo.getId());
			ListVO scrapListVO=new ListVO(scrapList, PagingBean);
			request.setAttribute("lvo", scrapListVO);
			request.setAttribute("url", "/member/scrapList.jsp");
			
		}else {
			return "/member/IsNotLogin.jsp";
		}
		
		return "/template/mypage-layout.jsp";
	}

}
