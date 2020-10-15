package com.binbang.admin.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.binbang.admin.model.dao.AdminDao;
import com.binbang.booking.model.vo.Booking;
import com.binbang.host.model.vo.Host;
import com.binbang.house.model.vo.House;
import com.binbang.member.model.vo.Complaint;
import com.binbang.member.model.vo.Member;

public class AdminService {
	
private AdminDao dao=new AdminDao();
	
	//회원 전체 리스트
	public List<Member> selectMemberAll() {
		Connection conn=getConnection();
		List<Member> list=dao.memberList(conn);
		close(conn);
		return list;
	}
	
	//호스트 리스트
	public List<Host> hostList(){
		Connection conn=getConnection();
		List<Host> list=dao.hostList(conn);
		close(conn);
		return list;
	}
		
	//호스트 승인으로 값 바꾸기
	public int acceptHost(String memberNo) {
		Connection conn=getConnection();
		int result=dao.hostAccept(conn,memberNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//호스트 거절
	public int deleteHost(String memberNo) {
		Connection conn=getConnection();
		int result=dao.hostDelete(conn,memberNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//호스트 사진 삭제
	public int changeHostIdPic(String memberNo) {
		Connection conn=getConnection();
		int result=dao.changeHostIdPic(conn,memberNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//블랙리스트로 전환
	public int checkBlack(String memberNo) {
		Connection conn=getConnection();
		int result=dao.checkBlack(conn,memberNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//예약리스트
	public List<Booking> reserveList(){
		Connection conn=getConnection();
		List<Booking> list=dao.reserveList(conn);
		close(conn);
		return list;
	}
	
	//숙소리스트
	public List<House> houseList(){
		Connection conn=getConnection();
		List<House> list=dao.houseList(conn);
		close(conn);
		return list;
	}
	
	//신고 리스트
	public List<Complaint> complainList(){
		Connection conn=getConnection();
		List<Complaint> list=dao.complainList(conn);
		close(conn);
		return list;
	}
	//적립금 리스트
	public List<Booking> pointList(){
		Connection conn=getConnection();
		List<Booking> list=dao.pointList(conn);
		close(conn);
		return list;
	}
	
	//호스트 이메일
	public String selectHostEmail(String hostNo) {
		Connection conn=getConnection();
		String email=dao.selectHostEmail(conn, hostNo);
		close(conn);
		return email;
	}
	
	//호스트 신고 승인-카운트 변경
	public int acceptHostComplainCount(String hostNo) {
		Connection conn=getConnection();
		int result=dao.acceptHostComplainCount(conn, hostNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//호스트 신고 승인-상태 변경
	public int acceptHostComplainState(String complaintNo,String msg) {
		Connection conn=getConnection();
		int result=dao.acceptHostComplainState(conn, complaintNo, msg);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//호스트 권한 박탈
	public int hostOut(String hostNo) {
		Connection conn=getConnection();
		int result=dao.hostOut(conn, hostNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	//호스트 신고 팝업
	public Complaint hostComplainPopup(String complaintNo) {
		Connection conn=getConnection();
		Complaint com=dao.hostComplainPopup(conn,complaintNo);
		close(conn);
		return com;
	}
		
	//회원리스트 검색
	public List<Member> searchMemberList(String type, String key){
		Connection conn=getConnection();
		List<Member> list=dao.searchMemberList(conn,type,key);
		close(conn);
		return list;
	}
	//호스트 리스트 검색
	public List<Host> searchHostList(String type, String key){
		Connection conn=getConnection();
		List<Host> list=dao.searchHostList(conn,type,key);
		close(conn);
		return list;
	}
	
	//예약리스트 검색
	public List<Booking> searchReserveList(String type,String key){
		Connection conn=getConnection();
		List<Booking> list=dao.searchReserveList(conn,type,key);
		close(conn);
		return list;
	}
	
	//숙소리스트 검색
	public List<House> searchHouseList(String type,String key){
		Connection conn=getConnection();
		List<House> list=dao.searchHouseList(conn,type,key);
		close(conn);
		return list;
	}
	
	//호스트 신고리스트 검색
	public List<Complaint> searchComplainList(String type,String key){
		Connection conn=getConnection();
		List<Complaint> list=dao.searchComplainList(conn,type,key);
		close(conn);
		return list;
	}
	
	//적립금 검색
	public List<Booking> searchPointList(String type,String key){
		Connection conn=getConnection();
		List<Booking> list=dao.searchPointList(conn,type,key);
		close(conn);
		return list;
	}
}
