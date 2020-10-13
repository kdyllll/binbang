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

public class FavoriteDao {
	
	private Properties prop=new Properties();
	
	public FavoriteDao() {
		try {
			String path=FavoriteDao.class.getResource("/sql/member/favorite_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//heart(관심) 누른 숙소 화면에 띄어줌
	public List<Favorite> viewFolder(Connection conn,String memberNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Favorite> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("viewFolder"));			
			pstmt.setString(1, memberNo);			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Favorite f=new Favorite();
				f.setFolderNo(rs.getString("folder_no"));
				f.setMemberNo(rs.getString("member_no"));
				f.setFolderName(rs.getString("folder_name"));
				list.add(f);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	//관심숙소 폴더 생성
	public int createFolder(Connection conn,Favorite f) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("createFolder"));
			pstmt.setString(1, f.getMemberNo());
			pstmt.setString(2, f.getFolderName());			
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}return result;		
	}
	
	//해당 폴더 선택
	public List<Favorite> selectFolder(Connection conn, String folderNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Favorite> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectFolder"));			
			pstmt.setString(1, folderNo);			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Favorite f=new Favorite();
				f.setFolderName(rs.getString("folder_no"));
				f.setFolderName(rs.getString("member_no"));
				f.setFolderName(rs.getString("folder_name"));
				f.setFolderName(rs.getString("house_no"));
				list.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	//관심숙소 폴더 삭제
	public int deleteFolder(Connection conn, String folderNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteFolder"));
			pstmt.setString(1, folderNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
}
