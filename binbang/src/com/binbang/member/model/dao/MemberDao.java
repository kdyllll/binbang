package com.binbang.member.model.dao;

import static com.binbang.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.binbang.member.model.vo.Member;


public class MemberDao {

	private Properties prop=new Properties();
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
		
	//회원조회
	public Member selectMember(Connection conn, String email, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("searchMember"));
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberNo(rs.getString("memberNo"));
				m.setEmail(rs.getString("email"));
				m.setPassword(rs.getString("password"));
				m.setMemberName(rs.getString("memberName"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setEnrollDate(rs.getDate("enrollDate"));
				m.setHostYn(rs.getString("hostYn"));
				m.setStayDays(rs.getInt("stayDays"));
				m.setCoupon(rs.getInt("coupon"));
				m.setHostBlack(rs.getString("hostBlack"));				
			}		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	//회원가입
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberNo());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPassword());
			pstmt.setString(4, m.getMemberName());
			pstmt.setString(5, m.getNickname());
			pstmt.setString(6, m.getPhone());			
			pstmt.setString(7, m.getHostYn());
			pstmt.setInt(8, m.getStayDays());
			pstmt.setInt(9, m.getCoupon());
			pstmt.setString(10, m.getHostBlack());			
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//중복확인
	
	//mypage 조회
	
	//mypage 수정
	
	//mypage 탈퇴
	
	//mypage 비밀번호수정
	
	
	
}
