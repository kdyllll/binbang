package com.binbang.host.model.vo;

import java.sql.Date;

public class Host {
	
	private String hostEmail;
	private String hostName;
	private String hostNo;
	private String memberNo;
	private String memberName;
	private String memberPhone;
	private String idCard;
	private String profilePic;
	private String intro;
	private int complaintCount;
	private Date hostEnrollDate;
	private Date hostAcceptDate;
	private String hostConfirm;
	private String hostBlack; 
	
	public Host() {
		// TODO Auto-generated constructor stub
	}

	public Host(String hostEmail, String hostName, String hostNo, String memberNo, String memberName,
			String memberPhone, String idCard, String profilePic, String intro, int complaintCount, Date hostEnrollDate,
			Date hostAcceptDate, String hostConfirm, String hostBlack) {
		super();
		this.hostEmail = hostEmail;
		this.hostName = hostName;
		this.hostNo = hostNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.idCard = idCard;
		this.profilePic = profilePic;
		this.intro = intro;
		this.complaintCount = complaintCount;
		this.hostEnrollDate = hostEnrollDate;
		this.hostAcceptDate = hostAcceptDate;
		this.hostConfirm = hostConfirm;
		this.hostBlack = hostBlack;
	}

	public String getHostEmail() {
		return hostEmail;
	}

	public void setHostEmail(String hostEmail) {
		this.hostEmail = hostEmail;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getHostNo() {
		return hostNo;
	}

	public void setHostNo(String hostNo) {
		this.hostNo = hostNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getComplaintCount() {
		return complaintCount;
	}

	public void setComplaintCount(int complaintCount) {
		this.complaintCount = complaintCount;
	}

	public Date getHostEnrollDate() {
		return hostEnrollDate;
	}

	public void setHostEnrollDate(Date hostEnrollDate) {
		this.hostEnrollDate = hostEnrollDate;
	}

	public Date getHostAcceptDate() {
		return hostAcceptDate;
	}

	public void setHostAcceptDate(Date hostAcceptDate) {
		this.hostAcceptDate = hostAcceptDate;
	}

	public String getHostConfirm() {
		return hostConfirm;
	}

	public void setHostConfirm(String hostConfirm) {
		this.hostConfirm = hostConfirm;
	}

	public String getHostBlack() {
		return hostBlack;
	}

	public void setHostBlack(String hostBlack) {
		this.hostBlack = hostBlack;
	}

	@Override
	public String toString() {
		return "Host [hostEmail=" + hostEmail + ", hostName=" + hostName + ", hostNo=" + hostNo + ", memberNo="
				+ memberNo + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", idCard=" + idCard
				+ ", profilePic=" + profilePic + ", intro=" + intro + ", complaintCount=" + complaintCount
				+ ", hostEnrollDate=" + hostEnrollDate + ", hostAcceptDate=" + hostAcceptDate + ", hostConfirm="
				+ hostConfirm + ", hostBlack=" + hostBlack + "]";
	}


	
	
}
