package com.binbang.member.model.vo;

import java.util.Date;

public class Member {
	
	private String memberNo;
	private String email;
	private String password;
	private String name;
	private String nicname;
	private String phone;
	private Date enrollDate;
	private char hostYn;
	private int stayDays;
	private int coupon;
	private char hostBlack;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberNo, String email, String password, String name, String nicname, String phone,
			Date enrollDate, char hostYn, int stayDays, int coupon, char hostBlack) {
		super();
		this.memberNo = memberNo;
		this.email = email;
		this.password = password;
		this.name = name;
		this.nicname = nicname;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.hostYn = hostYn;
		this.stayDays = stayDays;
		this.coupon = coupon;
		this.hostBlack = hostBlack;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNicname() {
		return nicname;
	}

	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getHostYn() {
		return hostYn;
	}

	public void setHostYn(char hostYn) {
		this.hostYn = hostYn;
	}

	public int getStayDays() {
		return stayDays;
	}

	public void setStayDays(int stayDays) {
		this.stayDays = stayDays;
	}

	public int getCoupon() {
		return coupon;
	}

	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}

	public char getHostBlack() {
		return hostBlack;
	}

	public void setHostBlack(char hostBlack) {
		this.hostBlack = hostBlack;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", nicname=" + nicname + ", phone=" + phone + ", enrollDate=" + enrollDate + ", hostYn=" + hostYn
				+ ", stayDays=" + stayDays + ", coupon=" + coupon + ", hostBlack=" + hostBlack + "]";
	}
	
	
}
