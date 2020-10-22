package org.project.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class KakaoLogoutController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		return "front?command=home"; //로그아웃 하면 홈으로 이동.
	}

}
