package org.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/front")
//이미지 업로드를 위한 초기 셋팅(참조:https://seokr.tistory.com/610)
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)   // 100 MB
public class DispatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.handleRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.handleRequest(request, response);
	}
	
	protected void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String command = request.getParameter("command");
			Controller controller = HandlerMapping.getInstance().create(command);
			String url = controller.execute(request, response);
			if (url.startsWith("redirect:"))
				response.sendRedirect(url.substring(9));
			else
				request.getRequestDispatcher(url).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace(); // 예외 메세지와 발생 경로를 모두 콘솔에 출력한다
			response.sendRedirect("error.jsp");
		}
	}

	
}
