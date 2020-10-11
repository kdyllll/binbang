package com.binbang.member.model.dao;

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

import com.binbang.member.model.vo.Favorite;
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
		
	//로그인
	public Member selectMember(Connection conn, String email, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberNo(rs.getString("member_no"));
				m.setEmail(rs.getString("email"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setEnrollDate(rs.getDate("enroll_Date"));				
				m.setStayDays(rs.getInt("stay_Days"));
				m.setHostBlack(rs.getString("host_black"));				
				m.setHostConfirm(rs.getString("host_confirm"));
				m.setHostNo(rs.getString("host_no"));
				m.setPoint(rs.getInt("point"));
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
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getPhone());									
									
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//이메일 조회
	public String selectEmail(Connection conn,String name,String phone) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String email=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectEmail"));
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				email=rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return email;
	}
	
	
	//email중복확인
	public String emailCheck(Connection conn, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectEmailCheck"));
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getNString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;		
	}
	
	//mypage 조회
	public Member selectInfo(Connection conn, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberInfo"));
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();				
				m.setEmail(rs.getString("email"));				
				m.setMemberName(rs.getString("member_Name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setPoint(rs.getInt("point"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;		
	}
	
	
	//mypage 회원정보수정(비밀번호 이외)
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int rs=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));			
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());	
			rs=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return rs;
	}
	
	
	//mypage 탈퇴
	public int deleteMember(Connection conn, String email) {
		PreparedStatement pstmt = null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteMember"));
			pstmt.setString(1, email);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	

	//비밀번호 수정
	public int updatePassword(Connection conn,String email,String newPw) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePassword"));
			pstmt.setString(1,newPw);
			pstmt.setString(2, email);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	//로그인화면 아이디 확인용
	public Member selectMemberId(Connection conn,String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberId"));
			pstmt.setString(1,email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberNo(rs.getString("member_No"));
				m.setEmail(rs.getString("email"));
				m.setPassword(rs.getString("password"));
				m.setMemberName(rs.getString("member_Name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setEnrollDate(rs.getDate("enroll_Date"));				
				m.setStayDays(rs.getInt("stay_Days"));
				m.setHostBlack(rs.getString("host_Black"));				
				m.setPoint(rs.getInt("point"));
			}		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public List<Favorite> selectFavList(Connection conn,Member m){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Favorite> fList=new ArrayList<Favorite>();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectFavList"));
			pstmt.setString(1,m.getMemberNo());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Favorite f=new Favorite();
				f.setFolderNo(rs.getString("folder_no"));
				f.setMemberNo(rs.getString("member_no"));
				f.setFolderName(rs.getString("folder_name"));
				f.setHouseNo(rs.getString("house_no"));
				fList.add(f);
			}		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return fList;
	}
	
	
	
	
	
}
