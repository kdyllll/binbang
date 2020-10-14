package com.binbang.booking.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				b.setHousePrice(rs.getInt("price_day"));
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
	//호스트 마이페이지에서 숙소현황 검색구문
	public List<Booking> searchBookingList(Connection conn, String type, String key, String hNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Booking> list = new ArrayList();
		try {
			String sql = prop.getProperty("searchBookingList").replaceAll("@type", type);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hNo);
			pstmt.setString(2, "%"+key+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	//호스트 마이페이지에서  숙소요청 검색구문
	public List<Booking> searchBookingReqList(Connection conn, String type, String key, String hNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Booking> list = new ArrayList();
		try {
			String sql = prop.getProperty("searchBookingReqList").replaceAll("@type", type);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hNo);
			pstmt.setString(2, "%"+key+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int insertReservation(Connection conn, Booking b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertReservation"));
			
			pstmt.setString(1, b.getMemberNo());// 회원번호
			pstmt.setString(2, b.getHouseNo());// 숙소 번호
			pstmt.setString(3, b.getGuestName());// 예약자 이름
			pstmt.setString(4, b.getInsertCheckInDate());// 일실날짜
			pstmt.setString(5, b.getInsertCheckOutDate());// 퇴실 날짜
			pstmt.setInt(6, b.getGuestPnum());// 예약인원
			pstmt.setString(7, b.getPaymentOption());// 결제 방법
			pstmt.setInt(8, b.getPrice());// 총금액
			pstmt.setInt(9, b.getPointPlus());// 적립금 적립
			pstmt.setInt(10, b.getPointMinus());// 적립금 차감
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertPoint(Connection conn, String memberNo,  int totalPoint, int totalPoints) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertPoint"));
			pstmt.setInt(1,  totalPoint);
			pstmt.setInt(2,  totalPoints);
			pstmt.setString(3, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	/*
	 * 예약 번호 숙소 명 숙박 기간 예약자 이름 예약자 번호 인원 적립금 결제 방법 가격
	 */
	
	public Booking selectBooking(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		Booking b = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBooking"));
			pstmt.setString(1, memberNo);
			rs= pstmt.executeQuery();
			while(rs.next() ) {
				b= new Booking();
				b.setReservationNo(rs.getString("reservation_no"));
				b.setHouseName(rs.getString("house_name"));
				b.setCheckInDate(rs.getDate("checkin_date"));
				b.setCheckOutDate(rs.getDate("checkout_date"));
				b.setGuestName(rs.getString("guest_name"));
				b.setGuestPnum(rs.getInt("guest_pnum"));
				b.setPointPlus(rs.getInt("point_plus"));
				b.setPointMinus(rs.getInt("point_minus"));
				b.setPaymentOption(rs.getString("payment_option"));
				b.setPrice(rs.getInt("price"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		} return b;
	}

}
