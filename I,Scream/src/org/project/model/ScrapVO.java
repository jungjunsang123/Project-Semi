package org.project.model;

public class ScrapVO {
	private String bbs_no;
	private String scraper;
	public String getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(String bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getScraper() {
		return scraper;
	}
	public void setScraper(String scraper) {
		this.scraper = scraper;
	}
	public ScrapVO(String bbs_no, String scraper) {
		super();
		this.bbs_no = bbs_no;
		this.scraper = scraper;
	}
	public ScrapVO() {
		super();
	}
	
	
}
