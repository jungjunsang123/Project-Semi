package org.project.model;

public class MemberVO {
	private String id;
	private String password;
	private String address;
	private String name;
	private String tel;
	private String regDate;
	private String sex;
	private String birth;
	private String star;
	private String profile_path;
	
	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public String getstar() {
		return star;
	}

	public void setstar(String star) {
		this.star = star;
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


	public String getBirth() {
		return birth;
	}



	public void setBirth(String birth) {
		this.birth = birth;
	}



	public MemberVO() {
		super();
	}
	
	public MemberVO(String id, String password, String name,String star) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.star = star;
	}
	
	public MemberVO(String id, String password, String address, String name, String tel, String sex, String birth) {
		super();
		this.id = id;
		this.password = password;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.sex = sex;
		this.birth = birth;
	}

	public MemberVO(String id, String password, String address, String name, String tel, String regDate, String sex,
			String birth) {
		super();
		this.id = id;
		this.password = password;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.regDate = regDate;
		this.sex = sex;
		this.birth = birth;
	}
	public MemberVO(String id, String password, String address, String name, String tel, String regDate, String sex,
			String birth, String star,String profile_path) {
		super();
		this.id = id;
		this.password = password;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.regDate = regDate;
		this.sex = sex;
		this.birth = birth;
		this.star = star;
		this.profile_path = profile_path;
	}

	public MemberVO(String id, String address, String name, String tel, String regDate) {
		super();
		this.id = id;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.regDate = regDate;
	}


	
	
}
