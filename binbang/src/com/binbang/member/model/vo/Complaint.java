package com.binbang.member.model.vo;

import java.util.Date;

public class Complaint {
	
	private String complaintNo;
	private String memberNo;
	private String hostNo;
	private String complaintCategory;
	private Long complaintDetail;
	private String complaintState;
	private Date complaintDate;
	private String complaintPic;
	private String hostName;
	private String memberName;
	
	public Complaint() {
		// TODO Auto-generated constructor stub
	}

	public Complaint(String complaintNo, String memberNo, String hostNo, String complaintCategory,
			Long complaintDetail, String complaintState, Date complaintDate, String complaintPic, String hostName,
			String memberName) {
		super();
		this.complaintNo = complaintNo;
		this.memberNo = memberNo;
		this.hostNo = hostNo;
		this.complaintCategory = complaintCategory;
		this.complaintDetail = complaintDetail;
		this.complaintState = complaintState;
		this.complaintDate = complaintDate;
		this.complaintPic = complaintPic;
		this.hostName = hostName;
		this.memberName = memberName;
	}

	public String getComplaintNo() {
		return complaintNo;
	}

	public void setComplaintNo(String complaintNo) {
		this.complaintNo = complaintNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getHostNo() {
		return hostNo;
	}

	public void setHostNo(String hostNo) {
		this.hostNo = hostNo;
	}

	public String getComplaintCategory() {
		return complaintCategory;
	}

	public void setComplaintCategory(String complaintCategory) {
		this.complaintCategory = complaintCategory;
	}

	public Long getComplaintDetail() {
		return complaintDetail;
	}

	public void setComplaintDetail(Long complaintDetail) {
		this.complaintDetail = complaintDetail;
	}

	public String getComplaintState() {
		return complaintState;
	}

	public void setComplaintState(String complaintState) {
		this.complaintState = complaintState;
	}

	public Date getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getComplaintPic() {
		return complaintPic;
	}

	public void setComplaintPic(String complaintPic) {
		this.complaintPic = complaintPic;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Complaint [complaintNo=" + complaintNo + ", memberNo=" + memberNo + ", hostNo=" + hostNo
				+ ", complaintCategory=" + complaintCategory + ", complaintDetail=" + complaintDetail
				+ ", complaintState=" + complaintState + ", complaintDate=" + complaintDate + ", complaintPic="
				+ complaintPic + ", hostName=" + hostName + ", memberName=" + memberName + "]";
	}

	
	

}
