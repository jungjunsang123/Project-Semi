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
		}
		else if(command.equals("addBBS"))
			controller = new AddBBSController();
		else if(command.contentEquals("logout")) {
			controller=new LogoutController();
		}else if(command.contentEquals("register")) {
			controller=new RegisterController();
		}
		return controller; 
	}
}






















