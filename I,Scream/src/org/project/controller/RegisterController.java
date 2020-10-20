package org.project.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.project.model.MemberDAO;
import org.project.model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String sex = request.getParameter("sex");
		String birth = request.getParameter("birth");
		String UPLOAD_DIR = "profile\\"+id; // 저장장소
		String applicationPath = request.getServletContext().getRealPath("");
		String uploadFilePath = applicationPath + UPLOAD_DIR;

		System.out.println(" LOG :: [서버 루트 경로] :: " + applicationPath);
		System.out.println(" LOG :: [파일 저장 경로] :: " + uploadFilePath);

		// creates the save directory if it does not exists
		File fileSaveDir = new File(uploadFilePath);
		
		// 파일 경로 없으면 생성
		if (!fileSaveDir.isDirectory()) {
			fileSaveDir.mkdirs();
		}
		
		String fileName = "";
		// Get all the parts from request and write it to the file on server
		for (Part part : request.getParts()) {
			getPartConfig(part);
			fileName = getFileName(part);
			System.out.println(" LOG :: [ 업로드 파일 경로 ] :: " + uploadFilePath + File.separator + fileName);
			part.write(uploadFilePath + File.separator + fileName);
		}
		MemberDAO.getInstance().register(new MemberVO(id,password,address,name,tel,null,sex,birth,uploadFilePath));
		return"redirect:front?command=registerResult&id="+id; // 리턴위치
		// 조정필요함
	}
	/**
	 * https://docs.oracle.com/javaee/6/api/javax/servlet/http/Part.html
	 * 
	 * multipart/form-data 사용시 HttpServletRequest의 멤버 변수 중 Part의 형태로 전달됨
	 * 
	 * @param part
	 */
	private void getPartConfig(Part part) {
		System.out.println("------------------------------------------------------------");
		System.out.println(" LOG :: [HTML태그의 폼태그 이름] :: " + part.getName());
		System.out.println(" LOG :: [ 파일 사이즈 ] :: " + part.getSize());
		for (String name : part.getHeaderNames()) {
			System.out.println(" LOG :: HeaderName :: " + name + ", HeaderValue :: " + part.getHeader(name) + "\n");
		}
		System.out.println("------------------------------------------------------------");
	}

	/**
	 * Utility method to get file name from HTTP header content-disposition
	 */
	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println(" LOG :: content-disposition 헤더 :: = " + contentDisp);
		for (String cd : contentDisp.split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf("=") +  1).trim().replace("\"", "");;
                int index = fileName.lastIndexOf(File.separator);
                return fileName.substring(index + 1);
            }
        }
		
		
		/*
		 * String[] tokens = contentDisp.split(";"); for (String token : tokens) { if
		 * (token.trim().startsWith("filename")) {
		 * System.out.println(" LOG :: 파일 이름 :: " + token); return
		 * token.substring(token.indexOf("=") + 2, token.length() - 1); } }
		 */
		return "";
	}
}


