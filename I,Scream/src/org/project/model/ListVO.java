package org.project.model;

import java.util.ArrayList;

public class ListVO {
	private ArrayList<BBSVO> list;
	private PagingBean pagingBean;
	public ListVO(ArrayList<BBSVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public ArrayList<BBSVO> getList() {
		return list;
	}
	public void setList(ArrayList<BBSVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}
