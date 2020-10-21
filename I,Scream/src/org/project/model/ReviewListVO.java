package org.project.model;

import java.util.ArrayList;

public class ReviewListVO {
	private ArrayList<ReviewVO> reviewList;
	private PagingBean pagingBean;
	public ArrayList<ReviewVO> getReviewList() {
		return reviewList;
	}
	public void setReviewList(ArrayList<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	public ReviewListVO(ArrayList<ReviewVO> reviewList, PagingBean pagingBean) {
		super();
		this.reviewList = reviewList;
		this.pagingBean = pagingBean;
	}
	public ReviewListVO() {
		super();
	}
	
	
	
}
