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
import com.binbang.member.model.vo.Member;

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
	
	public List<Member> memberList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("memberListAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setMemberNo(rs.getString("member_No"));
				m.setEmail(rs.getString("email"));
				m.setMemberName(rs.getString("member_Name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setEnrollDate(rs.getDate("enroll_Date"));				
				m.setStayDays(rs.getInt("stay_Days"));
				m.setCoupon(rs.getInt("coupon"));
				m.setHostBlack(rs.getString("host_black"));				

				list.add(m);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}return list;
		
	}
	
	//호스트 승인 리스트
	public List<Host> hostAcceptList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Host> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("hostAcceptList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Host h = new Host();
				h.setHostNo(rs.getString("host_no"));
				h.setMemberNo(rs.getString("member_no"));
				h.setMemberName(rs.getString("member_name"));
				h.setMemberPhone(rs.getString("phone"));
				h.setIdCard(rs.getString("id_card"));
				h.setProfilePic(rs.getString("profile_pic"));
				h.setIntro(rs.getString("intro"));
				h.setComplaintCount(rs.getInt("complain_count"));
				h.setHostEnrollDate(rs.getDate("host_enrolldate"));
				h.setHostAcceptDate(rs.getDate("host_acceptdate"));				
				h.setHostConfirm(rs.getString("host_confirm"));
				list.add(h);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}return list;
	}

}
