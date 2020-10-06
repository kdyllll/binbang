package com.binbang.booking.model.service;

import java.util.List;

import com.binbang.booking.model.dao.BookingDao;
import com.binbang.booking.model.vo.Booking;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.getConnection;

import java.sql.Connection;

public class BookingService {
	private BookingDao dao = new BookingDao();
	public List<Booking> selectHouseRequest(String hostNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.selectHouseRequest(conn, hostNo);
		close(conn);
		return list;
	}
}
