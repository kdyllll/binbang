package com.binbang.booking.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.binbang.admin.model.dao.AdminDao;
import com.binbang.booking.model.vo.Booking;
import static com.binbang.common.JDBCTemplate.close;

public class BookingDao {
	private Properties prop = new Properties();

	public BookingDao() {
		try {
			String path = AdminDao.class.getResource("/sql/booking/booking_sql.properties").getPath();
			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Booking> selectHouseRequest(Connection conn, String hostNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Booking> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectHouseRequest"));
			pstmt.setString(1, hostNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Booking b = new Booking();
				b.setReservationNo(rs.getString("reservation_no"));
				b.setMemberNo(rs.getString("member_no"));
				b.setHouseNo(rs.getString("house_no"));
				b.setGuestName(rs.getString("guest_name"));
				b.setCheckInDate(rs.getDate("checkin_date"));
				b.setCheckOutDate(rs.getDate("checkout_date"));
				b.setGuestPnum(rs.getInt("guest_pnum"));
				b.setPaymentOption(rs.getString("payment_option"));
				b.setPrice(rs.getInt("price"));
				b.setReservDate(rs.getDate("reserv_date"));
				b.setMemberEmail(rs.getString("email"));
				b.setHouseName(rs.getString("house_name"));
				b.setPointPlus(rs.getInt("point_plus"));
				b.setPointMinus(rs.getInt("point_minus"));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Booking> selectHouseRequestResultList(Connection conn, String hostNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Booking> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectHouseRequestResult"));
			pstmt.setString(1, hostNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Booking b = new Booking();
				b.setReservationNo(rs.getString("reservation_no"));
				b.setMemberNo(rs.getString("member_no"));
				b.setHouseNo(rs.getString("house_no"));
				b.setGuestName(rs.getString("guest_name"));
				b.setCheckInDate(rs.getDate("checkin_date"));
				b.setCheckOutDate(rs.getDate("checkout_date"));
				b.setGuestPnum(rs.getInt("guest_pnum"));
				b.setPaymentOption(rs.getString("payment_option"));
				b.setPrice(rs.getInt("price"));
				b.setApprovalDate(rs.getDate("approval_date"));
				b.setMemberEmail(rs.getString("email"));
				b.setHouseName(rs.getString("house_name"));
				b.setHouseRequest(rs.getString("house_request"));
				b.setPointPlus(rs.getInt("point_plus"));
				b.setPointMinus(rs.getInt("point_minus"));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int deleteBooking(Connection conn, String reservNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteReservation"));
			pstmt.setString(1, reservNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int acceptBooking(Connection conn, String reservNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("acceptReservation"));
			pstmt.setString(1, reservNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Booking> reserveDoneList(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Booking> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("reserveDoneHouseList"));
			pstmt.setString(1, memberNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Booking b = new Booking();
				b.setReservationNo(rs.getString("reservation_no"));
				b.setHouseNo(rs.getString("house_no"));
				b.setCheckInDate(rs.getDate("checkin_date"));
				b.setCheckOutDate(rs.getDate("checkout_date"));
				b.setGuestPnum(rs.getInt("guest_pnum"));
				b.setPaymentOption(rs.getString("payment_option"));
				b.setPrice(rs.getInt("price"));
				b.setApprovalDate(rs.getDate("approval_date"));
				b.setHouseName(rs.getString("house_name"));
				b.setHouseRequest(rs.getString("house_request"));
				b.setHouseMainPic(rs.getString("picture_name"));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int reserveCancel(Connection conn, String reservNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("reserveCancel"));
			pstmt.setString(1, reservNo);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		} return result;
	}

}
