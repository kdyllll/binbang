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
		List<Booking> list = dao.reserveDoneList(conn,memberNo);
		close(conn);
		return list;
	}
	
	
	
	
}
