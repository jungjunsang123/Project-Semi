package org.project.model;

public class ReviewVO {
	private BBSVO bVO;
	private String review_context;
	private int stars;
	private boolean isReview;
	private boolean rightForReview;
	private String createDate;
	private	MemberVO vo;
	
	
	public String getCreateDate() {
		return createDate;
	}



	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}



	public MemberVO getVo() {
		return vo;
	}



	public void setVo(MemberVO vo) {
		this.vo = vo;
	}



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



	public boolean isRightForReview() {
		return rightForReview;
	}



	public void setRightForReview(boolean rightForReview) {
		this.rightForReview = rightForReview;
	}



	public ReviewVO() {
		super();
	}



	public ReviewVO(BBSVO bVO, String review_context, int stars, boolean isReview, boolean rightForReview) {
		super();
		this.bVO = bVO;
		this.review_context = review_context;
		this.stars = stars;
		this.isReview = isReview;
		this.rightForReview = rightForReview;
	}
	
	
	
}
