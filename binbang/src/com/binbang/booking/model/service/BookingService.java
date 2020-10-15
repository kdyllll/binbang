package com.binbang.booking.model.service;

import java.util.ArrayList;
import java.util.List;

import com.binbang.booking.model.dao.BookingDao;
import com.binbang.booking.model.vo.Booking;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.rollback;
import static com.binbang.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookingService {
	private BookingDao dao = new BookingDao();
	public List<Booking> selectHouseRequest(String hostNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.selectHouseRequest(conn, hostNo);
		close(conn);
		return list;
	}
	
	public int deleteBooking(String reservNo) {
		Connection conn= getConnection();
		int result = dao.deleteBooking(conn,reservNo);
		if(result > 0 ) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int acceptBooking(String reservNo) {
		Connection conn = getConnection();
		int result = dao.acceptBooking(conn,reservNo);
		if(result > 0 ) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Booking> selectHouseRequestResultList(String hostNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.selectHouseRequestResultList(conn, hostNo);
		close(conn);
		return list;
	}
	
	public List<Booking> reserveDoneList(String memberNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.reserveDoneList(conn, memberNo);
		close(conn);
		return list;
	}
	
	public List<Booking> reservePointList(String memberNo){
		Connection conn = getConnection();
		List<Booking> list = dao.reservePointList(conn, memberNo);
		close(conn);
		return list;
	}
	
	public int reserveCancel(String reserveNo) {
		Connection conn = getConnection();
		int result = dao.reserveCancel(conn,reserveNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Booking> searchBookingList(String type, String key, String hNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.searchBookingList(conn, type, key , hNo);
		close(conn);
		return list;
		
	}
	
	public List<Booking> searchBookingReqList(String type, String key, String hNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.searchBookingReqList(conn, type, key , hNo);
		close(conn);
		return list;
		
	}
	
	public int insertReservation(Booking b) {
		Connection conn= getConnection();
		int result = dao.insertReservation(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertPoint(String memberNo, int totalPoint, int totalPoints) {
		Connection conn= getConnection();
		int result = dao.insertPoint(conn,memberNo, totalPoint ,totalPoints);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	

}
