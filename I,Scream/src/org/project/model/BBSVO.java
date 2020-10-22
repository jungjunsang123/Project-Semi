package org.project.model;

public class BBSVO {
	private String bbs_no;
	private String title;
	private String context;
	private int hits;
	private String createDate;
	private String category;
	private String startWorkTime;
	private String endWorkTime;
	private MemberVO vo;
	private String hiredResult;
	private ReviewVO reviewVO;

	
	
	public BBSVO(String bbs_no, String title, String context, int hits, String createDate, String category,
			MemberVO vo) {
		super();
		this.bbs_no = bbs_no;
		this.title = title;
		this.context = context;
		this.hits = hits;
		this.createDate = createDate;
		this.category = category;
		this.vo = vo;
	}

	public ReviewVO getReviewVO() {
		return reviewVO;
	}

	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}

	public String getHiredResult() {
		return hiredResult;
	}

	public void setHiredResult(String hiredResult) {
		this.hiredResult = hiredResult;
	}

	public String getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(String bbs_no) {
		this.bbs_no = bbs_no;
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
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStartWorkTime() {
		return startWorkTime;
	}

	public void setStartWorkTime(String startWorkTime) {
		this.startWorkTime = startWorkTime;
	}

	public String getEndWorkTime() {
		return endWorkTime;
	}

	public void setEndWorkTime(String endWorkTime) {
		this.endWorkTime = endWorkTime;
	}

	public MemberVO getVo() {
		return vo;
	}

	public void setVo(MemberVO vo) {
		this.vo = vo;
	}

	public BBSVO() {
		super();
	}

	public BBSVO(String title, String context, String category, String startWorkTime, String endWorkTime, MemberVO vo) {
		super();
		this.title = title;
		this.context = context;
		this.category = category;
		this.startWorkTime = startWorkTime;
		this.endWorkTime = endWorkTime;
		this.vo = vo;
	}

	public BBSVO(String bbs_no, String title, String context, int hits, String createDate, String category,
			String startWorkTime, String endWorkTime, MemberVO vo) {
		super();
		this.bbs_no = bbs_no;
		this.title = title;
		this.context = context;
		this.hits = hits;
		this.createDate = createDate;
		this.category = category;
		this.startWorkTime = startWorkTime;
		this.endWorkTime = endWorkTime;
		this.vo = vo;
	}

	public BBSVO(String bbs_no, String title, String context, int hits, String createDate, String category,
			MemberVO vo, String hiredResult) {
		super();
		this.bbs_no = bbs_no;
		this.title = title;
		this.context = context;
		this.hits = hits;
		this.createDate = createDate;
		this.category = category;
		this.vo = vo;
		this.hiredResult = hiredResult;
	}
	
	
	
	

}
