package org.project.model;

public class ReviewVO {
	private BBSVO bVO;
	private String review_context;
	private int stars;
	private boolean isReview;
	private String createDate;
	private	MemberVO giveReviewer; //리뷰를 받는 사람
	private	MemberVO getReviewer; //리뷰를 주는 사람
	public BBSVO getbVO() {
		return bVO;
	}
	public void setbVO(BBSVO bVO) {
		this.bVO = bVO;
	}
	public String getReview_context() {
		return review_context;
	}
	public void setReview_context(String review_context) {
		this.review_context = review_context;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public boolean isReview() {
		return isReview;
	}
	public void setReview(boolean isReview) {
		this.isReview = isReview;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public MemberVO getGiveReviewer() {
		return giveReviewer;
	}
	public void setGiveReviewer(MemberVO giveReviewer) {
		this.giveReviewer = giveReviewer;
	}
	public MemberVO getGetReviewer() {
		return getReviewer;
	}
	public void setGetReviewer(MemberVO getReviewer) {
		this.getReviewer = getReviewer;
	}
	public ReviewVO(BBSVO bVO, String review_context, int stars, boolean isReview, String createDate,
			MemberVO giveReviewer, MemberVO getReviewer) {
		super();
		this.bVO = bVO;
		this.review_context = review_context;
		this.stars = stars;
		this.isReview = isReview;
		this.createDate = createDate;
		this.giveReviewer = giveReviewer;
		this.getReviewer = getReviewer;
	}
	public ReviewVO() {
		super();
	}
	
	
	  
   
}