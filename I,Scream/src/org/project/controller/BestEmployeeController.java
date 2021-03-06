package org.project.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberVO;
import org.project.model.ReviewDAO;

public class BestEmployeeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String category =request.getParameter("아이돌봄");
		String result="null";
		ArrayList<MemberVO> avgStar_list = ReviewDAO.getInstance().getAVGStar("아이돌봄");
		System.out.println(avgStar_list.size());
		
		if(avgStar_list.size() <=0) {
			request.setAttribute("responsebody", result);
			return "AjaxView";
		}else {
			Random rand = new Random();
			int r_size = avgStar_list.size();
			int iValue = rand.nextInt(r_size);
			String bestMember = avgStar_list.get(iValue).getId();
			System.out.println("랜덤 회원 아이디 : "+ bestMember);
			System.out.println("랜덤 회원 평점 : "+avgStar_list.get(iValue).getstar());
			result=bestMember;
			request.setAttribute("responsebody", result);
			return "AjaxView";
		}		
	}
}
