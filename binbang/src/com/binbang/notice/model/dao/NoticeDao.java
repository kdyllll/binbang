package com.binbang.notice.model.dao;

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

import com.binbang.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop=new Properties();
	
	public NoticeDao() {
		try {
			String path=NoticeDao.class.getResource("/sql/notice/notice_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> noticeList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeList"));
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n=new Notice();
				n.setNoticeNo(rs.getString("notice_no"));
				n.setNoticeCategory(rs.getString("notice_category"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setNoticeContents(rs.getString("notice_contents"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int noticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeCount"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	
	public Notice noticeDatailView(Connection conn, String noticeNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeDetail"));
			pstmt.setString(1, noticeNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getString("notice_no"));
				n.setNoticeCategory(rs.getString("notice_category"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setNoticeContents(rs.getString("notice_contents"));

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeInsert"));
			pstmt.setString(1, n.getNoticeCategory());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContents());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	//공지사항 수정
	public int noticeUpdate(Connection conn,Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeUpdate"));
			pstmt.setString(1, n.getNoticeCategory());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContents());
			pstmt.setString(4, n.getNoticeNo());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int noticeDelete(Connection conn,String noticeNo) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeDelete"));
			pstmt.setString(1, noticeNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//이전글
	public Notice prevNotice(Connection conn,String noticeNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("prevNotice"));
			pstmt.setString(1, noticeNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getString("prev_notice_no"));
				n.setNoticeCategory(rs.getString("prev_notice_category"));
				n.setNoticeTitle(rs.getString("prev_notice_title"));
				n.setNoticeDate(rs.getDate("prev_notice_date"));
				n.setNoticeContents(rs.getString("prev_notice_contents"));

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	
	//다음글
	public Notice nextNotice(Connection conn,String noticeNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("nextNotice"));
			pstmt.setString(1, noticeNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getString("next_notice_no"));
				n.setNoticeCategory(rs.getString("next_notice_category"));
				n.setNoticeTitle(rs.getString("next_notice_title"));
				n.setNoticeDate(rs.getDate("next_notice_date"));
				n.setNoticeContents(rs.getString("next_notice_contents"));

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
}
