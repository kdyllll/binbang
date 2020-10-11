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
	
	//호스트 신고 승인
	public int acceptHostComplain(String hostNo) {
		Connection conn=getConnection();
		int result=dao.acceptHostComplain(conn, hostNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
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

}
