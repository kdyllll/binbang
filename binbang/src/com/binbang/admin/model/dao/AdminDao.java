package com.binbang.admin.model.dao;

import static com.binbang.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.binbang.host.model.vo.Host;
import com.binbang.house.model.vo.House;
import com.binbang.member.model.vo.Complaint;
import com.binbang.member.model.vo.Member;
import com.binbang.member.model.vo.Reservation;

public class AdminDao {
	
	private Properties prop=new Properties();
	
	public AdminDao() {
		// TODO Auto-generated constructor stub
		try {
			String path=AdminDao.class.getResource("/sql/admin/admin_sql.properties").getPath();
			prop.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//회원 전체 리스트
		public List<Member> memberList(Connection conn){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Member> list=new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("memberListAll"));
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Member m = new Member();
					m.setMemberNo(rs.getString("member_no"));
					m.setEmail(rs.getString("email"));
					m.setMemberName(rs.getString("member_name"));
					m.setNickname(rs.getString("nickname"));
					m.setPhone(rs.getString("phone"));
					m.setEnrollDate(rs.getDate("enroll_date"));
					m.setStayDays(rs.getInt("stay_days"));
					m.setHostBlack(rs.getString("host_black"));
					m.setHostConfirm(rs.getString("host_confirm"));
					m.setPoint(rs.getInt("point"));
					list.add(m);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}return list;
			
		}
		
		//호스트 리스트
		public List<Host> hostList(Connection conn) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Host> list=new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("hostList"));
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Host h = new Host();
					h.setHostNo(rs.getString("host_no"));
					h.setMemberNo(rs.getString("member_no"));
					h.setHostName(rs.getString("member_name"));
					h.setMemberPhone(rs.getString("phone"));
					h.setHostEmail(rs.getString("email"));
					h.setIdCard(rs.getString("id_card"));
					h.setProfilePic(rs.getString("profile_pic"));
					h.setIntro(rs.getString("intro"));
					h.setComplaintCount(rs.getInt("complaint_count"));
					h.setHostEnrollDate(rs.getDate("host_enrolldate"));
					h.setHostAcceptDate(rs.getDate("host_acceptdate"));				
					h.setHostConfirm(rs.getString("host_confirm"));
					h.setHostBlack(rs.getString("host_black"));
					list.add(h);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}return list;
		}

		//호스트 승인
		public int hostAccept(Connection conn,String memberNo) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("hostAccept"));
				pstmt.setString(1, memberNo);
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(conn);
			}return result;
		}

		//호스트 거절
		public int hostDelete(Connection conn,String memberNo) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("hostDelete"));
				pstmt.setString(1, memberNo);
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(conn);
			}return result;
		}
		
		//예약 리스트 
		public List<Reservation> reserveList(Connection conn){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Reservation> list = new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("reserveList"));
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Reservation rv=new Reservation();
					rv.setReservationNo(rs.getString("reservation_no"));
					rv.setMemberNo(rs.getString("member_no"));
					rv.setHouseNo(rs.getString("house_no"));
					rv.setGuestName(rs.getString("guest_name"));
					rv.setCheckinDate(rs.getDate("checkin_date"));
					rv.setCheckoutDate(rs.getDate("checkout_date"));
					rv.setHouseRequest(rs.getString("house_request"));
					rv.setReservDate(rs.getDate("reserv_date"));
					rv.setPrice(rs.getInt("price"));
					list.add(rv);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}return list;
		}
		
		//숙소 리스트
		public List<House> houseList(Connection conn){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<House> list = new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("houseList"));
				rs=pstmt.executeQuery();
				while(rs.next()) {
					House h =new House();
					h.setHouseNo(rs.getString("house_no"));
					h.setHostNo(rs.getString("host_no"));
					h.setHouseName(rs.getString("house_name"));
					h.setHouseType(rs.getString("house_type"));
					h.setHouseLocation(rs.getString("house_location"));
					h.setPriceDay(rs.getInt("price_day"));
					h.setPriceWeekend(rs.getInt("price_weekend"));
					h.setPricePeakDay(rs.getInt("price_peak_day"));
					h.setPricePeakWeekend(rs.getInt("price_peak_weekend"));
					list.add(h);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}return list;
		}
		
		//신고리스트
		public List<Complaint> complainList(Connection conn){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Complaint> list = new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("complainList"));
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Complaint com=new Complaint();
					com.setComplaintNo(rs.getString("complaint_no"));
					//com.setHostName(rs.getString("ho"));
					list.add(com);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}return list;
		}
		
		
		//회원리스트 검색
		public List<Member> searchMemberList(Connection conn, String type, String key){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Member> list=new ArrayList();
			try {
				System.out.println("변경 전 : " +prop.getProperty("searchMemberList"));
				String sql=prop.getProperty("searchMemberList").replaceAll("@type", type);
				System.out.println("변경 후 : " + sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+key+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					Member m=new Member();
					m.setMemberNo(rs.getString("member_no"));
					m.setEmail(rs.getString("email"));
					m.setMemberName(rs.getString("member_name"));
					m.setNickname(rs.getString("nickname"));
					m.setPhone(rs.getString("phone"));
					m.setEnrollDate(rs.getDate("enroll_date"));
					m.setStayDays(rs.getInt("stay_days"));
					m.setHostBlack(rs.getString("host_black"));
					m.setHostConfirm(rs.getString("host_confirm"));
					m.setPoint(rs.getInt("point"));
					list.add(m);
					
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		
		//호스트 리스트 검색
		public List<Host> searchHostList(Connection conn, String type, String key){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Host> list=new ArrayList();
			try {
				System.out.println("변경 전 : " +prop.getProperty("searchHostList"));
				String sql=prop.getProperty("searchHostList").replaceAll("@type", type);
				System.out.println("변경 후 : " + sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+key+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					Host h = new Host();
					h.setHostNo(rs.getString("host_no"));
					h.setMemberNo(rs.getString("member_no"));
					h.setHostName(rs.getString("member_name"));
					h.setMemberPhone(rs.getString("phone"));
					h.setHostEmail(rs.getString("email"));
					h.setIdCard(rs.getString("id_card"));
					h.setProfilePic(rs.getString("profile_pic"));
					h.setIntro(rs.getString("intro"));
					h.setComplaintCount(rs.getInt("complaint_count"));
					h.setHostEnrollDate(rs.getDate("host_enrolldate"));
					h.setHostAcceptDate(rs.getDate("host_acceptdate"));				
					h.setHostConfirm(rs.getString("host_confirm"));
					h.setHostBlack(rs.getString("host_black"));
					list.add(h);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		
		//예약리스트 검색
		public List<Reservation> searchReserveList(Connection conn, String type, String key){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Reservation> list=new ArrayList();
			try {
				System.out.println("변경 전 : " +prop.getProperty("searchReserveList"));
				String sql=prop.getProperty("searchReserveList").replaceAll("@type", type);
				System.out.println("변경 후 : " + sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+key+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					Reservation rv=new Reservation();
					rv.setReservationNo(rs.getString("reservation_no"));
					rv.setMemberNo(rs.getString("member_no"));
					rv.setHouseNo(rs.getString("house_no"));
					rv.setGuestName(rs.getString("guest_name"));
					rv.setCheckinDate(rs.getDate("checkin_date"));
					rv.setCheckoutDate(rs.getDate("checkout_date"));
					rv.setHouseRequest(rs.getString("house_request"));
					rv.setReservDate(rs.getDate("reserv_date"));
					rv.setPrice(rs.getInt("price"));
					list.add(rv);
					
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		
		//숙소 리스트 검색
		public List<House> searchHouseList(Connection conn,String type,String key){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<House> list=new ArrayList();
			try {
				System.out.println("변경 전 : " +prop.getProperty("searchHouseList"));
				String sql=prop.getProperty("searchHouseList").replaceAll("@type", type);
				System.out.println("변경 후 : " + sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+key+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					House h=new House();
					h.setHouseNo(rs.getString("house_no"));
					h.setHostNo(rs.getString("host_no"));
					h.setHouseName(rs.getString("house_name"));
					h.setHouseType(rs.getString("house_type"));
					h.setHouseLocation(rs.getString("house_location"));
					h.setPriceDay(rs.getInt("price_day"));
					h.setPriceWeekend(rs.getInt("price_weekend"));
					h.setPricePeakDay(rs.getInt("price_peak_day"));
					h.setPricePeakWeekend(rs.getInt("price_peak_weekend"));
					list.add(h);
					
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
	
}
