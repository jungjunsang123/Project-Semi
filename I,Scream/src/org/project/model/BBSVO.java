package org.project.model;

public class BBSVO {
	private MemberVO vo;
	private String title;
	private String context;
	private int hits;
	private String createDate;
	private String Category;
	private String workTime;
	private String bbs_no;
	
	
	
	public MemberVO getVo() {
		return vo;
	}

	public void setVo(MemberVO vo) {
		this.vo = vo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(String bbs_no) {
		this.bbs_no = bbs_no;
	}

	public BBSVO() {
		super();
	}

	
	
	public BBSVO(MemberVO vo, String title, String context, String category, String workTime) {
		super();
		this.vo = vo;
		this.title = title;
		this.context = context;
		Category = category;
		this.workTime = workTime;
	}

	public BBSVO(MemberVO vo, String title, String context, int hits, String createDate, String category,
			String workTime, String bbs_no) {
		super();
		this.vo = vo;
		this.title = title;
		this.context = context;
		this.hits = hits;
		this.createDate = createDate;
		Category = category;
		this.workTime = workTime;
		this.bbs_no = bbs_no;
	}
	
	
	
	
	
}
