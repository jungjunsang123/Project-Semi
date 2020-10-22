package org.project.model;

import java.util.ArrayList;

public class ScrapListVO {
	private ArrayList<ScrapVO> list;
	private PagingBean pagingBean;
	
	public ScrapListVO(ArrayList<ScrapVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public ArrayList<ScrapVO> getList() {
		return list;
	}
	public void setList(ArrayList<ScrapVO> list) {
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
