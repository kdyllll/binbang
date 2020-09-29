package com.binbang.member.model.vo;

import java.util.Date;

public class Member {
	
	private String memberNo;
	private String email;
	private String password;
	private String memberName;
	private String nickname;
	private String phone;
	private Date enrollDate;
	private String hostYn;
	private int stayDays;
	private int coupon;
	private String hostBlack;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberNo, String email, String password, String memberName, String nickname, String phone,
			Date enrollDate, String hostYn, int stayDays, int coupon, String hostBlack) {
		super();
		this.memberNo = memberNo;
		this.email = email;
		this.password = password;
		this.memberName = memberName;
		this.nickname = nickname;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getHostYn() {
		return hostYn;
	}

	public void setHostYn(String hostYn) {
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

	public String getHostBlack() {
		return hostBlack;
	}

	public void setHostBlack(String hostBlack) {
		this.hostBlack = hostBlack;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", email=" + email + ", password=" + password + ", memberName="
				+ memberName + ", nickname=" + nickname + ", phone=" + phone + ", enrollDate=" + enrollDate
				+ ", hostYn=" + hostYn + ", stayDays=" + stayDays + ", coupon=" + coupon + ", hostBlack=" + hostBlack
				+ "]";
	}
	
	

}
