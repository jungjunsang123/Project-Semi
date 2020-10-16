package org.project.controller;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;
	}
	public Controller create(String command) {
		Controller controller=null;
		if(command.contentEquals("login")) {
			controller=new LoginController();
		}else if(command.equals("AddPost"))
			controller = new AddPostController();
		else if(command.equals("AddPostForm"))
			controller = new AddPostFormController();
		else if(command.contentEquals("logout")) {
			controller=new LogoutController();
		}else if(command.contentEquals("register")) {
			controller=new RegisterController();
		}else if(command.contentEquals("home")) {
			controller=new HomeController();
		}else if(command.contentEquals("registerForm")) {
			controller=new RegisterFormController();
		}else if(command.contentEquals("registerResult")) {
			controller=new RegisterResultController();
		}else if(command.contentEquals("idcheck")) {
			controller=new IdCheckController();
		}else if(command.equals("getPostList")) {
			controller = new getPostListController();
		}else if (command.equals("DetailPost")) {
			controller=new DeatilPostController();
		}else if (command.equals("UpdatePost")) {
			controller=new UpdatePostController();
		}else if (command.equals("UpdatePostForm")) {
			controller=new UpdatePostFormController();
		}else if (command.contentEquals("DeletePost")) {
			controller=new DeletePostController();
		}else if (command.contentEquals("AllPostCount")) {
			controller=new AllPostCountController();
		}else if (command.contentEquals("YoungPostCount")) {
			controller=new YoungPostCountController();
		}else if (command.contentEquals("OldPostCount")) {
			controller=new OldPostCountController();
		}else if (command.contentEquals("PetPostCount")) {
			controller=new PetPostCountController();
		}//고용주 게시물에서 지원한 사람출력
		else if (command.contentEquals("listApplyer")) {
			controller=new ListApplyerController();
		}//채용하기 버튼 클릭시 채용된 지원자 외에 모두에게 알람 및 고용주에게 알람 발생
		else if (command.contentEquals("Recruit")) {
			controller=new RecruitController();
		}else if (command.contentEquals("RecuitResult")) {
			controller=new RecruitResultController();
		}//지원현황 클릭시 리스트 출력
		else if (command.contentEquals("findApplyList")) {
			controller=new findApplyListController();
		}else if(command.contentEquals("ApplyForm")) {
			controller=new ApplyFormController();
		}
		return controller; 
	}
}






















