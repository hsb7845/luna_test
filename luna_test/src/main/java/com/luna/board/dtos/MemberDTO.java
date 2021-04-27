package com.luna.board.dtos;

import java.util.Date;

public class MemberDTO {
	private String id;
	private String pwd;
	private String email;
	private String email_chk;
	private String address;
	private Date birth;
	private String sex;
	private int phone;
	private Date joindate;
	private String admin;
	private String nickName;
	private String name;
	private int point;
	
	
	
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String id, String pwd, String email, String email_chk, String address, Date birth, String sex,
			int phone, Date joindate, String admin, String nickName, String name, int point) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.email_chk = email_chk;
		this.address = address;
		this.birth = birth;
		this.sex = sex;
		this.phone = phone;
		this.joindate = joindate;
		this.admin = admin;
		this.nickName = nickName;
		this.name = name;
		this.point = point;
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
	public String getEmail_chk() {
		return email_chk;
	}
	public void setEmail_chk(String email_chk) {
		this.email_chk = email_chk;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
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
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", email=" + email + ", email_chk=" + email_chk + ", address="
				+ address + ", birth=" + birth + ", sex=" + sex + ", phone=" + phone + ", joindate=" + joindate
				+ ", admin=" + admin + ", nickName=" + nickName + ", name=" + name + ", point=" + point + "]";
	}
	
	
}
