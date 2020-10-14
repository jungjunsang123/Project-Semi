package org.project.model;

public class MemberVO {
	private String id;
	private String password;
	private String address;
	private String name;
	private String tel;
	private String regDate;
	private String sex;
	private String age;
	public MemberVO(String id, String password, String address, String name, String tel, String regDate, String sex,
			String age) {
		super();
		this.id = id;
		this.password = password;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.regDate = regDate;
		this.sex = sex;
		this.age = age;
	}
	public MemberVO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	
	
	
}
