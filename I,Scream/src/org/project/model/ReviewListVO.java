package org.project.model;

import java.util.ArrayList;

public class ReviewListVO {
	private ArrayList<ReviewVO> list;
	private PagingBean pagingBean;
	
	public ArrayList<ReviewVO> getList() {
		return list;
	}

	public void setList(ArrayList<ReviewVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	public ReviewListVO() {
		super();
	}

	public ReviewListVO(ArrayList<ReviewVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	
	
}
