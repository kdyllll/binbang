package com.binbang.member.model.dao;

import static com.binbang.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public Favorite viewFolder(Connection conn,String memberNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Favorite f=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("viewFolder"));			
			pstmt.setString(1, memberNo);			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				f=new Favorite();
				f.setFolderNo(rs.getString("folder_no"));
				f.setMemberNo(rs.getString("member_no"));
				f.setFolderName(rs.getString("folder_name"));
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return f;
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
	
	
	
}
