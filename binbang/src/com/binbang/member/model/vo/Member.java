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
	private int stayDays;
	private String hostBlack;
	private String hostConfirm;
	private String hostNo;
	private int totalPoint;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberNo, String email, String password, String memberName, String nickname, String phone,
			Date enrollDate, int stayDays, String hostBlack, String hostConfirm, String hostNo, int totalPoint) {
		super();
		this.memberNo = memberNo;
		this.email = email;
		this.password = password;
		this.memberName = memberName;
		this.nickname = nickname;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.stayDays = stayDays;
		this.hostBlack = hostBlack;
		this.hostConfirm = hostConfirm;
		this.hostNo = hostNo;
		this.totalPoint = totalPoint;
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

	public int getStayDays() {
		return stayDays;
	}

	public void setStayDays(int stayDays) {
		this.stayDays = stayDays;
	}

	public String getHostBlack() {
		return hostBlack;
	}

	public void setHostBlack(String hostBlack) {
		this.hostBlack = hostBlack;
	}

	public String getHostConfirm() {
		return hostConfirm;
	}

	public void setHostConfirm(String hostConfirm) {
		this.hostConfirm = hostConfirm;
	}

	public String getHostNo() {
		return hostNo;
	}

	public void setHostNo(String hostNo) {
		this.hostNo = hostNo;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", email=" + email + ", password=" + password + ", memberName="
				+ memberName + ", nickname=" + nickname + ", phone=" + phone + ", enrollDate=" + enrollDate
				+ ", stayDays=" + stayDays + ", hostBlack=" + hostBlack + ", hostConfirm=" + hostConfirm + ", hostNo="
				+ hostNo + ", totalPoint=" + totalPoint + "]";
	}


}
