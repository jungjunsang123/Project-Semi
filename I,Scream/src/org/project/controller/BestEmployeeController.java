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
		ArrayList<MemberVO> avgStar_list = ReviewDAO.getInstance().getAVGStar();
		Random rand = new Random();
		int r_size = avgStar_list.size();
		/*
		 * for(int i=0 ; i<10 ; i++) { int iValue = rand.nextInt(r_size);// 1 <= iValue
		 * < 원하는 별점 이상의 멤버 수 System.out.println("이번 랜덤 회원은 ? :"+iValue); // 랜덤 멤버인덱스
		 * System.out.println("=======================");
		 * System.out.println(avgStar_list.get(iValue).getId());
		 * System.out.println(avgStar_list.get(iValue).getstar());
		 * System.out.println("======================="); }
		 */
		int iValue = rand.nextInt(r_size);
		String bestMember = avgStar_list.get(iValue).getId();
		System.out.println("랜덤 회원 아이디 : "+ bestMember);
		String result=bestMember;
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}
}
