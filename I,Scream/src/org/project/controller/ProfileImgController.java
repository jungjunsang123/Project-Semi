package org.project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.project.model.MemberVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;

@WebServlet("/profileImg")
public class ProfileImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   /**
	    * 역할 : MemberDAO에 프로필 주소값 Text를 보내고, MultipartRequest 서버에 이미지 파일을 등록을한다. cos
	    * 라이브러리를 이용하여 MultipartRequest 이미지 업로드 방식
	    * MultipartRequest(request,저장고간,최대용량,한글인코딩,같은이름파일 처리방법 :
	    * DefaultFileRenamePolicy : 자동적으로 중복체크)
	    */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	      HttpSession session =request.getSession(false);
	      String message = "";
    		  //로그인 상태 확인
    		  if(session == null || session.getAttribute("mvo")==null) 
    	    	  message="IsNotLogin";
    	      else {
    	    	  MemberVO vo = (MemberVO)session.getAttribute("mvo");
    	    	  String mvoId = vo.getId();
    	    	  //실제 서버경로
    	    	  String path = request.getSession().getServletContext().getRealPath("/profile/"+mvoId+"/");// 최종 주소
    	    	 //workspace 경로//각자 바꾸기
    	    	  String workspace="C:\\Users\\Mr.K\\git\\Kosta-semiProject-i-Scream\\I,Scream\\WebContent\\profile\\"+mvoId;
    	    	  System.out.println(path);
    	    	  System.out.println(workspace);
    	    	  File fi = new File(path);
    	    	  File workspacefi = new File(workspace);
    	    	  if(!fi.exists())
    	    		  fi.mkdir();
    	    	  if(!workspacefi.exists())
    	    		  workspacefi.mkdirs();
    	    	  MultipartRequest mutipartRequest = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
    	  	            new DefaultFileRenamePolicy());
    	    	  //workspace 업로드
    	    	  File profileImg = mutipartRequest.getFile("profileImg");
    	    	 
	 	         message = profileImg.getName();
	 	         vo.setProfile_path(message);
	 	         session.setAttribute("vo",vo);
	
	 	        //Files.copy(원본파일패스, 복사파일패스, 파일옵션);
	 	        Path serverDir = Paths.get(path, message);
	 	       Path workDir = Paths.get(workspace, message);
	 	         Files.copy(serverDir,workDir,REPLACE_EXISTING);
    		  System.out.println(message);
    		  request.setAttribute("responsebody", message);
 	          request.getRequestDispatcher("/AjaxView").forward(request, response);
    	      }
	}
}

