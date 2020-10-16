package org.project.model;

public class ApplyVO {
	private String bbs_no;
	private MemberVO vo;
	private boolean hiredResult;
	public String getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(String bbs_no) {
		this.bbs_no = bbs_no;
	}
	public MemberVO getVo() {
		return vo;
	}
	public void setVo(MemberVO vo) {
		this.vo = vo;
	}
	public boolean isHiredResult() {
		return hiredResult;
	}
	public void setHiredResult(boolean hiredResult) {
		this.hiredResult = hiredResult;
	}
	public ApplyVO(String bbs_no, MemberVO vo, boolean hiredResult) {
		super();
		this.bbs_no = bbs_no;
		this.vo = vo;
		this.hiredResult = hiredResult;
	}
	public ApplyVO() {
		super();
	}
	
	
}
