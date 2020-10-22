package org.project.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;
import org.project.model.ReviewDAO;

public class HomeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<MemberVO> AVGchild_list = ReviewDAO.getInstance().getAVGStar("아이돌봄");
		ArrayList<MemberVO> AVGsenior_list = ReviewDAO.getInstance().getAVGStar("노인돌봄");
		ArrayList<MemberVO> AVGpet_list = ReviewDAO.getInstance().getAVGStar("반려동물");
		MemberVO Bchild_vo=new MemberVO();
		MemberVO Bsenior_vo=new MemberVO();
		MemberVO Bpet_vo=new MemberVO();
		if(AVGchild_list.size()<=0) {
			//System.out.println("어린이돌봄 베스트 없음");
			Bchild_vo=null;
		}else {
			Random rand = new Random();
			int r_size = AVGchild_list.size();
			int iValue = rand.nextInt(r_size);
			String bestMember = AVGchild_list.get(iValue).getId();
			Bchild_vo =MemberDAO.getInstance().findMemberById(bestMember);			
			Bchild_vo.setstar(AVGchild_list.get(iValue).getstar());
		}		
		if(AVGsenior_list.size()<=0) {
			Bsenior_vo=null;
		}else {
			Random rand = new Random();
			int r_size = AVGsenior_list.size();
			int iValue = rand.nextInt(r_size);
			String bestMember = AVGsenior_list.get(iValue).getId();
			Bsenior_vo =MemberDAO.getInstance().findMemberById(bestMember);
			Bsenior_vo.setstar(AVGsenior_list.get(iValue).getstar());
		}
		if(AVGpet_list.size()<=0) {
			Bpet_vo=null;
		}else {
			Random rand = new Random();
			int r_size = AVGpet_list.size();
			int iValue = rand.nextInt(r_size);
			String bestMember = AVGpet_list.get(iValue).getId();
			Bpet_vo =MemberDAO.getInstance().findMemberById(bestMember);
			Bpet_vo.setstar(AVGpet_list.get(iValue).getstar());
		}
		request.setAttribute("Bchild_vo", Bchild_vo);
		request.setAttribute("Bsenior_vo", Bsenior_vo);
		request.setAttribute("Bpet_vo", Bpet_vo);
		request.setAttribute("url", "/home.jsp");
		return "/template/layout.jsp";
	}

}
