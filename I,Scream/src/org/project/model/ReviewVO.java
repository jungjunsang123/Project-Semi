package org.project.model;

public class ReviewVO {
	private BBSVO bVO;
	private String review_context;
	private int stars;
	private boolean isReview;
	private boolean rightForReview;
	private String createDate;
	private MemberVO vo;
	
	public BBSVO getbVO() {
		return bVO;
	}
	public void setbVO(BBSVO bVO) {
		this.bVO=bVO;
	}
	public String getreview_context() {
		return review_context;
	}
	public void setreview_context(String review_context) {
		this.review_context=review_context;
	}
	public int getstars() {
		return stars;
	}
	public void setstars(int stars) {
		this.stars=stars;
	}
	public boolean getisReview() {
		return isReview;
	}
	public void setgetisReview(boolean isReview) {
		this.isReview=isReview;
	}
	public boolean getrightForReview() {
		return rightForReview;
	}
	public void setrighForReview(boolean rightForReview) {
		this.rightForReview=rightForReview;
	}
	public String getcreateDate() {
		return createDate;
	}
	public void setcreateDate(String createDate) {
		this.createDate=createDate;
	}
	public MemberVO getvo() {
		return vo;
	}
	public void setvo(MemberVO vo) {
		this.vo=vo;
	}
	public ReviewVO(BBSVO bVO, String review_context, int stars, boolean isReview, boolean rightForReview, String createDate, MemberVO vo) {
		super();
		this.bVO=bVO;
		this.review_context=review_context;
		this.stars=stars;
		this.isReview=isReview;
		this.rightForReview=rightForReview;
		this.createDate=createDate;
		this.vo=vo;
	}
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}