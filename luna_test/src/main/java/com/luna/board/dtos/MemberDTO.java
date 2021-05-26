package com.luna.board.dtos;

import java.util.Date;




public class MemberDTO {
	private String id;
	private String pwd;
	private String email;
	private String adr1;
	private String adr2;
	private String adr3;
	private String adr4;
	private Date birth;
	private String sex;
	private String phone;
	private Date joindate;
	private String admin;
	private String nickName;
	private String name;
	private int point;
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", email=" + email + ", adr1="
				+ adr1 + ", adr2=" + adr2 + ", adr3=" + adr3 + ", adr4=" + adr4 + ", birth=" + birth + ", sex=" + sex
				+ ", phone=" + phone + ", joindate=" + joindate + ", admin=" + admin + ", nickName=" + nickName
				+ ", name=" + name + ", point=" + point + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdr1() {
		return adr1;
	}

	public void setAdr1(String adr1) {
		this.adr1 = adr1;
	}

	public String getAdr2() {
		return adr2;
	}

	public void setAdr2(String adr2) {
		this.adr2 = adr2;
	}

	public String getAdr3() {
		return adr3;
	}

	public void setAdr3(String adr3) {
		this.adr3 = adr3;
	}

	public String getAdr4() {
		return adr4;
	}

	public void setAdr4(String adr4) {
		this.adr4 = adr4;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public MemberDTO(String id, String pwd, String email, String adr1, String adr2, String adr3,
			String adr4, Date birth, String sex, String phone, Date joindate, String admin, String nickName, String name,
			int point) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.adr1 = adr1;
		this.adr2 = adr2;
		this.adr3 = adr3;
		this.adr4 = adr4;
		this.birth = birth;
		this.sex = sex;
		this.phone = phone;
		this.joindate = joindate;
		this.admin = admin;
		this.nickName = nickName;
		this.name = name;
		this.point = point;
	}


	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
	
	