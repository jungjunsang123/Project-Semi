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
			return "redirect:index.jsp";
		}
		String title=request.getParameter("title");
		String context=request.getParameter("context");
		String category=request.getParameter("category");
		String worktime=request.getParameter("worktime");
		BBSVO vo=new BBSVO();
		vo.setBbs_no(request.getParameter("bbs_no"));
		vo.setTitle(title);
		vo.setContext(context);
		vo.setCategory(category);
		vo.setWorkTime(worktime);
		BBSDAO.getInstance().updatePosting(vo);
		String path="redirect:front?command=PostDetailNoHits&no="+vo.getBbs_no();
		return path;
	}

}
