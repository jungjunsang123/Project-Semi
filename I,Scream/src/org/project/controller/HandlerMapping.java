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
		}else if(command.contentEquals("ReviewList")) {
			controller=new ReviewListController();
		}else if(command.contentEquals("ReviewDetail")) {
			controller=new ReviewDetailController();
		}else if(command.contentEquals("addReview")) {
			controller=new AddReviewController();
		}else if(command.contentEquals("AddReviewForm")) {
			controller=new AddReviewFormController();
		}
		return controller; 
	}
}






















