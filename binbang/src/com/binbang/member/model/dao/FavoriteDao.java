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
	
	//관심숙소 폴더 삭제
	public int deleteFolder(Connection conn, String fNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteFolder"));
			pstmt.setString(1, fNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
		
	
	//관심숙소 하나 조회(숙소번호와 폴더번호로)
	public Favorite selectContent(Connection conn,String houseNo,String folderNo,String memberNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Favorite f=new Favorite();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectContent"));			
			pstmt.setString(1, houseNo);			
			pstmt.setString(2, folderNo);			
			pstmt.setString(3, memberNo);			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				f.setFolderNo(rs.getString("folder_no"));
				f.setMemberNo(rs.getString("member_no"));
				f.setFolderName(rs.getString("folder_name"));
				f.setHouseNo(rs.getString("house_no"));
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return f;
	}
	
	//관심숙소 삭제
	public int deleteContent(Connection conn, String houseNo,String folderNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteContent"));
			pstmt.setString(1, houseNo);
			pstmt.setString(2, folderNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//관심숙소 삽입
		public int insertContent(Connection conn, String houseNo,String folderNo) {
			PreparedStatement pstmt = null;
			int result = 0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("insertContent"));
				pstmt.setString(1, houseNo);
				pstmt.setString(2, folderNo);
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}
		
	//폴더 이름	수정
		public int modifyFolder (Connection conn,Favorite f) {
			PreparedStatement pstmt=null;
			int rs=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("modifyFolder"));
				pstmt.setString(1, f.getFolderName());
				pstmt.setString(2, f.getFolderNo());
				rs=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return rs;			
		}
		
	//뒤로가기
		public Favorite selectMemberNo(Connection conn, String memberNo) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Favorite f=new Favorite();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("selectMemberNo"));
				pstmt.setString(1, memberNo);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					f.setFolderNo(rs.getString("folder_no"));
					f.setMemberNo(rs.getString("member_no"));
					f.setFolderName(rs.getString("folder_name"));
					f.setHouseNo(rs.getString("house_no"));
				}		
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return f;
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
					f.setFolderNo(rs.getString("folder_no"));																				
					f.setHouseNo(rs.getString("house_no"));
					f.setPictureName(rs.getString("picture_name"));
					f.setHouseName(rs.getString("house_name"));
					f.setHouseLocation(rs.getString("house_location"));
					
					list.add(f);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		
		//관심숙소 삭제
		public int removeContent(Connection conn, Favorite f) {
			PreparedStatement pstmt = null;
			int result = 0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("removeContent"));
				pstmt.setString(1, f.getHouseNo());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
			
		}
		
		public Favorite selectFolderName(Connection conn, String no) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Favorite f = null;
			
			try {
				pstmt=conn.prepareStatement(prop.getProperty("selectFolderName"));
				pstmt.setNString(1, no);
				rs= pstmt.executeQuery();
				if(rs.next()) {
					f = new Favorite();
					f.setFolderName(rs.getNString("folder_name"));
				}				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return f;
		}

		public List selectConList(Connection conn, String no) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List list=new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("selectConList"));
				pstmt.setNString(1, no);
				rs= pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getNString("house_no"));
				}				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		
	
}
