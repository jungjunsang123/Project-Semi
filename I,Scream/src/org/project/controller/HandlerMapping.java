package org.project.controller;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;
	}
	public Controller create(String command) {
		Controller controller=null;
		if(command.equals("getPostList")) {
			controller = new getPostListController();
		}else if(command.equals("BBSDetail")) {
			
		}
		return controller; 
	}
}






















