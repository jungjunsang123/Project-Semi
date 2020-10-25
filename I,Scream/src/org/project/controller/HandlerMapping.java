package org.project.controller;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;
	}
	public Controller create(String command) {
		Controller controller=null;
		//로그인
		if(command.contentEquals("login")) {
			controller=new LoginController();
		}
		//kakaoLogin
		else if(command.equals("kakaoLogin"))
			controller = new KakaoLoginController();
		//kakaoLogout
		else if(command.equals("kakaoLogout"))
			controller = new KakaoLogoutController();
		else if(command.equals("AddPost"))
			controller = new AddPostController();
		else if(command.equals("AddPostForm"))
			controller = new AddPostFormController();
		//로그아웃
		else if(command.contentEquals("logout")) {
			controller=new LogoutController();
		}
		//회원정보수정하는 페이지로 이동
		else if(command.contentEquals("memberUpdateForm")) {
			controller=new MemberUpdateFormController();
		}
		else if(command.contentEquals("memberUpdate")) {
			controller=new MemberUpdateController();
		}
		else if(command.contentEquals("UpdateInfoResult")) {
			controller=new UpdateInfoResultController();
		}
		//회원가입
		else if(command.contentEquals("register")) {
			controller=new RegisterController();
		}else if(command.contentEquals("registerForm")) {
			controller=new RegisterFormController();
		//홈화면 이동
		}else if(command.contentEquals("home")) {
			controller=new HomeController();
		//회원가입 결과 
		}else if(command.contentEquals("registerResult")) {
			controller=new RegisterResultController();
		//아이디 확인
		}else if(command.contentEquals("idcheck")) {
			controller=new IdCheckController();
		}else if(command.equals("getPostList")) {
			controller = new getPostListController();
		}
		//작성자를 통한 게시물 리스트 출력
		else if(command.equals("findPostListById")) {
			controller = new FindPostListByIdController();
		}
		//게시물 상세보기
		/*
		 * else if (command.equals("DetailPost")) { controller=new
		 * DetailPostController(); }
		 */
		//게시물 스크랩
		else if (command.equals("Scrap")) {
			controller=new ScrapController();
		}
		else if (command.equals("scrapList")) {
			controller=new ScrapListController();
		}
		//게시물 수정
		else if (command.equals("UpdatePost")) {
			controller=new UpdatePostController();
		}
		//게시물 수정하는 목록으로 이동
		else if (command.equals("UpdatePostForm")) 
			controller=new UpdatePostFormController();
		//인기게시글 출력
		else if (command.equals("TopHitsPostList")) 
			controller=new TopHitsPostListController();
		else if (command.contentEquals("DeletePost")) {
			controller=new DeletePostController();
		}else if (command.contentEquals("AllPostCount")) {
			controller=new AllPostCountController();
		}else if (command.contentEquals("YoungPostCount")) {
			controller=new YoungPostCountController();
		}else if (command.contentEquals("OldPostCount")) {
			controller=new OldPostCountController();
		}else if (command.contentEquals("PetPostCount")) {
			controller=new PetPostCountController();
		//리뷰목록
		}else if(command.contentEquals("ReviewList")) {
			controller=new ReviewListController();
		//리뷰보기
		}else if(command.contentEquals("ReviewDetail")) {
			controller=new ReviewDetailController();
		//리뷰게시하기
		}else if(command.contentEquals("addReview")) {
			controller=new AddReviewController();
		}else if(command.contentEquals("AddReviewForm")) {
			controller=new AddReviewFormController();
		}
		//고용주 게시물에서 지원한 사람출력
		else if (command.contentEquals("listApplyer")) {
			controller=new ListApplyerController();
		}
		//채용하기 버튼 클릭시 채용된 지원자 외에 모두에게 알람 및 고용주에게 알람 발생
		else if (command.contentEquals("Recruit")) {
			controller=new RecruitController();
		}
		//지원현황 클릭시 리스트 출력
		else if (command.contentEquals("findApplyList")) {
			controller=new findApplyListController();
		}
		//지원하기
		else if(command.contentEquals("Apply")) {
			controller=new ApplyController();
		}
		//채용결과 확인
		else if(command.contentEquals("recruitResultConfirm")) {
			controller=new RecruitResultConfirmController();
		//제목 키워드로 검색하기
		}else if(command.contentEquals("searchByText")) {
			controller=new searchByTextController();
		}
		//우수사원(평균별점3.8 이상) 뽑아오기 
		else if(command.equals("bestemployee")) {
			controller = new BestEmployeeController();
		}
		//홈화면에서 프로필 디테일 받아오기
		else if(command.equals("getProfileDetail")) {
			controller = new GetProfileDetailController();
		}
		// SH: 아이돌봄 게시판 가져오기
		else if (command.contentEquals("YoungPostList")) {
		controller=new YoungPostListController();
		}// SH: 노인케어 게시판 가져오기
		else if (command.contentEquals("OldPostList")) {
		controller=new OldPostListController();
		}// SH: 반려동물 게시판 가져오기
		else if (command.contentEquals("PetPostList")) {
		controller=new PetPostListController();
		}
		//마이페이지
		else if (command.contentEquals("mypage")) {
		controller=new MypageController();
		}
	
		
		return controller; 

		}
	}





















